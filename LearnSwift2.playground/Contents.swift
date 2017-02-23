//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//// Declare an OPTIONAL Int
var x: Int?
 x = 0
var y = 8

/////Adds x to y and store in x
x = x! + y  //or x+=y

////////////Comparison Operator
// x >= y

//////////////////Boolean Operator

var flag = true // Variable is true
var secondFlag = !true //Variable is false

if (10<20 || 3>2)
    {
        print("Both True")
    }

/////////////////////Comparison

var z: Bool?

var i = 10
var j = 20

z = i > j // Optional false


////////////////////////Range operator

// 5..< 8 /////// Output - 5,6 and 7

///////////////////////Ternary operator - Shortcut of making decisions within code

var a = 1
var b = 2

print ("Largest number is \(a>b ? a: b)")


/////////////////////////////////////////////BITWISE OPERATOR

/////(1)Bitwise NOT

//00000011 NOT
//========
//11111100

var u = 3
var v = ~u

print ("\(v)")

/////(2)Bitwise AND

//10101011 AND
//00000011 
//======== 
//00000011

var q = 171
var w = 3

var e = q & w

/////(3)Bitwise OR

/////(4)Bitwise XOR

/////(5)Bitwise left shift

//10101011 Left Shift one bit
//========
//101010110

var o = 171
var p = o << 1  ////left shift once

/////(6)Bitwise right shift

//10101011 Right Shift one bit
//========
//01010101

var d = 171
var g = d >> 1






