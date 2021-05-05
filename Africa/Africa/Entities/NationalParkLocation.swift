//
//  NationalParkLocation.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/05/06.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
    
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    var location: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}
