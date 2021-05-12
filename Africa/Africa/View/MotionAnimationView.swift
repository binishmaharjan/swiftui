//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/05/13.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: Properties
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    // MARK: Bodies
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                ForEach(0...randomCircle, id:\.self) { item in
                    
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinates(max: geometry.size.width),
                            y: randomCoordinates(max: geometry.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
//                                .repeatCount(1)
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear {
                            isAnimating = true
                        }
                    
                } // : Foreach
                
            } //: ZStack
            .drawingGroup()
            
        } //: Geometry Reader
        
    }
}

// MARK: Motion Animations
extension MotionAnimationView {
    
    /// Random Coordinates
    private func randomCoordinates(max: CGFloat) -> CGFloat {
        CGFloat.random(in: 0...max)
    }
    
    /// Random Size
    private func randomSize() -> CGFloat {
        CGFloat.random(in: 10...250)
    }
    
    /// Random Scale
    private func randomScale() -> CGFloat {
        CGFloat(Double.random(in: 0.1...2.0))
    }
    
    /// Random Speed
    private func randomSpeed() -> Double {
        Double.random(in: 0.025...1.0)
    }
    
    /// Random Delay
    private func randomDelay() -> Double {
        Double.random(in: 0...0.2)
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
