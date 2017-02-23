////////////////////////////// http://sqlite.org/

////////To launch an interactive SQLite session, open a Terminal window on your Mac OS X system, change directory to a suitable location and run the following command:
sqlite3 ./mydatabase.db

///////// At the sqlite> prompt, commands may be entered to perform tasks such as creating tables and inserting and retrieving data. For example, to create a new table in our database with fields to hold ID, name, address and phone number fields the following statement is required. Note that each row in a table must have a primary key that is unique to that row. In the above example we have designated the ID field as the primary key, declared it as being of type integer and asked SQLite to automatically increment the number each time a row is added. This is a common way to make sure that each row has a unique primary key. The remaining fields are each declared as being of type text.
create table contacts (id integer primary key autoincrement, name text, address text, phone text);

////////// To list the tables in the currently selected database use the .tables statement: 
sqlite> .tables
contacts

////////// To insert records into the table:
sqlite> insert into contacts (name, address, phone) values ("Bill Smith", "123 Main Street, California", "123-555-2323");
sqlite> insert into contacts (name, address, phone) values ("Mike Parks", "10 Upping Street, Idaho", "444-444-1212");

////////// To retrieve all rows from a table:
sqlite> select * from contacts;
1|Bill Smith|123 Main Street, California|123-555-2323
2|Mike Parks|10 Upping Street, Idaho|444-444-1212

////////// To extract a row that meets specific criteria:
sqlite> select * from contacts where id=2;
2|Mike Parks|10 Upping Street, Idaho|444-444-1212

//////////To exit from the sqlite3 interactive environment:
sqlite> .exit

////////// Key FMDB Classes
/*
When implementing a database using SQLite with FMDB it will be necessary to utilize a number of FMDB classes contained within the wrapper. A summary of the most commonly used classes is as follows:
. FMDatabase – Used to represent a single SQLite database. The object on which SQL statements are executed from within code.
. FMResultSet – Used to hold the results of a SQL query operation on an FMDatabase instance.
. FMDatabaseQueue – A version of FMDatabase designed to allow database queries to be performed from multiple threads.
 
For more detailed information, the FMDB Class Reference documentation is available online at: http://ccgus.github.io/fmdb/html/Classes/FMDatabase.html
 */

////////////// Creating and Opening a Database

////// Before work can commence on a database it must first be created and opened. The following code opens the database file at the path specified by <database file path>. If the database file does not already exist it will be created when the FMDatabase instance is initialized:

let myDatabase = FMDatabase(path: <database file path>)
if myDatabase == nil {
    // Database could not be found or created
} else {
    if myDatabase.open() {
        // Database is ready }
}

    //////////////////////// Creating a Database Table
    ////Database data is organized into tables. Before data can be stored into a database, therefore, a table must first be created. This is achieved using the SQL CREATE TABLE statement. The following code example illustrates the creation of a table named contacts using FMDB:
    
    let sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)"
    if !myDatabase.executeStatements(sql_stmt) {
// Table creation failed 
}

///////////////////////////////////// Extracting Data from a Database Table

    /////////// In the following code excerpt, a SQL SELECT statement is used to extract the address and phone fields from all the rows of a database table named contacts via a call to the executeQuery method of the FMDatabase instance. On completion of the query execution, the FMResults object returned from the method call contains the results of the query. Regardless of whether one or more results are expected, the next method of the returned FMResultSet object must be called. A false return value from the next method call indicates either that no results were returned, or that the end of the result set has been reached.
    let querySQL = "SELECT address, phone FROM CONTACTS WHERE name = '\(name.text)'"
    let results:FMResultSet? = myDatabase.executeQuery(querySQL, withArgumentsInArray: nil)

 
    ///////////// In the event that results were returned, the data can be accessed using the column name as a key. The following code, for example, outputs the “address” and “phone” values for all of the matching records returned as the result of the above query operation:
    while results?.next() == true {
        println(results?.stringForColumn("address"))
        println(results?.stringForColumn("phone"))
}

    ////////////////////////////////// Closing a SQLite Database
    //////////When an application has finished working on a database it is important that the database be closed. This is achieved with a call to the close method of the FMDatabase instance: 
    
    myDatabase.close()











 
 
 
 
 