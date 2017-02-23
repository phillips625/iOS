//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/////////////////////////Variable number of parameters of the same type

func displayString (strings: String...) ////Assigns multiple strings of unknown quantity
    {
        for string in strings
            {
                print (string)
            }
    }
/////Calling function

displayString("one","two","three","four")

/////////////////////////////////////Parameters as variables

func calculateArea (var length: Float, var width: Float) -> Float
    {
        ///////Length and width - Accepts "floats" after function has been called but initializes the local variables as "var"
        length = length * 2.54
        width = width * 2.54
        return length * width
    }
/// Calling function
print(calculateArea(10, width: 20))

/////////////in-out Parameter - Declares the parameter as a (internal) variable and also changes the original value

var myValue = 10

func doubleValue (var value: Int) -> Int
    {
        value+=value
        return (value)
    }

///Calling function
print ("Before function calls myValue = \(myValue)") //10
print ("doubleValue would return = \(doubleValue(myValue))")  //20
print("After function calls myValue\(myValue)")//Confirms that the function doesn't change the value //10

////////IN-OUT

func doubleValue1 (inout value: Int) -> Int
{
    value+=value
    return (value)
}
//Calling function
print("doubleValue would return = \(doubleValue1(&myValue))") //myValue now is 20 after going through
print ("After function calls myValue = \(myValue)")             // the function.

////////////////////////FUNCTIONS AS PARAMETERS
//Declare two functions
func inchesToFeet (inches: Float) -> Float
    {
        return inches * 0.0833333
    }
func inchesToYards (inches: Float) -> Float
    {
        return inches * 0.0277778
    }

//Constant
let toFeet = inchesToFeet
let toYards = inchesToYards

//////Function and Float passed in as a parameters

func outputConvert (convertFunc: (Float) -> Float , value1: Float )
    {
        //(Float) -> Float === is the input and output of inchesToFeet and inchesToYards
        var result1 = convertFunc (value1)  //////This is where the conversion happen! 
                                            // convertFunc (value1) === inchesToFeet(10)
        print ("Result is \(result1)")
    }

// Call Function

outputConvert(inchesToYards, value1: 10)
outputConvert(inchesToFeet, value1: 40)

/////////////////RETURNING FUNCTION AS A DATA TYPE

//Configured to return toFeet or toYard (which accepts and returns float values (Float -> Float)) based on a bool parameter
func decideFunction (feet: Bool) -> (Float) -> Float
    {
        if (feet)
        {
            return toFeet
        }
        else
        {
            return toYards
        }
    }

/////// Closure expression - Operates like a function

let multiply =
    {
        (val1: Int, val2: Int) -> Int in
        return val1 * val2
    }

    let result2 = multiply (10, 20)

//////////////////Closure in Swift - Function within a function

func functionA() -> () -> Int  /// "() -> Int " is for functionB
    {
        var counter = 0
        
        func functionB() -> Int
            {
                return counter * 10
            }
        return functionB
    }

//call function

let result1 = functionA()
let res = result1()








