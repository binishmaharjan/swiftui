//
//  FruitHeaderView.swift
//  Fructus
//
//  Created by Maharjan Binish on 2020/10/26.
//

import SwiftUI

struct FruitHeaderView: View {
    //MARK: Properties
    var fruit: Fruit
    
    var linearGradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: fruit.gradientColors),
                       startPoint: .top,
                       endPoint: .bottom)
    }
    
    //MARK: Body
    var body: some View {
        
        ZStack {
            
            linearGradient
            
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 6, y: 8)
                .padding(.vertical, 20)
            
        } //: ZStackView
        .frame(height: 440)
    }
}

//MARK: Preview
struct FruitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FruitHeaderView(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 375, height: 440))
    }
}
