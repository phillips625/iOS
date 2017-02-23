//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

///////////////////////////// The UIGestureRecognizer Class

//The UIGestureRecognizer class is used as the basis for a collection of subclasses, each designed to detect a specific type of gesture. These subclasses are as follows:

/*
 -  UITapGestureRecognizer – This class is designed to detect when a user taps on the screen of the device. Both single and multiple taps may be detected based on the configuration of the class instance.
 
 -  UIPinchGestureRecognizer – Detects when a pinching motion is made by the user on the screen. This motion is typically used to zoom in or out of a view or to change the size of a visual component.
 
 -  UIPanGestureRecognizer – Detects when a dragging or panning gesture is made by the user.
 
 -  UIScreenEdgePanGestureRecognizer – Detects when a dragging or panning gesture is performed starting near the edge of the display screen.
 
 -  UISwipeGestureRecognizer – Used to detect when the user makes a swiping gesture across the screen. Instances of this class may be configured to detect motion only in specific directions (left, right, up or down).
 
 -  UIRotationGestureRecognizer – Identifies when the user makes a rotation gesture (essentially two fingers in contact with the screen located opposite each other and moving in a circular motion).
 
 -  UILongPressGestureRecognizer – Used to identify when the user touches the screen with one or more fingers for a specified period of time (also referred to as “touch and hold”).
 */

/////////////Recognizer Action Messages
///The iOS gesture recognizers use the target-action model to notify the application of the detection of a specific gesture.

/*
 ////////////// Discrete and Continuous Gestures
 Gestures fall into two distinct categories – discrete and continuous. A discrete gesture results in only a single call being made to the corresponding action method. Tap gestures (including multiple taps) are considered to be discrete because they only trigger the action method once. Gestures such as swipes, pans, rotations and pinches are deemed to be continuous in that they trigger a constant stream of calls to the corresponding action methods until the gesture ends.
 
*/

/*
 //////////////// Obtaining Data from a Gesture
 Each gesture action method is passed as an argument a UIGestureRecognizer sender object which may be used to extract information about the gesture. For example, information about the scale factor and speed of a pinch gesture may be obtained by the action method.
 
*/

/*
////////////////// Recognizing Tap Gestures
Tap gestures are detected using the UITapGestureRecognizer class. This must be allocated and initialized with an action selector referencing the method to be called when the gesture is detected. The number of taps that must be performed to constitute the full gesture may be defined by setting the numberOfTapsRequired property of the recognizer instance. The following code, for example, will result in a call to the tapsDetected method when two consecutive taps are detected on the corresponding view:
 
let doubleTap = UITapGestureRecognizer(target: self, action: "tapDetected")
doubleTap.numberOfTapsRequired = 2
self.view.addGestureRecognizer(doubleTap)
 
A template method for the action method for this and other gesture recognizers is as follows:
func tapDetected() {
 // Code to respond to gesture here

}
*/

/*
 /////////////////// Recognizing Pinch Gestures
 Pinch gestures are detected using the UIPinchGestureRecognizer class. For example: 
 
 let pinchRecognizer = UIPinchGestureRecognizer(target: self,
 action: "pinchDetected") self.view.addGestureRecognizer(pinchRecognizer
 */

/*
 ////////////////// Detecting Rotation Gestures
 Rotation gestures are recognized by the UIRotationGestureRecognizer, the sample code for which is as follows:
 
 let rotationRecognizer = UIRotationGestureRecognizer(target: self, action: "rotationDetected")
 self.view.addGestureRecognizer(rotationRecognizer)
 */

/*
 ///////////// Recognizing Pan and Dragging Gestures
 Pan and dragging gestures are detected using the UIPanGestureRecognizer class. Pan gestures are essentially any continuous gesture. For example, the random meandering of a finger across the screen will generally be considered by the recognizer as a pan or drag operation:
 
 let panRecognizer = UIPanGestureRecognizer(target: self, action: "panDetected")
 self.view.addGestureRecognizer(panRecognizer)
 
 If both swipe and pan recognizers are attached to the same view it is likely that most swipes will be recognized as pans. Caution should be taken, therefore, when mixing these two gesture recognizers on the same view.
 */

/*
 //////////////// Recognizing Swipe Gestures
 Swipe gestures are detected using the UISwipeGestureRecognizer class. All swipes, or just those in a specific direction, may be detected by assigning one of the following constants to the direction property of the class:
 
 · UISwipeGestureRecognizerDirection.Right
 · UISwipeGestureRecognizerDirection.Left
 · UISwipeGestureRecognizerDirection.Up
 · UISwipeGestureRecognizerDirection.Down
 
 Note that when programming in swift, the above constants may be abbreviated to .Right, .Left, .Up, and .Down.
 If no direction is specified the default is to detect rightward swipes. The following code configures a UISwipeGestureRecognizer instance to detect upward swipes:
 
 let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeDetected")
 swipeRecognizer.direction = .Up
 self.view.addGestureRecognizer(swipeRecognizer)
 */

/*
 //////////////// Recognizing Long Touch (Touch and Hold) Gestures
 Long touches are detected using the UILongPressGestureRecognizer class. The requirements for the gesture may be specified in terms of touch duration, number of touches, number of taps and allowable movement during the touch. These requirements are specified by the minimumPressDuration, numberOfTouchesRequired, numberOfTapsRequired and allowableMovement properties of the class respectively. The following code fragment configures the recognizer to detect long presses of 3 seconds or more involving one finger. The default allowable movement is not set and therefore defaults to 10 pixels:
 
 let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressDetected")
 
 swipeRecognizer.direction = .Up
 longPressRecognizer.minimumPressDuration = 3 
 longPressRecognizer.numberOfTouchesRequired = 1
 
 self.view.addGestureRecognizer(longPressRecognizer)
 */





