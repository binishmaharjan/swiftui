//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/04/24.
//

import SwiftUI

struct InsetGalleryView: View {
    
    // MARK: Properties
    let animal: Animal
    
    // MARK: Body
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(alignment: .center, spacing: 16) {
                
                ForEach(animal.gallery, id: \.self) { item in
                  
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                    
                } //: ForEach
                
            } //: HStack
            
        } //: Scroll View
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
            
    }
}
