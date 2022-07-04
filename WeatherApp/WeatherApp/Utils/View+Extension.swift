//
//  View+Extension.swift
//  WeatherApp
//
//  Created by Maharjan Binish on 2022/07/03.
//

import SwiftUI

extension View {
    
    func backgroundBlur(radius: CGFloat = 3, opaque: Bool = false) -> some View {
        self.background(
            Blur(radius: radius, opaque: opaque)
        )
    }
    
    func innerShadow<S: Shape, SS: ShapeStyle>(
        shape: S,
        color: SS,
        lineWidth: CGFloat = 1.0,
        offsetX: CGFloat = 0.0,
        offsetY: CGFloat = 0.0,
        blur: CGFloat = 4.0,
        blendMode: BlendMode = .normal,
        opacity: Double = 1.0
    ) -> some View {
        self.overlay {
            // MARK: Bottom Sheet Inner Shadow
            shape
                .stroke(color, lineWidth: lineWidth)
                .blendMode(blendMode)
                .offset(x:offsetX, y: offsetY)
                .blur(radius: blur)
                .mask(shape)
                .opacity(opacity)
        }
    }
}
