//
//  ContentView.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/04/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    
    // MARK: Body
    var body: some View {
     
        NavigationView {
            
            List {
                
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
            }//: List
            .navigationBarTitle("Africa", displayMode: .large)
            
        }//: NavigationView
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
