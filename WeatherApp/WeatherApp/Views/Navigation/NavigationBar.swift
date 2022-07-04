//
//  NavigationBar.swift
//  WeatherApp
//
//  Created by Maharjan Binish on 2022/07/05.
//

import SwiftUI

struct NavigationBar: View {
    
    // MARK: State And Environment
    @Environment(\.dismiss) var dismiss
    @Binding var searchText: String
    
    // MARK: Body
    var body: some View {
        
        // MARK: Content View
        VStack {
            
            HStack {
                
                // MARK: Back Button
                Button {
                    dismiss()
                } label: {
                   
                    HStack(spacing: 5) {
                        
                        // MARK: Back Button Icon
                        Image(systemName: "chevron.left")
                            .font(.system(size: 23).weight(.medium))
                            .foregroundColor(.secondary)
                        
                        // MARK: Back Button Label
                        Text("Weather")
                            .font(.title)
                            .foregroundColor(.primary)
                        
                    }
                    .frame(height: 44)
                    
                } //: Back Button
                
                Spacer()
                
                // MARK: More Button
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 28))
                    .frame(width: 44, height: 44, alignment: .trailing)
                
            }
            .frame(height: 52)
            
            // MARK: Search Bar
            HStack {
                
                Image(systemName: "magnifyingglass")
                
                TextField("Search for a city or airport", text: $searchText)
                
            } //: Search Bar
            .foregroundColor(.secondary)
            .padding(.horizontal, 6)
            .padding(.vertical, 7)
            .frame(height: 36, alignment: .leading)
            .background(Color.bottomSheetBackground, in: RoundedRectangle(cornerRadius: 10))
            .innerShadow(
                shape: RoundedRectangle(cornerRadius: 10),
                color: .black.opacity(0.25),
                lineWidth: 2,
                offsetX: 0,
                offsetY: 2,
                blur: 2
            )
            
        } //: Content View
        .frame(height: 106, alignment: .top)
        .padding(.horizontal, 16)
        .padding(.top, 49)
        .backgroundBlur(radius: 20, opaque: true)
        .background(Color.navBarBackground)
        .frame(maxHeight: .infinity)
        .ignoresSafeArea()
        
    }
}

// MARK: Preview
struct NavigationBar_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationBar(searchText: .constant(""))
    }
}
