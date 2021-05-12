//
//  GalleryView.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/04/21.
//

import SwiftUI

struct GalleryView: View {
    // MARK: Properties
    
    // MARK: Bodies
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            Text("")
            
        } //: Scroll View
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
