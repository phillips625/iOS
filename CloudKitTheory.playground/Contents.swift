//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//////////////////The CloudKit Framework provides applications with access to the iCloud servers hosted by Apple and provides an easy to use way to store, manage and retrieve data and other asset types (such as large binary files, videos and images) in a structured way.////////////////////////////////////

//////////////////// CloudKit Containers
//Each CloudKit enabled application has at least one container on iCloud. The container for an application is represented in the CloudKit Framework by the CKContainer class and it is within these containers that the databases reside. Containers may also be shared between multiple applications. A reference to an application’s default cloud container can be obtained via a call to the defaultContainer method of the CKContainer class:
let container = CKContainer.defaultContainer()

////////////////////// CloudKit Public Database
//Each cloud container contains a single public database. This is the database into which is stored data that is needed by all users of an application. A map application, for example, might have a set of data about locations and routes that are applicable to all users of the application. This data would be stored within the public database of the application’s cloud container. CloudKit databases are represented within the CloudKit Framework by the CKDatabase class. A reference to the public cloud database for a container can be obtained via the publicCloudDatabase property of a container instance:
let publicDatabase = container.publicCloudDatabase

///////////////////// CloudKit Private Databases
//Private cloud databases are used to store data that is private to each specific user. Each cloud container, therefore, will contain one private database for each user of the application. A reference to the private cloud database can be obtained via the privateCloudDatabase property of the container object:
let privateDatabase = container.privateCloudDatabase

///////////////////// Data Storage and Transfer Quotas
//Data and assets stored in the public cloud database of an application count against the storage quota of the application. Anything stored in a private database, on the other hand, is counted against the iCloud quota of the corresponding user. Applications should, therefore, try to minimize the amount of data stored in private databases to avoid users having to unnecessarily purchase additional iCloud storage space. At the time of writing, each application begins with 50MB of public database storage space and 5GB of space for assets free of charge. In addition, each application starts with an initial 25MB per day of free data transfer for assets and 250Kb for database data. For each additional application user, the free storage quotas increase by 100MB and 1MB for assets and database data respectively. Data transfer quotas also increase by 0.5MB per day and 5KB per day for assets and data for each additional user. As long as these quota limits are not exceeded, the resources remain free up to a limit of 1PB for assets and 10TB for databases. Maximum data transfer quotas are 5TB per day for assets and 50GB per day for databases.
    The latest quota limits can be reviewed online at: https://developer.apple.com/icloud/documentation/cloudkit-storage/

/////////////////////////////// CloudKit Records
// Data is stored in both the public and private databases in the form of records. Records are represented by the CKRecord class and are essentially dictionaries of key-value pairs where keys are used to reference the data values stored in the record. A wide range of data types can be stored in a record including strings, numbers, dates, arrays, locations, data objects and references to other records. New key-value fields may be added to a record at any time without the need to perform any database restructuring. Records in a database are categorized by a record type which must be declared when the record is created and takes the form of a string value.

let myRecord = CKRecord(recordType: "Schools")
myRecord.setObject("Silver Oak Elementary", forKey: "schoolname")
myRecord.setObject("100 Oak Street", forKey: "address")
myRecord.setObject(150, forKey: "studentcount")

publicDatabase.saveRecord(myRecord, completionHandler: ({returnRecord, error in

if let err = error {
    // save operation failed
} else {
// save operation succeeded 
}
}))

/////////////////////////// CloudKit References
//CloudKit references are implemented using the CKReference class and provide a way to establish relationships between different records in a database. A reference is established by creating a CKReference instance for an originating record and assigning to it the record to which the relationship is to be targeted. The CKReference object is then stored in the originating record as a key-value pair field. A single record can contain multiple references to other records.

///////////////////// CloudKit Assets
// In addition to data, CloudKit may also be used to store larger assets such as audio or video files, large documents, binary data files or images. These assets are stored within CKAsset instances. Assets can only be stored as part of a record and it is not possible to directly store an asset in a cloud database. Once created, an asset is added to a record as just another key-value field pair. The following code, for example, demonstrates the addition of an image asset to a record:
let imageAsset = CKAsset(fileURL: imageURL)
let myRecord = CKRecord(recordType: "Vacations")

myRecord.setObject("London", forKey: "city")
myRecord.setObject(imageAsset, forKey: "photo")

///////////////////// CloudKit Subscriptions
//CloudKit subscriptions allow users to be notified when a change occurs within the cloud databases belonging to an installed app. Subscriptions use the standard iOS push notifications infrastructure and can be triggered based on a variety of criteria such as when records are added, updated or deleted. Notifications can also be further refined using predicates so that notifications are based on data in a record matching certain criteria.

/////////////////////  CloudKit Dashboard
//The CloudKit Dashboard is a web based portal that provides an interface for managing the CloudKit options and storage for applications.
https://icloud.developer.apple.com/dashboard/ 









