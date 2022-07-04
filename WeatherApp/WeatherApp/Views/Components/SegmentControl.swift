//
//  SegmentControl.swift
//  WeatherApp
//
//  Created by Maharjan Binish on 2022/07/04.
//

import SwiftUI

struct SegmentControl: View {
    
    // MARK: Properties
    @Binding var selection: Int
    
    // MARK: Body
    var body: some View {
        
        // MARK: Content View
        VStack(spacing: 5) {
            
            // MARK: Segmented Buttons
            HStack {
                
                Button("Hourly Forecast") {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        selection = 0
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
                Spacer()
                
                Button("Weekly Forecast") {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        selection = 1
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
            } //: Segmented Buttons
            .font(.subheadline.weight(.semibold))
            .foregroundColor(.secondary)
            
            // MARK: Separator
            Divider()
                .background(.white.opacity(0.5))
                .blendMode(.overlay)
                .shadow(color: .black.opacity(0.2), radius: 0, x: 0, y: 1)
                .blendMode(.overlay)
                .overlay {
                    // MARK: Underline
                    
                    HStack {
                        
                        Divider()
                            .frame(width: UIScreen.main.bounds.width / 2, height: 3)
                            .background(Color.underline)
                            .blendMode(.overlay)
                        
                    } //: HStack
                    .frame(maxWidth: .infinity, alignment: selection == 0 ? .leading : .trailing)
                    .offset(y: -1)
                    
                }
            
        } //: Content View
        .padding(.top, 25)
        
    }
}

// MARK: Preview
struct SegmentControl_Previews: PreviewProvider {
    
    static var previews: some View {
        SegmentControl(selection: .constant(0))
    }
}
