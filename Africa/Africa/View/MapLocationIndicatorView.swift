//
//  MapLocationIndicatorView.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/05/06.
//

import SwiftUI
import MapKit

struct MapLocationIndicatorView: View {
    
    // MARK: Properties
    @Binding var region: MKCoordinateRegion
    
    // MARK: Body
    var body: some View {
        
        HStack(alignment: .center, spacing: 12) {
            
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            
            
            VStack(alignment: .leading, spacing: 3) {
                
                MapLocationIndicatorLabelView(title: "Latitude", degree: region.center.latitude)
                
                Divider()
                
                MapLocationIndicatorLabelView(title: "Longitude", degree: region.center.longitude)
                
            } //: VStack
            
        } //: HStack
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(
            Color.black
                .cornerRadius(8)
                .opacity(0.6)
        )
        .padding()
        
    }
}

struct MapLocationIndicatorLabelView: View {
    
    // MARK: Properties
    let title: String
    let degree: CLLocationDegrees
    
    var body: some View {
        
        HStack {
            
            Text(title)
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
            
            Spacer()
            
            Text("\(degree)")
                .font(.footnote)
                .foregroundColor(.white)
            
        } //: HStack
        
    }
}

struct MapLocationIndicatorView_Previews: PreviewProvider {

    @State static var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599),
        span: MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    )
    
    static var previews: some View {
        
        Group {
            
            MapLocationIndicatorView(region: $region)
                .previewLayout(.sizeThatFits)
            
            MapLocationIndicatorLabelView(title: "Latitude", degree: .init(6.600286))
                .previewLayout(.sizeThatFits)
        }
        
    }
}
