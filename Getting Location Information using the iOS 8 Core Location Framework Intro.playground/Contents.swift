//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//iOS devices are able to employ a number of different techniques for obtaining information about the current geographical location of the device. These mechanisms include GPS, cell tower triangulation and finally (and least accurately), by using the IP address of available Wi-Fi connections. 

//  The Core Location Manager
The key classes contained within the Core Location Framework are CLLocationManager and CLLocation. An instance of the CLLocationManager class can be created using the following Swift code:
var locationManager: CLLocationManager = CLLocationManager()
Once a location manager instance has been created, it must seek permission from the user to collect location information before it can begin to track data.

// Configuring the Desired Location Accuracy
The level of accuracy to which location information is to be tracked is specified via the desiredAccuracy property of the CLLocationManager object.
·
·
· · · ·
kCLLocationAccuracyBestForNavigation – Uses the highest possible level of accuracy augmented by additional sensor data. This accuracy level is intended solely for use when the device is connected to an external power supply.
kCLLocationAccuracyBest – The highest recommended level of accuracy for devices running on battery power.
kCLLocationAccuracyNearestTenMeters - Accurate to within 10 meters.
kCLLocationAccuracyHundredMeters – Accurate to within 100 meters.
kCLLocationAccuracyKilometer – Accurate to within one kilometer. kCLLocationAccuracyThreeKilometers – Accurate to within three kilometers

////////// Configuring the Distance Filter
The default configuration for the location manager is to report updates whenever any changes are detected in the location of the device. The distanceFilter property of the location manager allows applications to specify the amount of distance the device location must change before an update is triggered. If, for example, the distance filter is set to 1000 meters the application will only receive a location update when the device travels 1000 meters or more from the location of the last update. For example, to specify a distance filter of 1500 meters:

locationManager.distanceFilter = 1500.0
The distance filter may be cancelled, thereby returning to the default setting, using the kCLDistanceFilterNone constant:

locationManager.distanceFilter = kCLDistanceFilterNone





























