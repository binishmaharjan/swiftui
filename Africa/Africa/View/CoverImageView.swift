//
//  CoverImageView.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/04/21.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: Properties
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    // MARK: Body
    var body: some View {
        
        TabView {
            
            ForEach(coverImages) { item in
                
                Image(item.name)
                    .resizable()
                    .scaledToFill()
                
            } //: ForEach
            
        } //: TabView
        .tabViewStyle(PageTabViewStyle())
    }
}

// MARK: Preview

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
