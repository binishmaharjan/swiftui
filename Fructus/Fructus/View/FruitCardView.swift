//
//  FruitCardView.swift
//  Fructus
//
//  Created by Maharjan Binish on 2020/10/26.
//

import SwiftUI

struct FruitCardView: View {
    
    //MARK: Properties
    var linearGradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: fruit.gradientColors),
                       startPoint: .top,
                       endPoint: .bottom)
    }
    
    @State var isAnimating: Bool = false
    var fruit: Fruit
    
    //MARK: Body
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0: 0.6)
                
                Text(fruit.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color.black.opacity(0.15), radius: 2, x: 2, y: 2)
                
                Text(fruit.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                
                StartButtonView()
                
            }//: VStack
            
        } //: ZStack
        .onAppear {
            withAnimation(.easeInOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(linearGradient)
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}


//MARK: Preview
struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData[1])
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
