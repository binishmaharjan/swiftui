//
//  ContentModifier.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/05/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        HStack() {
            
            Spacer()
            
            content
            
            Spacer()
            
        } // : HStack
        
    }
}
