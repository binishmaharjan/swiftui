//
//  FruitRow.swift
//  Fructus
//
//  Created by Maharjan Binish on 2020/10/26.
//

import SwiftUI

struct FruitRow: View {
    //MARK: Properties
    var fruit: Fruit
    
    var linearGradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: fruit.gradientColors),
                       startPoint: .top,
                       endPoint: .bottom)
    }
    
    //MARK: Body
    var body: some View {
        HStack {
            
            Image(fruit.image)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: Color.black.opacity(0.3), radius: 3, x: 2, y: 2)
                .background(linearGradient)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(fruit.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(fruit.headline)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
            }//: VStack
        }//: HStack
    }
}

//MARK: Preview
struct FruitRow_Previews: PreviewProvider {
    static var previews: some View {
        FruitRow(fruit: fruitsData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
