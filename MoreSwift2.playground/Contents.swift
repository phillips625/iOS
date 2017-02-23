//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class BankAccount
    {
    //Class properties
        var accountBalance : Float
        var accountNumber : Int
    
        init (number: Int, balance: Float)
        {
            accountBalance = balance
            accountNumber = number
        }
    
        func displayBalance()
        {
            print ("Number: \(accountNumber)")
            print ("Balance: \(accountBalance)")
        }
    }

///////////////////////////////INHERITANCE

///SavingsAccount inherits the characteristics of BankAccount. Inherits all the methods and properties of BankAccount
class SavingsAccount: BankAccount
    {
        var interestRate : Float = 0 //Specifies that interestRate must be a float
    
        /// SavingsAccount also inherits the initialiser, "init", from the SUPERCLASS
        init(number: Int, balance: Float, rate: Float)
        {
            //Property of the subclass
            interestRate = rate
            //Inherited from super class
            super.init(number: number, balance: balance)
        }
    
        func calculateInterest() ->Float //Return type is a Float
        {
            return interestRate * accountBalance
        }
    
    /////OVERRIDING INHERITED METHODS - Helps to override methods to adapt it to what you need it for
    /// 2 rules to overriding methods
    //1. Must take the exact number of number and type of parameters as parent method
    //2. Must have the same return type as parent method
        override func displayBalance()
        {
            /*
            print ("Number: \(accountNumber)")
            print ("Balance: \(accountBalance)")
            print ("Prevailing Interest Rate = \(interestRate)")
            */
            
                        //OR
            super.displayBalance() ////super = BankAccount
            print ("Prevailing Interest Rate = \(interestRate)")
        }
    }

var savings1 = SavingsAccount (number: 873378, balance: 10000, rate: 0.05)

//Prints function from SavingsAccount
print (savings1.calculateInterest())

//Prints "override" func
savings1.displayBalance()





///////////////////////////////ARRAYS AND DICTIONARY COLLECTIONS IN SWIFT

/////// 2 types of collections
// 1. Mutable - array that can be changed (var)
// 2. Immutable - array that cannot be changed (const or let)

///Swift uses type inference to detect that the array has Strings in them and prevents other data types from being inserted in them
//////////////MUTABLE
var food1 = ["oranges","mangos","bananas"]

//////////////IMMUTABLE
let food = ["oranges","mangos","bananas"]
                //OR
//let food2 : [String] = ["oranges","mangos","bananas"] //Specifies that the array is a String

var priceArray = [Float]() ////Specifies EMPTY array that ONLY accept float

///////Setting the size of an array
var computer = [String](count : 10, repeatedValue : "Linux") //Repeats "Linux" 10 times

/////Combining Arrays
var firstArray = ["cal","lif","ornia"]
var secondArray = ["typ","ical"]

var thirdArray = firstArray + secondArray

////////////////////////////METHODS WORKING WITH ARRAY

//Array item count
var treeArray = ["cal","lif","ornia"]
print (treeArray.count) //treeArray.count counts the number of items in the array

//To check if array is empty
if treeArray.isEmpty // Boolean 'isEmpty'
    {
        print ("Array is empty")
    }

// Accessing elements in an array
var states = ["cal","lif","ornia"]
print (states[2]) //Prints 'ornia'

//Change element in array 
states[0] = "grus"
print(states) //Output : ["grus", "lif", "ornia"]

//Appending items to an ARRAY - use 'append' method or += or +
var staten = ["cal","lif","ornia"]
staten.append("TheAppended")
            //OR
staten += ["TheAppended0"]
staten += ["TheAppended1", "TheAppended2", "TheAppended3"]

//Inserting items in an array
var statened = ["cal","lif","ornia"]
statened.insert("hus", atIndex: 1) //Moves the elements after "lif" to the right

//Deleting elements from an array
statened.removeAtIndex(0)
print (statened)

//Remove last element in an array
statened.removeLast()
print (statened)

//Array iteration
var stateneded = ["cal","lif","ornia"]

for start in stateneded
    {
        print (start)
    }

//////////////////////////////////////  SWIFT DICTIONARY COLLECTIONS
////////////Data is stored and managed in a key-value pair. Each element in an array is accessed using a UNIQUE key. Only STRINGS, INT, DOUBLE and BOOL are suitable for use as keys in a dictionary

var books = [ "100-432112" : "Wind in the Willows", //Using ISBN number to access book titles
              "200-532874" : "Tale of Two Cities",
              "202-546549" : "Sense and Sensibility",
              "104-109834" : "Shutter Island"]
                //OR
/*
var books : [String : String] = [ "100-432112" : "Wind in the Willows", //Using ISBN number to access book titles
    "200-532874" : "Tale of Two Cities",
    "202-546549" : "Sense and Sensibility",
    "104-109834" : "Shutter Island"]
*/

//Create EMPTY dictionary
var myDico = [Int:String]() //Integer key and String value

//Dictionary Item Count
//var variableName: [key type: value type] = [key 1: value 1, key 2: value2 .... ]

print(books.count)

//Accessing dictionary items
print (books["100-432112"]) // Output : "Wind in the Willows"

//Updating dictionary
books["200-532874"] = "Rich dad"
        //OR
//Use updateValue method
books.updateValue("202-546549", forKey: "Great deals")

//Removing dictionary item
books["104-109834"] = nil
        //OR
//books.removeValueForKey("104-109834")
print (books)

//Dictiomary Iteration
for (bookID, book) in books
    {
        print ("BookID is \(bookID), Book is \(book)")
    }






