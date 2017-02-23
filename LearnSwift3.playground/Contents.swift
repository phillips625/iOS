//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/////////////////For Loop

for (var i = 1; i<=10 ; ++i)
    {
        print ("Value is \(i)")
    }

        //////  OR

for var j in 1...10
    {
    print ("Value is \(j)")
    }

///////////////////While loop
var myCount = 0
while myCount < 10
    {
    ++myCount
    }

//////////////////////////repeat-while loop

var q = 10
repeat
    {
    --q
    }
while (q > 0)

/////////////////////////////Break

var w = 10
for var e = 0; e < 100; ++e
    {
        w+=e
        if(w>100)
            {
                break
            }
        print ("\(w)")
    }

/////////////////////////////Continue - goes back to the top of loop if condition is not met
//////////////N.B: Break - Continues down code
//                 Continue - loops back up

/// Even numbers from 1 - 20
var u = 1

while u<20
{
    u++
    if (u%2) != 0
        {
            continue
        }
    print ("u = \(u)")
}

//////////////////// if, else if - Works well for fewer conditions

var g = 9;
if g == 10
    {
        print("g =10")
    }
else if g == 9
    {
        print("g =9")
    }
else if g == 8
    {
        print ("g is 8")
    }

//////////////////////Switch statement

var value = 3

switch (value)
{
    case 1:
        print("1")
    case 2:
        print("2")
    case 3:
        print("3")
    case 4:
        print("4")
    
    default:
        print("Non of the option")
}

//////////////////////////////Combining Switch

var val = 1

switch (val)
{
    case 1,2,3:
        print("1,2,3")
    case 4:
        print("4")
    case 5:
        print("5")
    
    default:
        print("Non of the option")
}


////////////////////////////////////// Range Switch

var va = 100

switch (va)
{
    case 1...50:
        print("1...50")
    case 51...100:
        print("51...100")
    case 101...150:
        print("101...150")
    
    default:
        print("Non of the option")
}


////////////////////////////////Where - Used to add one more condition to the case

var temp = 100

switch (temp)
{
    case 1...50 where temp%2 == 0:
        print("1...50")
    case 51...100 where temp%2 == 0:
        print("51...100")
    case 101...150 where temp%2 == 0:
        print("101...150")
    
    default:
        print("Non of the option")
}


/////////////////////////////////FUNCTION///////////////////////////////////

//func <function name> (<para name>: <para type>, <para name>: <para type>, ... ) -> <return type>
    //{
        // Function code
    //}

//No return type
func sayHello ()
    {
        print("Hello")
    }

//Has return type
func buildMessage (Count: Int, name: String) -> String
    {
        return ("\(name), your customer number is \(Count)")
    }

/////////////Calling Functions


//No return type
sayHello()

//Has return type

var message = buildMessage(2, name: "Jess")

//////////////////////Used to specify internal (name and count) and external (customerName and customerCount) parameters. External parameters used to pass arguments to the internal parameters

func buildMessage1(customerName name: String, customerCount count: Int) -> String
    {
        return ("\(name), you are customer number \(count)")
    }

//Calling funtion

var custom = buildMessage1(customerName: "Jack", customerCount: 5)


/////////////////////////////////////Returning multiple results from function

func convertSize (length: Float) -> (yards: Float, centimeters: Float, meters: Float)
    {
        var yards = length * 0.0277778
        var centimeters = length * 2.54
        var meters = length * 0.0254
        
        return (yards, centimeters,meters)
    }

///////// Calling function

var size = convertSize(15)
print(size.yards)
print(size.centimeters)
print(size.meters)



