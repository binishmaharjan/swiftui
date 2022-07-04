//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Maharjan Binish on 2022/07/05.
//

import SwiftUI


struct WeatherView: View {
    
    // MARK: State
    @State private var searchText = ""
    
    // MARK: Body
    var body: some View {
        
        // MARK: Content View
        ZStack {
            
            // MARK: Background Color
            Color.background
                .ignoresSafeArea()
            
            // MARK: Weather Widget
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 20) {
                    
                    ForEach(searchResults) { forecast in
                        
                        WeatherWidget(forecast: forecast)
                        
                    }
                    
                }
                
            } //: Weather Widget
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
            
            
        } //: Content View
        .overlay {
            // MARK: Custom Navigation Bar
            NavigationBar(searchText: $searchText)
        }
        .navigationBarHidden(true)
        .searchable(text: $searchText)
    }
}

// MARK: Computed Properties
extension WeatherView {
    
    private var searchResults: [Forecast] {
        if searchText.isEmpty {
            return Forecast.cities
        } else {
            return Forecast.cities.filter { $0.location.contains(searchText) }
        }
    }
}


// MARK: Preview
struct WeatherView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            WeatherView()
                .preferredColorScheme(.dark)
        }
    }
}
