//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("Welcome to Swift")

var x = 10;

for index in 1...20
{
     let y = index * x--
   
}

///////////// Create box

let myLabel = UILabel(frame: CGRectMake (0,0,200,50))
myLabel.backgroundColor = UIColor.redColor()

myLabel.text = "Hello Swifty"
myLabel.textAlignment = .Center
myLabel.font = UIFont(name: "Georgia", size: 24)

myLabel

//////////////Size of int 32 from max to min

print ("Int 32 min = \(Int32.min), Int 32 max = \(Int32.max)")

var username = "James"
var messCount = 45
let maxCount = 57

var concat = "\(username) has \(messCount) messages. You have \(maxCount - messCount) left"

//////////Newline
var newline = "\n"

print ("\(concat)")

////////////////// Constant - Recommended to be used rather than VAR
let t = 34
let j = "natus"

///////////////////Int
var k : Int = 10

//////////////////////Tuple - Used to store THREE different data types
let myTuple = (3, "int, String and float" ,3.4)

//////Accessing a tuple
var myInt = myTuple.0
print (myInt)

//////////////////////////////To check if a variable has a value attached to it, use OPTIONAL

var myInteger : Int? /////To check if myInteger is an Int

if myInteger != nil
    {
        print ("myInteger has a value assigned to it")
    }

else
    {
        print ("myInteger has no value assigned to it")
    }


////////////////////////UNWRAPPING an OPTION

var newInt : Int? /////To check if myInteger is an Int
newInt = 2;

var newTup = [3, "int, String and float" ,3.4]

if newInt != nil
{
    ///////////////Unwrapping OPTION newInt
    print ("String output = \(newTup[newInt!])")
}
    
else
{
    print ("newInt has no value assigned to it")
}









