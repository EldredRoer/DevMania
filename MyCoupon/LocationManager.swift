//
//  LocationManager.swift
//  MyCoupon
//
//  Created by Eber RoEr on 2016/01/24.
//  Copyright © 2016年 Eber RoEr. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

protocol LocationFoundDelegate{
    func locationFound(location:CLLocation)
}
class LocationManager :NSObject, CLLocationManagerDelegate {
    
    static let sharedInstance = LocationManager()
    
    let locationManager = CLLocationManager()
    
    var locationDelegate:LocationFoundDelegate?
    
    
    func startLocationUpdate() {
        let authStatus = CLLocationManager.authorizationStatus()
        
        if authStatus == .NotDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        if authStatus == .Denied || authStatus == .Restricted {
            showLocationServicesDeniedAlert()
            return
        }
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
    
    func showLocationServicesDeniedAlert() {
            var window: UIWindow?
            let alert = UIAlertController(title: "Location Services Disabled",
            message:
            "Please enable location services for this app in Settings.",
            preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default,
            handler: nil)
            alert.addAction(okAction)
            window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager,
        didFailWithError error: NSError) {
        print("didFailWithError \(error)")
    }
    func locationManager(manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        if let delegate = self.locationDelegate {
           delegate.locationFound(newLocation)
        }
        print("didUpdateLocations \(newLocation)")
    }
}
