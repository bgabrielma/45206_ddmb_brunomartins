//
//  ViewController.swift
//  gps-example
//
//  Created by Developer on 09/07/2019.
//  Copyright © 2019 istec. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    // Manager da biblioteca core location
    var locManager:CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locManager = CLLocationManager()
        locManager?.delegate = self
        
        // Nivel de precisão do GPS
        locManager?.desiredAccuracy = kCLLocationAccuracyBest
        
        // começa o mecânismo do GPS
        locManager?.startUpdatingLocation()
    }

    @IBAction func ISTEC(_ sender: Any) {
        self.getCod(for: "Rua Fernando Lopes Graça Mercês")
    }
    
    @IBAction func GPS(_ sender: Any) {
        switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                locManager?.requestWhenInUseAuthorization()
            case .authorizedAlways:
                print("GPS Ligado authorizedAlways")
            case .authorizedWhenInUse:
            
                guard let local = locManager?.location else {
                    print("Localização não disponível")
                    return
                }
            
                print("lat: \(local.coordinate.latitude), long: \(local.coordinate.longitude)")
                self.getPlaceMark(for: local)
            
        case .denied:
                print("GPS não Ligado denied")
            default:
                print("Erro")
        }
    }
    
    func getPlaceMark(for local: CLLocation) {
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(local) {(pl, erro) in
            if erro != nil {
                print("Ocorreu um erro inesperado.")
                return
            }
            
            print("thoroughfare: \(String(describing: pl?.first?.thoroughfare)). subthoroughfare: \(String(describing: pl?.first?.subThoroughfare))")
        }
    }
    
    func getCod(for address: String) {
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(address) { (pl, erro) in
            if erro != nil {
                print("Ocorreu um erro inesperado.")
                return
            }
            
            print(pl?.first ??  "asasa")
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    /*
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    } */
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for _ in locations {
            /*
             print(local)
             */
        }
    }
}
