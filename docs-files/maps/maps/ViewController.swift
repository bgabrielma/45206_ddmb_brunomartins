//
//  ViewController.swift
//  maps
//
//  Created by Developer on 09/07/2019.
//  Copyright © 2019 istec. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate{
    @IBOutlet weak var mapa: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapa.mapType = .standard
        mapa.showsScale = true
        mapa.showsCompass = true
        mapa.showsUserLocation = true
        
        let lat:Float = 38.76863
        let long:Float = -9.16001
        let cord = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let span = MKCoordinateSpan(latitudeDelta: 0.0005, longitudeDelta: 0.0005)
        
        let anotacao = Anot(lat: lat, long: long, titulo: "ISTEC", subTitulo: "politécnico")
        
        mapa.addAnnotation(anotacao)
        mapa.setCenter(cord, animated:true)
        mapa.setRegion(MKCoordinateRegion(center: cord, span: span), animated: true)
    }
}

extension CLLocationCoordinate2D {
    init(latitude: Any, longitude: Any) {
        
        self.init(latitude: CLLocationDegrees(latitude as? Float ?? 38.7946977), longitude: CLLocationDegrees(longitude as? Float ?? -9.3286712))
    }
}
