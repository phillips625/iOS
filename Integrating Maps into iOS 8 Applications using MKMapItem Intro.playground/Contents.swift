//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//////////////////// MKMapItem and MKPlacemark Classes
The purpose of the MKMapItem class is to make it easy for applications to launch maps without having to write significant amounts of code. MKMapItem works in conjunction with the MKPlacemark class, instances of which are passed to MKMapItem to define the locations that are to be displayed in the resulting map. A range of options are also provided with MKMapItem to configure both the appearance of maps and the nature of turn-by-turn directions that are to be displayed (i.e. whether directions are to be for driving or walking).

//////////////////// An Introduction to Forward and Reverse Geocoding
It is difficult to talk about mapping, in particular when dealing with the MKPlacemark class, without first venturing into the topic of geocoding. Geocoding can best be described as the process of converting a textual based geographical location (such as a street address) into geographical coordinates expressed in terms of longitude and latitude.

//////////// The code simply calls the geocodeAddressString method of a CLGeocoder instance, passing through a string object containing the street address and a completion handler to be called when the translation is complete. Passed as arguments to the handler are an array of CLPlacemark objects (one for each match for the address) together with an Error object which may be used to identify the reason for any failures.
For the purposes of this example the assumption is made that only one location matched the address string provided. The location information is then extracted from the CLPlacemark object at location 0 in the array and the coordinates displayed on the console.
The above code is an example of forward-geocoding in that coordinates are calculated based on a text address description.

let geoCoder = CLGeocoder()
geoCoder.geocodeAddressString("350 5th Avenue New York, NY", completionHandler:
    {(placemarks: [AnyObject]!, error: NSError!) in
        
        if error != nil {
            println("Geocode failed with error: \(error.localizedDescription)") }
        if placemarks.count > 0 {
            let placemark = placemarks[0] as CLPlacemark
            let location = placemark.location
            self.coords = location.coordinate
            println("\(self.coords?.latitude) \(self.coords?.longitude)"
            
            )
        }
})


///////////////  Reverse-geocoding, as the name suggests, involves the translation of geographical coordinates into a human readable address string. Consider, for example, the following code. In this case, a CLLocation object is initialized with longitude and latitude coordinates and then passed through to the reverseGeocodeLocation method of a CLGeocoder object. The method passes through to the completion handler an array of matching addresses in the form of CLPlacemark objects. Each object contains an NSDictionary object which, in turn, contains the address information for the matching location. Once again, the code assumes a single match is contained in the array and uses the dictionary keys to access and display the address, city, state, zip and country values. The address dictionary keys follow the standard defined in the Address Property section of the iOS SDK Address Book Person reference.

let geoCoder = CLGeocoder()
let newLocation = CLLocation(latitude: 40.74835, longitude: -73.984911)
geoCoder.reverseGeocodeLocation(newLocation, completionHandler: {(placemarks: [AnyObject]!, error: NSError!) in
    if error != nil {
        println("Geocode failed with error: \(error.localizedDescription)")
    }
    
    if placemarks.count > 0 {
        let placemark = placemarks[0] as CLPlacemark
        let addressDictionary = placemark.addressDictionary
        let address = addressDictionary[kABPersonAddressStreetKey] as NSString
        let city = addressDictionary[kABPersonAddressCityKey] as NSString
        let state = addressDictionary[kABPersonAddressStateKey] as NSString
        let zip = addressDictionary[kABPersonAddressZIPKey] as NSString
        println("\(address) \(city) \(state) \(zip)") }
})

/////////////  Creating MKPlacemark Instances
Each location that is to be represented when a map is displayed using the MKMapItem class must be represented by an MKPlacemark object.

/////////////// MKMapItem Options and Enabling Turn-by-Turn Directions

MKLaunchOptionsDirectionsModeKey – Controls whether turn-by-turn directions are to be provided with the map. In the event that only one placemarker is present, directions from the current location to the placemarker will be provided. The mode for the directions should be one of either MKLaunchOptionsDirectionsModeDriving or MKLaunchOptionsDirectionsModeWalking.
MKLaunchOptionsMapTypeKey – Indicates whether the map should display satellite, hybrid or standard map images.
MKLaunchOptionsMapCenterKey – Corresponds to a CLLocationCoordinate2D structure value containing the coordinates of the location on which the map is to be centered.
MKLaunchOptionsMapSpanKey – An MKCoordinateSpan structure value designating the region that the map should display when launched.
MKLaunchOptionsShowsTrafficKey – A Boolean value indicating whether or not traffic information should be superimposed over the map when it is launched.

The following code, for example, opens a map with traffic data displayed and includes turn-by-turn driving directions between two map items:
let mapItems = [mapItem, mapItem]
let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,
               MKLaunchOptionsShowsTrafficKey: true] MKMapItem.openMapsWithItems(mapItems, launchOptions: options)

////////////////// Adding Item Details to an MKMapItem
When a location is marked on a map, the address is displayed together with a blue arrow which, when selected, displays an information card for that location.
The MKMapItem class allows additional information to be added to a location through the name, phoneNumber and url properties. The following code, for example, adds these properties to the map item for the Empire State Building:

mapItem.name = "Empire State Building"
mapItem.phoneNumber = "+12127363100"
mapItem.url = NSURL(string: "http://esbnyc.com")
mapItem.openInMapsWithLaunchOptions(nil)


















