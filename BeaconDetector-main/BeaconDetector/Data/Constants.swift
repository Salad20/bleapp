

import Foundation
import CoreLocation

enum BeaconStatus: String {
    case unknown   = "Unknown"
    case immediate = "Here"
    case near      = "Nearby"
    case far       = "Far Away"
}



struct K {
    ///Beacon settings
    static var uuid                       = "AF80D50E-9905-4562-B154-AB5C82B635ED"
    static var beaconID                   = ""
    static var major : CLBeaconMajorValue = 0
    static var minor : CLBeaconMinorValue = 0
    
    ///Default settings
    static var defaultImage               = "Blank"
    static var emptyString                = ""
    
    /// Alerts
    static var ok                         = "OK"
    static var alert                      = "Alert"
    static var locationNeeded             = "Location Services is needed to operate beacon detector."

}
