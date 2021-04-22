//
//  ContentView.swift
//  Fructus
//
//  Created by Maharjan Binish on 2020/10/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: Properties
    @State private var isShowingSettings: Bool  = false
    
    var fruits: [Fruit] = fruitsData
    var settingsButton: some View {
        Button(action: {
            isShowingSettings = true
        }) {
            Image(systemName: "slider.horizontal.3")
        }
    }
    
    //MARK: Body
    var body: some View {
        NavigationView {
            
            List {
                
                ForEach(fruits.shuffled()) { item in
                    
                    NavigationLink(destination: FruitDetailView(fruit: item)) {
                        
                        FruitRow(fruit: item)
                            .padding(.vertical, 4)
                        
                    } //: NavigationLink
                    
                    
                }//: ForEach
                
            }//: ListView
            .navigationTitle("Fruits")
            .navigationBarItems(trailing: settingsButton)
            .sheet(isPresented: $isShowingSettings) {
                SettingsView()
            }
            
        }//: NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

//MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
