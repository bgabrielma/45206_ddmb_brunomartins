//
//  Anot.swift
//  maps
//
//  Created by Developer on 09/07/2019.
//  Copyright © 2019 istec. All rights reserved.
//

import Foundation
import MapKit

class Anot: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(lat: Float, long: Float, titulo:String, subTitulo: String) {
        self.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(long))
        
        self.title = titulo
        self.subtitle = subTitulo
    }
}
