//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

////////////////// An Overview of iOS 8 Application State Preservation and Restoration
Application state preservation and restoration is all about presenting the user with application continuity in terms of appearance and behavior. This is, in part, already provided through support for applications to run in the background. Users have come to expect to be able to switch from one app to another and, on returning to the original app, to find it in the exact state it was in before the switch took place. Unless the application developer took specific steps to save and restore state, however, this continuity did not extend between sessions that involve the application stopping and restarting (usually as a result of the operating system killing a background application to free resources). For most applications available today, such a scenario results in the application starting at the home screen with no consideration being given to the previous state of the application.
Apple feels strongly that the continuity of a user’s interaction with an application should extend between the application stopping and restarting. In recognition of this fact, Apple provides a set of features in the UIKit Framework intended to make it easier for developers to save and restore application state.

Each time a running application is placed into the background, UIKit will ask the application whether or not it requires state preservation. In the event that the application requires the state to be saved, UIKit will traverse the view controller hierarchy of the application and save the state of each object that has a restoration ID. As it does this, it will call a method on each eligible object in order to provide that object with an opportunity to encode and return additional data to be included in the saved state. Once the state information has been gathered, it is saved to a file on the local file system of the device.


//////////////// Opting In to Preservation and Restoration
By default, UIKit does not attempt to save and restore the state of an application. An application must, instead, “opt-in”.
func application(application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
    return true
}
func application(application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
    return true
}

/////////////// Assigning Restoration Identifiers
When UIKit walks the view controller hierarchy of an application to preserve state, only those objects with a restoration ID will be saved.
Restoration IDs can be assigned to objects either in code or from within Interface Builder. The restoration ID can be any valid string and may be assigned in code via the restorationID property of the UIView and UIViewController classes. For example:

myViewController.restorationIdentifier = "thirdViewController"

When assigning restoration IDs in Interface Builder, it is important to distinguish between views and view controllers. Clicking on the white background of a view in a storyboard, for example, will select the UIView object, not the view controller. Clicking on the status bar containing the battery life indicator will, on the other hand, select the view controller. As a general rule, wherever possible, state preservation should be implemented by saving and restoring the state of the view controller which, in turn, will be responsible for restoring the state of any child view objects. Directly saving and restoring the state of individual view objects in a user interface layout should only be performed when preservation requirements cannot be met using the view controller state.

/////////////// Default Preservation Features of UIKit
Once state preservation has been enabled and restoration identifiers assigned appropriately, it is worth being aware that UIKit will preserve certain state information by default and without the need to write any additional code. By default, the following state information is saved and restored automatically for view controllers:
· Currently presented view controller
· Currently selected tab
· State of navigation stacks
In the case of views, the following is preserved by default:
· Current scroll position
· Currently selected cell in a table view
· Current state of an image view (zoom, pan, etc)
· Web history (including scroll position and zoom level)
Additional state preservation will, as will be outlined in the remainder of this chapter, require some coding.
    
/////////////// Saving and Restoring Additional State Information

When UIKit restores the view controller object on a subsequent launch of the application, it will call the decodeRestorableStateWithCoder method of that object, passing through the NSCoder object containing the previously stored state data. The method is then responsible for decoding the object and using the data contained therein to restore the view to the previous state. The following code listing shows an example implementation of these two methods for a view controller class intended to save any text that has been entered by the user but not yet saved to the application’s data model:

override func encodeRestorableStateWithCoder(coder: NSCoder) {
    coder.encodeObject(myTextView.text, forKey:"UnsavedText")
    super.encodeRestorableStateWithCoder(coder)
}
override func decodeRestorableStateWithCoder(coder: NSCoder) {
    myTextView.text = coder.decodeObjectForKey("UnsavedText") as String
    super.decodeRestorableStateWithCoder(coder)
}

/////////////// Saving General Application State
So far in this chapter we have focused exclusively on saving the state of the user interface in terms of views and view controllers. There will also be situations where other data may be relevant to the state of the application but not directly associated with the user interface elements. In order to address this need, the following two methods may be implemented within the application delegate class:
· application:willEncodeRestorableStateWithCoder
· application:didEncodeRestorableStateWithCoder
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    









