//
//  HeadingView.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/04/24.
//

import SwiftUI

struct HeadingView: View {
    
    // MARK: Properties
    let headingImage: String
    let headingTitle: String
    
    // MARK: Body
    var body: some View {
        
        HStack {
            
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingTitle)
                .font(.title3)
                .fontWeight(.bold)
            
        } //: HStack
        .padding(.vertical)
        
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled",
                    headingTitle: "Wilderness In Picture")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
