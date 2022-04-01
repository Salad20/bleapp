import Foundation
import CoreLocation
import CoreBluetooth

protocol BeaconManagerDelegate {
    func showAlert(message: String)
    func advertiseDevice()
    func stopAdvertising()
    func startAdvertising()
}

class BeaconManager: NSObject {
    
    var beaconRegion: CLBeaconRegion!
    var delegate: BeaconManagerDelegate?
    let peripheralManager = CBPeripheralManager()
    let alertManager      = AlertManager()
    var didNotify: Bool   = false  
    var isBluetoothAvailable: Bool?
    
    override init() {
        super.init()
        peripheralManager.delegate = self
        
        #if targetEnvironment(simulator)
            isBluetoothAvailable = false
        #else
            isBluetoothAvailable = true
        #endif
    }
    
    func startAdvertising() {
        
        guard let beaconRegion = beaconRegion else { return }
        delegate?.startAdvertising()
        
        if peripheralManager.state == .poweredOn {
            isBluetoothAvailable = true
            advertiseDevice(region: beaconRegion)
        } else {
            isBluetoothAvailable = false
            #if targetEnvironment(simulator)
            didNotify == false ? delegate?.showAlert(message: K.simulator) : print(K.simulator)
            didNotify = true
            #else
            delegate?.showAlert(message: K.noBluetooth)
            #endif
        }
    }
    
    func advertiseDevice(region : CLBeaconRegion) {
        delegate?.advertiseDevice()
        let peripheralData = region.peripheralData(withMeasuredPower: nil) as? [String : Any]
        if peripheralManager.isAdvertising { peripheralManager.stopAdvertising() }
        peripheralManager.startAdvertising(peripheralData)
    }
    
    func stopAdvertising() {
        delegate?.stopAdvertising()
        if peripheralManager.isAdvertising { peripheralManager.stopAdvertising() }
    }
    
    func createBeaconRegion(majorIndex: Int = 0, minorIndex: Int = 0) {
        
        guard let proximityUUID = UUID(uuidString: K.uuid) else { return }
        
        let major = CLBeaconMajorValue(majorIndex + 1)
        let minor = UInt16(minorIndex + 1)
        
        beaconRegion = CLBeaconRegion(proximityUUID: proximityUUID,
                                      major        : CLBeaconMajorValue(major),
                                      minor        : CLBeaconMinorValue(minor),
                                      identifier   : K.beaconID)
    }
}


extension BeaconManager: CBPeripheralManagerDelegate {
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        
        switch peripheral.state {
            case .unknown:
                print("unknown")
            case .resetting:
                print("resetting")
            case .unsupported:
                delegate?.showAlert(message: K.noBluetoothSupport)
                print(K.noBluetoothSupport)
            case .unauthorized:
                print("unauthorized")
            case .poweredOff:
                print("Bluetooth powered off")
                peripheralManager.stopAdvertising()
            case .poweredOn:
                print("Bluetooth powered on")
            default:
                print("Check for additional cases of state on CBCentralManager ")
        }
    }
}

