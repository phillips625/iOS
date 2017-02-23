//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

                Preparing to Run iAds within an Application
This is achieved by logging into the iTunes Connect portal at itunesconnect.apple.com using your Apple ID, clicking on the Contracts, Tax and Banking link and following the instructions to set up the agreements and to enter the necessary tax and banking information.

                iAd Advertisement Formats
The iAds platform supports four different advertising formats consisting of banner, interstitial, medium rectangle and pre-roll video, each of which can be implemented within an iOS application using just a few lines of code.

                 Banner Ads
Banner ads are supported on both iPhone and iPad based applications and are intended to appear at the bottom of the device display while an application view is visible to the user.

override func viewDidLoad() { super.viewDidLoad()
    self.canDisplayBannerAds = true
}

As previously described, when the user taps on a banner a full screen advert will appear obscuring the current view. This advert will remain on the screen until dismissed by the user. Depending on the type of application, it may be necessary to take action when the banner is tapped. If the app is playing a video, for example, it would be prudent to pause playback while the view is obscured by the ad and subsequently resume once the user dismisses the ad. Such functionality can be achieved by overriding the viewWillDisappear and viewWillAppear delegate methods within the view controller code. These methods will then be called when the ad appears and disappears respectively:
override func viewWillAppear(animated: Bool) {
    // View is about to be obscured by an advert.
    // Pause activities if necessary 
}
    override func viewWillDisappear(animated: Bool) {
// Advert has been dismissed. Resume paused activities 
}

                    Interstitial Ads
Interstitial adverts occupy the full device display and are primarily intended to be displayed when a user transitions from one screen to another within an application. When a transition is taking place from one view controller to another, interstitial ad display can be enabled by setting the interstitialPresentationPolicy property of the destination view controller. When using storyboards this is best performed within the prepareForSegue method which is called immediately before the transition takes place. Interstitial display can be configured to be automatic or manual. The following code, for example, implements automatic interstitial advertising for a transition using the prepareForSegue method:
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let destination = segue.destinationViewController as UIViewController
    destination.interstitialPresentationPolicy = ADInterstitialPresentationPolicy.Automatic
}
The following code, on the other hand, demonstrates how to manually display an interstitial ad:
destination.interstitialPresentationPolicy = ADInterstitialPresentationPolicy.Manual
destination.requestInterstitialAdPresentation()
When using interstitial ads, it is recommended that the application be given an opportunity in advance of the transition to make ad requests to the iAds system. This prevents any delays when the time comes to display the ad during the transition. This can be achieved by making a call to the prepareInterstitialAds method of the UIViewController class. An ideal place to perform this task is within the didFinishLaunchingWithOptions method of the application delegate class, for example:
import UIKit
import iAd
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        UIViewController.prepareInterstitialAds()
        return true
    }
    .
    .
}

             Medium Rectangle Ads
The following code, for example, creates a medium rectangle ad instance and assigns the current class as the delegate:
let rectangleAdView = ADBannerView(adType: ADAdType.MediumRectangle)
rectangleAdView?.delegate = self

When an ad is ready to be displayed, the bannerViewDidLoadAd method of the delegate will be called, the responsibility of which is to display the ad within the current view. For example:
func bannerViewDidLoadAd(banner: ADBannerView!) {
    self.view.addSubview(banner)
    self.view.layoutIfNeeded()
}

Note that the above code does not attempt to position the ad rectangle. In a real world application code will need to be added so that the ad appears in the appropriate location on the view.
The rectangle ad will rotate through different ads as long as inventory is available. In the event that an ad is not available, or the device loses connectivity, the didFailToReceiveAdWithError: delegate method will be called so that the advert can be removed from the view until another ad is available to be displayed:
func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
    banner.removeFromSuperview()
    self.view.layoutIfNeeded()
}

    As with the banner ad format, a full screen advertisement will be displayed in the event that the user taps on the rectangle ad. Once again, the viewWillDisappear and viewWillAppear delegate methods may be used to pause and resume the application if appropriate.


                        Pre-Roll Video Ads
For applications that make use of the iOS MediaPlayer Framework to play videos, this feature allows advertisement videos to be played before the actual video is played to the user. This simply involves calling the playPrerollAdWithCompletionHandler method of the media player instance. A completion
handler is then called so that the playback of the actual video can be initiated when the ad has finished running. For example:
let url = NSURL(string: "http://www.ebookfrenzy.com/ios_book/movie/movie.mov")
let player = AVPlayer(URL: url)
let playerController = AVPlayerViewController() playerController.player = player
self.presentViewController(playerController, animated: true, completion: nil)
playerController.playPrerollAdWithCompletionHandler({error in
    player.play()
    }
)
As with the interstitial ad format, Apple recommends preparing the application for pre-roll video ads at application launch time:
.
.
import AVKit
.
.
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    AVPlayerViewController.preparePrerollAds()
    return true
}
























