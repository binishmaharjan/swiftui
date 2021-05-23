//
//  CreditCardView.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/05/23.
//

import SwiftUI

struct CreditCardView: View {
    // MARK: Properties
    private let copyRightText = """
Copyright © Robert Petras
All right reserved
Africa App
"""
    // MARK: Body
    var body: some View {
        
        VStack {
            
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text(copyRightText)
                .font(.footnote)
                .multilineTextAlignment(.center)
            
        } //: VStack
        .padding()
        .opacity(0.4)
        
    }
}

struct CreditCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
