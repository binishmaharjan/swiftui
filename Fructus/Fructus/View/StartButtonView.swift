//
//  StartButtonView.swift
//  Fructus
//
//  Created by Maharjan Binish on 2020/10/26.
//

import SwiftUI

struct StartButtonView: View {
    
    //MARK: Properties
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    var capsule: some View {
        Capsule()
            .strokeBorder(Color.white, lineWidth: 1.25)
    }
    
    //MARK: Body
    var body: some View {
        Button(action: {
                isOnboarding = false
        } ) {
            HStack(spacing: 8) {
                
                Text("Start")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
                
            } //: HStack
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(capsule)
            
        }//: Button
        .accentColor(Color.white)
    }
}

//MARK: Preview
struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
