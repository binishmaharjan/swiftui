//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Maharjan Binish on 2022/07/03.
//

import SwiftUI

struct ForecastView: View {
    
    // MARK: State
    @State private var selection = 0
    
    // MARK: Properties
    var bottomSheetTranslationProrated: CGFloat
    
    // MARK: Body
    var body: some View {
        
        // MARK: Content View
        ScrollView {
            
            VStack(spacing: 0) {
                
                // MARK: Segmented Control
                SegmentControl(selection: $selection)
                
                // MARK: Forecast Cards
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 12) {
                        
                        if selection == 0 {
                            
                            ForEach(Forecast.hourly) { forecast in
                                ForecastCard(forecast: forecast, forecastPeriod: .hourly)
                            }
                            .transition(.offset(x: -430))
                            
                        } else {
                            
                            ForEach(Forecast.weekly) { forecast in
                                ForecastCard(forecast: forecast, forecastPeriod: .weekly)
                            }
                            .transition(.offset(x: 430))
                            
                        }
                        
                    }
                    .padding(.vertical, 20)
                    
                } //: Forecast Cards
                .padding(.horizontal, 20)
                
                // MARK: Forecast Widgets(Image)
                Image("Forecast Widgets")
                    .opacity(bottomSheetTranslationProrated)
                
            } //: VStack
            
        } //: Content View
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(
            shape: RoundedRectangle(cornerRadius: 44),
            color: Color.bottomSheetBorderMiddle,
            lineWidth: 1,
            offsetX: 0,
            offsetY: 1,
            blur: 0,
            blendMode: .overlay,
            opacity: 1 - bottomSheetTranslationProrated
        )
        .overlay {
            // MARK: Bottom Sheet Separator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay {
            // MARK: Drag Indicator
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

// MARK: Preview
struct ForecastView_Previews: PreviewProvider {
    
    static var previews: some View {
        ForecastView(bottomSheetTranslationProrated: 1)
            .background(Color.background)
            .preferredColorScheme(.dark)
    }
}
