//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/04/30.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    // MARK: Enum
    enum VideoFormat: String {
        case mp4
    }
    
    // MARK: Properties
    let videoSelected: String
    let videoTitle: String
    
    var overlayLogo: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 32, height: 32)
            .padding(.top, 6)
            .padding(.horizontal, 8)
    }
    
    // MARK: Body
    var body: some View {
        
        VStack {
            
            VideoPlayer(
                player: playVideo(
                    fileName: videoSelected,
                    fileFormat: VideoFormat.mp4.rawValue
                )
            ) { /* SubViews */ }
            .overlay(overlayLogo, alignment: .topLeading)
            
        }//: VStack
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        NavigationView {
            
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
            
        }
    }
}
