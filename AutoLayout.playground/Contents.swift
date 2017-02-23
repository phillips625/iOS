//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//AUTOLAYOUT 
// Can be used to set the width (constraint) of a label
//This explicit width might become problematic if you need to display something more dynamic. If the result is greater than the width, 70, then it remaining result will be clipped.
//e.g myLabel.width = 70


//FOR MORE DYNAMIC WIDTH
//Result can expand to any length less than 900. This allows longer content to be displayed without clipping.
// myLabel.width <= 900

//  CONSTRAINT
//Example of Constraint equation
// Establishes constraint relationship between TWO views - view1 and view2
//view1.attribute = multiplier * view2.attribute2 + constant 


// Constraint to establish the same width for two views
//view1.width = view2.width

// Constraint to align the horizontal center of two views
//view1.centerX = view2.centerX

//Distance btw the bottom of view1 and view2 has a distance of 20 points. view1 is above view2
//view1.bottom = view2.bottom - 20

//view1 is TWICE the size of view2 minus width of 30 points
// view1.width = view2.width - 30