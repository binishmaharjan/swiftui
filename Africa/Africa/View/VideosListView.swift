//
//  VideosListView.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/04/30.
//

import SwiftUI

struct VideosListView: View {
    
    // MARK: Properties
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticsImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: Child Views
    var toolBarItem: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) { shuffleButton }
    }
    
    var shuffleButton: some View {
        Button(action: {
            videos.shuffle()
            hapticsImpact.impactOccurred()
        }) {
            Image(systemName: "arrow.2.squarepath")
        }
    }
    
    // MARK: Body
    var body: some View {
        
        NavigationView {
        
            List {
                
                ForEach(videos) { item  in
                    
                    VideoListItemView(video: item)
                        .padding(.vertical, 8)
                    
                }//: Foreach
                
            } //: List
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar { toolBarItem }
            
        }//: NavigationView
        
    }
}

struct VideosListView_Previews: PreviewProvider {
    static var previews: some View {
        VideosListView()
    }
}
