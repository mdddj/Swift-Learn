//
//  landmark.swift
//  swift_ui_test1
//
//  Created by ldd on 2021/11/5.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark : Hashable,Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates : Hashable,Codable {
        var latitude: Double
        var longitude: Double
    }
    
}
