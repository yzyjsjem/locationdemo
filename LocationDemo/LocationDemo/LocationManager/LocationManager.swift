//
//  LocationManager.swift
//  LocationDemo
//
//  Created by 杨振誉 on 14/12/21.
//

import Foundation
import CoreLocation

enum LocationAuthenticationStatus{
    case denied, allowed, notdetermined
    
    init(status: CLAuthorizationStatus){
        switch status {
        case .notDetermined:
            self = .notdetermined
        case .restricted:
            self = .denied
        case .denied:
            self = .denied
        case .authorizedAlways:
            self = .allowed
        case .authorizedWhenInUse:
            self = .allowed
        //case .authorized:
            
        @unknown default:
            self = .notdetermined
        }
    }
}
struct Location{
    let longitude: Double
    let latitude: Double
    
}

final class LocationManager : NSObject{
    
    private(set) var manager = CLLocationManager()
    
    var currentLoaction : Location?
    
    var authenticationstatus : LocationAuthenticationStatus{
        LocationAuthenticationStatus(status: manager.authorizationStatus)
    }
    
    override init() {
        super.init()
        manager.delegate = self
    }
    func RequestAuthenrization(){
        if authenticationstatus == .notdetermined{
            manager.requestWhenInUseAuthorization()
        }
    }
    func requestLocation(){
        manager.requestLocation()
    }
}

extension LocationManager : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            currentLoaction = Location(longitude: location.coordinate.longitude, latitude: location.coordinate.latitude)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //handle error case
    }
}
