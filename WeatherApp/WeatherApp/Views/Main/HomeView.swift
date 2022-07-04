//
//  HomeView.swift
//  WeatherApp
//
//  Created by Maharjan Binish on 2022/07/03.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    
    case top = 0.83 // 702/844 (ratio half modal from design file)
    case middle = 0.385 // 325/844 (ratio half modal from design file)
}

struct HomeView: View {
    
    // MARK: State
    @State private var bottomSheetPosition: BottomSheetPosition = .middle
    @State private var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    @State private var hasDragged: Bool = false
    
    // MARK: Properties
    private var bottomSheetTranslationProrated: CGFloat {
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) /
        (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
    
    // MARK: Body
    var body: some View {
        
        NavigationView {
            
            GeometryReader { geometry in
                
                // Screen Height
                let screenHeight = geometry.size.height +
                geometry.safeAreaInsets.top +
                geometry.safeAreaInsets.bottom
                
                let imageOffset = screenHeight + 36
                
                // MARK: Content View
                ZStack {
                    
                    // MARK: Background
                    Color.background
                        .ignoresSafeArea()
                    
                    // MARK: Background Image
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    
                    // MARK: House Image
                    Image("House")
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 257)
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    
                    // MARK: Current Weather Info
                    VStack(spacing: -10 * (1 - bottomSheetTranslationProrated)) {
                        
                        Text("Montreal")
                            .font(.largeTitle)
                        
                        // Temperature Info
                        VStack {
                            
                            Text(attributedString)
                            
                            Text("H: 24° L:18°")
                                .font(.title3.weight(.semibold))
                                .opacity(1 - bottomSheetTranslationProrated)
                            
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.top, 51)
                    .offset(y: -bottomSheetTranslationProrated * 46)
                    
                    // MARK: Bottom Sheet
                    BottomSheetView(
                        position: $bottomSheetPosition,
                        header: { /* No Header */ },
                        content: {
                            
                            ForecastView(bottomSheetTranslationProrated: bottomSheetTranslationProrated)
                            
                        })
                        .onBottomSheetDrag { translation in
                            bottomSheetTranslation = translation / screenHeight
                            
                            withAnimation(.easeInOut) {
                                hasDragged = bottomSheetPosition == BottomSheetPosition.top
                            }
                        }
                    
                    // MARK: Tab Bar
                    TabBar {
                        bottomSheetPosition = .top
                    }
                    .offset(y: bottomSheetTranslationProrated * 115)
                    
                } //: Content View
                .navigationBarHidden(true)
                
            } //: GeometryReader
            
        } //: NavigationView
        
    }
}

// MARK: View And Properties
extension HomeView {
    
    private var attributedString: AttributedString {
        let temperature = "19°"
        let newLine = "\n "
        let pipe = " | "
        let weather = "Mostly Clear"
        
        let temperatureFontSize = (96 - (bottomSheetTranslationProrated * (96 - 20)))
        let temperatureFontWeight: Font.Weight = hasDragged ? .semibold : .thin
        let temperatureForegroundColor: Color = hasDragged ? .secondary : .primary
        
        var string = AttributedString(temperature + (hasDragged ? pipe : newLine) + weather)
        
        if let temperatureRange = string.range(of: temperature) {
            string[temperatureRange].font = .system(size: temperatureFontSize, weight: temperatureFontWeight)
            string[temperatureRange].foregroundColor = temperatureForegroundColor
        }
        
        if let pipeRange = string.range(of: pipe) {
            string[pipeRange].font = .title3.weight(.semibold)
            string[pipeRange].foregroundColor = .secondary.opacity(bottomSheetTranslationProrated)
        }
        
        if let weatherRange = string.range(of: weather) {
            string[weatherRange].font = .title3.weight(.semibold)
            string[weatherRange].foregroundColor = .secondary
        }
        
        return string
    }
}

// MARK: Preview
struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
