//
//  FruitNutrients.swift
//  Fructus
//
//  Created by Maharjan Binish on 2021/04/19.
//

import SwiftUI

struct FruitNutrients: View {
    
    // MARK: Properties
    var fruit: Fruit
    var nutrients = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    
    // MARK: Body
    var body: some View {
        GroupBox() {
            DisclosureGroup("Nutrients value per 100gm") {
                ForEach(0..<nutrients.count, id: \.self) { item in
                    
                    Divider()
                        .padding(.vertical, 2)
                    
                    HStack() {
                        
                        Group{
                            
                            Image(systemName: "icon.circle")
                            
                            Text(nutrients[item])
                            
                        }//: Group
                        .foregroundColor(fruit.gradientColors[1])
                        .font(Font.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        
                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.leading)
                        
                    }//: HStack
                    
                }// : ForEach
                
            }//: DisclosureGroup
            
        }//: GroupBox
    }
}

struct FruitNutrients_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrients(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
