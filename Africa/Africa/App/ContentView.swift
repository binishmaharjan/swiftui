//
//  ContentView.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/04/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: Enums
    enum GridColumns: Int {
        case one = 1
        case two = 2
        case three = 3

        func icon(isGridViewActive: Bool) -> String {
            switch self {
            case .one:
                return isGridViewActive ? "square.grid.2x2" : "rectangle.grid.1x2"
            case .two:
                return isGridViewActive ? "square.grid.3x2" : "square.grid.2x2"
            case .three:
                return isGridViewActive ? "rectangle.grid.1x2" : "square.grid.3x2"
            }
        }
    }
    
    // MARK: Properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var gridColumn: GridColumns = .two
    
    private var listViewButton: some View {
        Button(action: {
            isGridViewActive = false
            haptics.impactOccurred()
        }) {
            Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundColor(isGridViewActive ? .accentColor : .primary)
        }
    }
    
    private var gridViewButton: some View {
        Button(action: {
            if isGridViewActive {
                switchGrid()
            }
            isGridViewActive = true
            haptics.impactOccurred()
        }) {
            Image(systemName: gridColumn.icon(isGridViewActive: isGridViewActive))
                .font(.title2)
                .foregroundColor(isGridViewActive ? .primary : .accentColor)
        }
    }
    
    private var listView: some View {
        List {
            
            CoverImageView()
                .frame(height: 300)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            ForEach(animals) { animal in
                
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                    
                    AnimalListItemView(animal: animal)
                    
                } //: NavigationLink
                
            } //: ForEach
            
        } //: List
    }
    
    var gridView: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            LazyVGrid(columns: gridLayout) {
                
                ForEach(animals) { animal in
                    
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                        
                        AnimalGridItemView(animal: animal)
                        
                    } //: NavigationLink
                    
                } //: ForEach
                
                CreditCardView() 
                    .modifier(CenterModifier())
                
            } //: LazyVGrid
            
        } //: ScrollView
    }
    
    // MARK: Body
    var body: some View {
     
        NavigationView {
            
            Group {
                
                if isGridViewActive {
                    gridView
                } else {
                    listView
                }
                
            } //: Group
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    HStack(spacing: 16) {
                        
                        listViewButton
                        
                        gridViewButton
                            .padding(10)
                            .animation(.easeIn)
                        
                    } //: HStackView
                    
                } //: ToolBatItem
                
            }
        } //: NavigationView
    }
    
    func switchGrid() {
        let nextCount = gridColumn.rawValue % 3 + 1
        gridColumn = GridColumns(rawValue: nextCount) ?? .two
        gridLayout = Array(repeating: GridItem(.flexible()), count: nextCount)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
