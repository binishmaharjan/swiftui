//
//  Blur.swift
//  WeatherApp
//
//  Created by Maharjan Binish on 2022/07/03.
//

import SwiftUI

// MARK: Backdrop View from blur
final class UIBackdropView: UIView {
    
    override class var layerClass: AnyClass {
        NSClassFromString("CABackdropLayer") ?? CALayer.self
    }
}

// Wrapper to use UIBackdropView in SwiftUI
struct Backdrop: UIViewRepresentable {

    typealias UIViewType = UIBackdropView
    
    func makeUIView(context: Context) -> UIBackdropView {
        UIBackdropView()
    }
    
    func updateUIView(_ uiView: UIBackdropView, context: Context) {
        /* No Implementation */
    }
}

// MARK: Blur
struct Blur: View {
    
    // MARK: Properties
    var radius: CGFloat
    var opaque: Bool
    
    // MARK: Body
    var body: some View {
        
        Backdrop()
            .blur(radius: radius, opaque: opaque)
        
    }
}

// MARK: Preview
struct Blur_Previews: PreviewProvider {
    
    static var previews: some View {
        Blur(radius: 25, opaque: false)
    }
}
