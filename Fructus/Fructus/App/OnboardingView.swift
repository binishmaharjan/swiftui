//
//  OnboardingView.swift
//  Fructus
//
//  Created by Maharjan Binish on 2020/10/26.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: Properties
    var fruits: [Fruit] = fruitsData
    
    //MARK: Body
    var body: some View {
        TabView {
            
            ForEach(fruits[0..<5]) { item in
                
                FruitCardView(fruit: item)
                
            } // ForEach
            
        } //: TabView
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

//MARK: Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
