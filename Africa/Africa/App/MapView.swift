//
//  MapView.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/04/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: Properties
    @State private var region: MKCoordinateRegion = {
        let mapCoordinates =  CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomingLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomingLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: Body
    var body: some View {
        
        ZStack {
            
            // MAP VIEW
            Map(coordinateRegion: $region, annotationItems: locations) { (item) in
                
                MapAnnotation(coordinate: item.location) {
                    
                   MapAnnotationView(location: item)
                    
                } //: Map Annotation
                
            } //: MAP
            .ignoresSafeArea()
            
            VStack {
                
                MapLocationIndicatorView(region: $region)
                
                Spacer()
                
            } //: VStack
            
        } //: ZStack
    
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
