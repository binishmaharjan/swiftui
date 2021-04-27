//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/04/28.
//

import SwiftUI

struct ExternalWebLinkView: View {
    //MARK: Properties
    let animal: Animal
    
    // MARK: Body
    var body: some View {
        
        GroupBox {
            
            HStack {
                
                Image(systemName: "globe")
                
                Text("Wikipedia")
                
                Spacer()
                
                Group {
                    
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: URL(string: animal.link)!)
                    
                } //: Group
                .foregroundColor(.accentColor)
                
            } //: HStack
            
        } //: GroupBox
        
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animal.json")
    
    static var previews: some View {
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
