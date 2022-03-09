//
//  MapView.swift
//  swift_ui_test1
//
//  Created by ldd on 2021/11/2.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286
                                       , longitude: -116.166_868), span: MKCoordinateSpan(
                                        latitudeDelta: 0.2, longitudeDelta: 0.2
                                       )
        
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
    
//
//    func makeUIView(context: Context) -> some MKMapView {
//
//        return MKMapView(frame: .zero)
//    }
//
//    func updateUIView(_ uiView: MKMapView, context: Context) {
//       let coordinate = CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868)
//        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
//        let reg = MKCoordinateRegion(center: coordinate,span: span)
//        uiView.setRegion(reg, animated: true)
//
//    }
    

    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
