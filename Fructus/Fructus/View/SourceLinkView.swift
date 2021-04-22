//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Maharjan Binish on 2020/10/26.
//

import SwiftUI

struct SourceLinkView: View {
    //MARK: Properties
    
    //MARK: Body
    var body: some View {
        GroupBox() {
            
            HStack {
                
                Text("Content Source")
                
                Spacer()
                
                Link("Wikipedia", destination: URL(string: "http://wikipedia.com")!)
                
                Image(systemName: "arrow.up.right.square")
                
            } //HStackView
            .font(.footnote)
            
        } //: GroupBox
    }
}

//MARK: Preview
struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
