//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/04/24.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: Properties
    let animal: Animal
    
    // MARK: Body
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 20) {
                
                // Hero Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                // Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // Gallery
                Group {
                    
                    HeadingView(headingImage: "photo.on.rectangle.angled",
                                headingTitle: "Wilderness in Pictures")
                    
                    InsetGalleryView(animal: animal)
                    
                } //: Group
                .padding(.horizontal)
                
                // Facts
                Group {
                    
                    HeadingView(headingImage: "questionmark.circle",
                                headingTitle: "Did you know?")
                    
                    InsetFactView(animal: animal)
                    
                } //: Group
                .padding(.horizontal)
                
                // Description
                Group {
                    
                    HeadingView(headingImage: "info.circle",
                                headingTitle: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                    
                } //: Group
                .padding(.horizontal)
                
                // Map
                Group {
                    
                    HeadingView(headingImage: "map",
                                headingTitle: "National Park")
                    
                    InsetMapView()
                    
                } //: Group
                .padding(.horizontal)
                
                // Link
                Group {
                    
                    HeadingView(headingImage: "books.vertical",
                                headingTitle: "Learn More")
                    
                   ExternalWebLinkView(animal: animal)
                    
                } //: Group
                .padding(.horizontal)
                
            } //: VStack
            .navigationBarTitle(animal.name, displayMode: .inline)
            
        } //: Scroll View
        
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
    }
}

