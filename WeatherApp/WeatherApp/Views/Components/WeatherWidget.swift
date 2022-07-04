//
//  WeatherWidget.swift
//  WeatherApp
//
//  Created by Maharjan Binish on 2022/07/05.
//

import SwiftUI

struct WeatherWidget: View {
    
    // MARK: Properties
    var forecast: Forecast
    
    // MARK: Body
    var body: some View {
        
        // MARK: Content View
        ZStack(alignment: .bottom) {
            
            // MARK: Trapezoid
            Trapezoid()
                .fill(Color.weatherWidgetBackground)
                .frame(width: 342, height: 174)
            
            // MARK: Content
            HStack(alignment: .bottom) {
                
                // MARK: Forecast Detail
                VStack(alignment: .leading, spacing: 8) {
                    
                    // MARK: Forecast Temperature
                    Text("\(forecast.temperature)°")
                        .font(.system(size: 64))
                    
                    VStack(alignment: .leading, spacing: 2) {
                        
                        // MARK: Forecast Temperature Range
                        Text("H: \(forecast.high)° L: \(forecast.low)°")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        
                        // MARK: Forecast Location
                        Text(forecast.location)
                            .font(.body)
                            .lineLimit(1)
                    }
                    
                } //: Forecast Detail
                
                Spacer()
                
                // MARK: Forecast Icon
                VStack {
                    
                    // MARK: Forecast Large Icon
                    Image("\(forecast.icon) large")
                        .padding(.trailing, 4)
                    
                    // MARK: Weather
                    Text(forecast.weather.rawValue)
                        .font(.footnote)
                        .padding(.trailing, 24)
                    
                } //: Forecast Icon
                
            } //: Content
            .foregroundColor(.white)
            .padding(.bottom, 20)
            .padding(.leading, 20)
            
        } //: MARK: Content View
        .frame(width: 342, height: 184, alignment: .bottom)
        
    }
}

// MARK: Preview
struct WeatherWidget_Previews: PreviewProvider {
    
    static var previews: some View {
        WeatherWidget(forecast: Forecast.cities[0])
            .preferredColorScheme(.dark)
    }
}
