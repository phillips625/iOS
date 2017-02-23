//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

///////////Object Oriented Programming

class BankAccount
    {
        //Data encapsulation - data can be assessed by methods in the class
        var accountBalance: Float = 0
        var accountNumber: Int = 0
    
    ////////Stored properties
        let fees: Float = 25.00 ////Returned a Float
    
    ///////////Computed properties
        var balanceLessFees : Float //Expecting a Float return
            {
                get
                {
                    return accountBalance - fees
                }
            }
    
    //////////CLASS INITIALISATION
    init (number: Int, balance: Float)
        {
            accountNumber = number
            accountBalance = balance
        }
    
    /////////CLASS DEINITIALISATION
    deinit
        {
            //Performs memory clean up of the initialised variables above
        }
    
        /////Instance method; Display acct balance method
    
        func displayBalance()
            {
                print("Account number is \(accountNumber)")
                print("Account Balance is \(accountBalance)")
            }
    
    // Type method
    //Checks that the bank account is less than 10000 without having to go through the process of creating a class instance
        class func getMaxBalance() -> Float
            {
                return 10000.00
            }
    
    }

//////Initialize class instance

var account1 : BankAccount = BankAccount (number: 23242, balance: 45453.44)

///////Accessing properties of a class
var balance1 = account1.accountBalance
//Can also be used to set value of instance properties
account1.accountBalance = 21243.12

////////Calling INSTANCE method
account1.displayBalance()

////////Calling TYPE method - Operates at the level of a class
var maxAllowed = BankAccount.getMaxBalance()

//////////////Accessing balance less fees

var balanceLessFees1 = account1.balanceLessFees


///////////////////////////////////SELF - reference to the current class or method
//ALSO NECESSEARY WHEN THE FUNCTION PARAMETER HAS THE SAME NAME AS THW CLASS PROPERTIES/VARIABLES

class MyClass1
    {
        var myNumber = 1
    
        func addTen()
            {
                //self.myNumber += 10 
                //      OR
                myNumber += 10
            }
    }

class MyClass2
    {
        var numbre = 10 //Class property
    
        func addTen(numbre : Int)
            {
                print(numbre) // Output the function parameter value i.e numbre : Int
                print(self.numbre) // Output the class property value
            }
    }





