import CoreLocation
import UIKit

//MARK: - Constants

struct K {

    

    static let uuid                       = "AF80D50E-9905-4562-B154-AB5C82B635ED"
    static let beaconID                   = "iOS Beacon"
    static let major : CLBeaconMajorValue = 1
    static let minor : CLBeaconMinorValue = 1
    
    ///App-wide Settings
    static let defaultColor  = "DefaultColor"
    static let emptyString   = ""
    
    ///User Interface
    static let imageBeaconBall = "BeaconBall"
    
    ///Alert Settings
    // Used for app's popup alerts
    static let alert          = "Alert"
    static let titleTextColor = "titleTextColor"
    static let ok             = "OK"
    
    ///Alert Messages
    static let labelNoBluetooth   = "No Bluetooth"
    static let noBluetooth        = "This device does not have bluetooth powered on."
    static let noBluetoothSupport = "The device running this app does not support bluetooth."
    static let simulator          = "Unfortunately simulators lack bluetooth capabilities needed to act as a bluetooth beacon. Please use this app on an iOS device with bluetooth."
    
    /// Pulse Settings
    static let transmitting                    = "Transmitting"
    static let start                           = "START"
    static let pulseAnimationKey               = "pulse"
    static let opacity                         = "opacity"
    static let scaleXY                         = "transform.scale.xy"  
    static let numPulse                        = 9
    static let radius: CGFloat                 = 300
    static let repeatMax                       = MAXFLOAT
    static let instanceDelay                   = 1.0
    static let animationDuration: TimeInterval = 8
    static let alpha : CGFloat                 = 0.75
    static let scaleAnimationFrom              = 0.25
    static let scaleAnimationTo                = 1.0
    static let keyValues: [NSNumber]           = [0.0, 0.3, 1.0]
}


