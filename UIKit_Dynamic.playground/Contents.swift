//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*

/////////////////// UIKit Dynamics provides a powerful and flexible mechanism for combining user interaction and animation into iOS user interfaces. What distinguishes UIKit Dynamics from other approaches to animation is the ability to declare animation behavior in terms of real-world physics.
 
 /////The UIKit Dynamics implementation comprises four key elements consisting of a dynamic animator, a set of one or more dynamic behaviors, one or more dynamic items and a reference view.
 
 Dynamic Items
 The dynamic items are the view elements within the user interface that are to be animated in response to specified dynamic behaviors. A dynamic item is any view object that implements the UIDynamicItem protocol which includes the UIView and UICollectionView classes and any subclasses thereof (such as UIButton and UILabel)
 
 Dynamic Behaviors
 Dynamic behaviors are used to configure the behavior which is to be applied to one or more dynamic items. A range of predefined dynamic behavior classes is available, including UIAttachmentBehavior, UICollisionBehavior, UIGravityBehavior, UIDynamicItemBehavior, UIPushBehavior and UISnapBehavior.
 
 The Reference View
 The reference view dictates the area of the screen within which the UIKit Dynamics animation and interaction are to take place. This is typically the parent superclass view or collection view of which the dynamic item views are children.
 
 The Dynamic Animator
 The dynamic animator is responsible for coordinating the dynamic behaviors and items, and working with the underlying physics engine to perform the animation.
 
 Implementing UIKit Dynamics in an iOS 8 Application The implementation of UIKit Dynamics in an application requires three very simple steps:
 1. Create an instance of the UIDynamicAnimator class to act as the dynamic animator and initialize it with a reference to the reference view.
 2. Create and configure a dynamic behavior instance and assign to it the dynamic items on which the specified behavior is to be imposed.
 3. Add the dynamic behavior instance to the dynamic animator. 
 4. Repeat from step 2 to create and add additional behaviors.
 
 Dynamic Animator Initialization
 The first step in implementing UIKit Dynamics is to create and initialize an instance of the UIDynamicAnimator class. The first step is to declare an instance variable for the reference:
 var animator: UIDynamicAnimator?
 Next, the dynamic animator instance can be created. The following code, for example, creates and initializes the animator instance within the viewDidLoad method of a view controller, using the view controller’s parent view as the reference view:
 override func viewDidLoad() { super.viewDidLoad()
 animator = UIDynamicAnimator(referenceView: self.view)
 }
 
 Configuring Gravity Behavior
 Gravity behavior is implemented using the UIGravityBehavior class, the purpose of which is to cause view items to want to “fall” within the reference view as though influenced by gravity. UIKit Dynamics gravity is slightly different from real world gravity in that it is possible to define a vector for the direction of the gravitational force using x and y components (x, y) contained within a CGVector instance. The default vector for this class is (0.0, 1.0) which corresponds to downwards motion at a speed of 1000 points per second2. A negative x or y value will reverse the direction of gravity.
 A UIGravityBehavior instance can be initialized as follows, passing through an array of dynamic items on which the behavior is to be imposed (in this case two views named view1 and view2):
 let gravity = UIGravityBehavior(items: [view1, view2])
 Once created, the default vector can be changed if required at any time:
 let vector = CGVectorMake(0.0, 0.5) gravity.gravityDirection = vector
 Finally, the behavior needs to be added to the dynamic animator instance:
 animator?.addBehavior(gravity)
 At any point during the application lifecycle, dynamic items may be added to, or removed from, the behavior:
 gravity.addItem(view3) gravity.removeItem(view)
 Similarly, the entire behavior may be removed from the dynamic animator:
 animator?.removeBehavior(gravity)

 
 Configuring Collision Behavior
 Collision behavior can be implemented between dynamic items (such that certain items can collide with others) or within boundaries (allowing collisions to occur when a designated boundary is reached by an item). Boundaries can be defined such that they correspond to the boundaries of the reference view, or entirely new boundaries can be defined using lines and Bezier paths.
 As with gravity behavior, a collision is generally created and initialized with an array object containing the items to which the behavior is to be applied. For example:
 let collision = UICollisionBehavior(items: [view1, view2]) 
 animator?.addBehavior(collision)
 
 By default, an item under the influence of a collision behavior will collide both with other items in the same collision behavior set, and also with any boundaries set up. To declare the reference view as a boundary, simply set the translatesReferenceBoundsIntoBoundary property of the behavior instance to true:
 collision.translatesReferenceBoundsIntoBoundary = true
 A boundary inset from the edges of the reference view may be defined using the setsTranslateReferenceBoundsIntoBoundaryWithInsets method, passing through the required insets as an argument in the form of a UIEdgeInsets object.
 
 The following code, for example, enables collisions only for items:
 collision.collisionMode = UICollisionBehaviorMode.Items
 In the event that an application needs to react to a collision, simply declare a class instance that conforms to the UICollisionBehaviorDelegate class by implementing the following methods and assign it as the delegate for the UICollisionBehavior object instance.
 · collisionBehavior(_:beganContactForItem:withBoundaryIdentifier:atPoint:)
 · collisionBehavior(_:beganContactForItem:withItem:atPoint:)
 · collisionBehavior(_:endedContactForItem:withBoundaryIdentifier:)
 · collisionBehavior(_:endedContactForItem:withItem:)
 
 Configuring Attachment Behavior
 As the name suggests, the UIAttachmentBehavior class allows dynamic items to be configured such that they behave as if attached.
 let attachment = UIAttachmentBehavior(item: view1,
 animator?.addBehavior(attachment)
 attachedToItem: view2)
 The following code, on the other hand, specifies an attachment between view1 and an anchor point with the frequency and damping values set to configure a spring effect:
 let anchorpoint = CGPointMake(100, 100)
 let attachment = UIAttachmentBehavior(item: view1,
 attachedToAnchor: anchorPoint) attachment.frequency = 4.0
 attachment.damping = 0.0
 The above examples attach to the center point of the view. The following code fragment sets the same attachment as above, but with an attachment point offset 20, 20 points relative to the center of the view:
 let anchorpoint = CGPointMake(100, 100) let offset = UIOffsetMake(20, 20)
 let attachment = UIAttachmentBehavior(item: view1, offsetFromCenter: offset,
 attachedToAnchor: anchorPoint)
 
 Configuring Snap Behavior
 The UISnapBehavior class allows a dynamic item to be “snapped” to a specific location within the reference view. When implemented, the item will move toward the snap location as though pulled by a spring and, depending on the damping property specified, will oscillate a number of times before finally snapping into place. Until the behavior is removed from the dynamic animator, the item will continue to snap to the location when subsequently moved to another position.
 The damping property can be set to any value between 0.0 and 1.0 with 1.0 specifying maximum oscillation. The default value for damping is 0.5.
 The following code configures snap behavior for dynamic item view1 with damping set to 1.0:
 let point = CGPointMake(100, 100)
 let snap = UISnapBehavior(item: view1, snapToPoint: point)
 animator?.addBehavior(snap)
 
 Configuring Push Behavior
 Push behavior, defined using the UIPushBehavior class, simulates the effect of pushing one or more dynamic items in a specific direction with a specified force.
 A force of magnitude 1.0 is defined as being a force of one UIKit Newton which equates to a view sized at 100 x 100 points with a density of value 1.0 accelerating at a rate of 100 points per second
 
 The following code pushes an item with instantaneous force at a magnitude of 0.2 applied on both the x and y axes, causing the view to move diagonally down and to the right.
 let push = UIPushBehavior(items: [view1],
 mode: UIPushBehaviorMode.Instantaneous)
 let vector = CGVectorMake(0.2, 0.2) push.pushDirection = vector
 
 To change the point where force is applied, configure the behavior using the setTargetOffsetFromCenter(_:forItem:) method of the behavior object, specifying an offset relative to the center of the view. For example:
 let offset = UIOffsetMake(20, 20) push.setTargetOffsetFromCenter(offset, forItem:view1)
 
 The UIDynamicItemBehavior Class
 The UIDynamicItemBehavior class allows additional behavior characteristics to be defined that complement a number of the above primitive behaviors. This class can, for example, be used to define the density, resistance and elasticity of dynamic items so that they do not move as far when subjected to an instantaneous push, or bounce to a greater extent when involved in a collision.
 
 The following code example creates a new UIDynamicItemBehavior instance and uses it to set resistance and elasticity for two views before adding the behavior to the dynamic animator instance:
 let behavior = UIDynamicItemBehavior(items: [view1, view2]) behavior.elasticity = 0.2
 behavior.resistance = 0.5 
 animator?.addBehavior(behavior)
 
 Combining Behaviors to Create a Custom Behavior
 Multiple behaviors may be combined to create a single custom behavior using an instance of the UIDynamicBehavior class. The first step is to create and initialize each of the behavior objects. An instance of the UIDynamicBehavior class is then created and each behavior added to it via calls to the addChildBehavior method. Once created, only the UIDynamicBehavior instance needs to be added to the dynamic animator. For example:
 // Create multiple behavior objects here 
 let customBehavior = UIDynamicBehavior()
 
 customBehavior.addChildBehavior(behavior) 
 customBehavior.addChildBehavior(attachment) 
 customBehavior.addChildBehavior(gravity) 
 customBehavior.addChildBehavior(push)
 
 animator?.addBehavior(customBehavior)

 
 
 */