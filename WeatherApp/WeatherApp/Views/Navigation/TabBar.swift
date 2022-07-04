//
//  TabBar.swift
//  WeatherApp
//
//  Created by Maharjan Binish on 2022/07/03.
//

import SwiftUI

struct TabBar: View {
    
    // MARK: Properties
    var action: () -> Void
    
    // MARK: Body
    var body: some View {
        
        // MARK: Content View
        ZStack {
            
            // MARK: Arc
            Arc()
                .fill(Color.tabBarBackground)
                .frame(height: 88)
                .overlay(
                    Arc()
                        .stroke(lineWidth: 1)
                        .foregroundColor(.tabBarBorder)
                )
            
            
            // MARK: Tab Items
            HStack {
                
                // Expand Button
                Button(action: action) {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44, height: 44)
                }
                
                Spacer()
                
                // Navigation Button
                NavigationLink(destination: WeatherView()) {
                    Image(systemName: "list.star")
                        .frame(width: 44, height: 44)
                }
                
            } //: Tab Items
            .font(.title2)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 20, leading: 32, bottom: 24, trailing: 32))
                
            
        } //: Content View
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        
    }
}

// MARK: Preview
struct TabBar_Previews: PreviewProvider {
    
    static var previews: some View {
        TabBar(action:  { })
            .preferredColorScheme(.dark)
    }
}
