//
//  ShimmerEffect.swift
//  IhrenUI
//

import SwiftUI

public struct ShimmerEffect: View {

    let width: CGFloat
    let backgroundColor: Color
    let accentColor: Color
    let angle: Angle

    @EnvironmentObject private var animationSynchronizer: ShimmerAnimationSynchronizer
    
    public init(width: CGFloat = 1.0,
                backgroundColor: Color = .ia.grey200,
                accentColor: Color = .ia.grey100,
                angle: Angle = .degrees(5)) {
        self.width = width
        self.backgroundColor = backgroundColor
        self.accentColor = accentColor
        self.angle = angle
    }
    
    public var body: some View {
        LinearGradient(
            colors: [backgroundColor, accentColor, backgroundColor],
            startPoint: gradientStartPoint,
            endPoint: gradientEndPoint)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
    }
}

private extension ShimmerEffect {

    var gradientStartPoint: UnitPoint {
        // Start before the gradient is visible
        var xPos: CGFloat = -width
        // Compensate for the tilt
        xPos -= cos(angle.radians)
        // Advance the animation until it's no longer visible
        xPos += (1.5 + width + cos(angle.radians)) * animationProgress

        return .init(x: xPos, y: 0)
    }

    var gradientEndPoint: UnitPoint {
        // Start just before the view begins
        var xPos: CGFloat = 0

        // Advance the animation until it's no longer visible
        xPos += (1.5 + width + cos(angle.radians)) * animationProgress

        // The height change created the "illusion" of tilted gradient
        let yPos = sin(angle.radians)

        return .init(x: xPos, y: yPos)
    }

    var animationProgress: CGFloat {
        animationSynchronizer.animationProgress
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var animationDuration = 1.0

    VStack {
        Text("Animation Duration: \(animationDuration)")

        Slider(value: $animationDuration, in: 0.5...2.5)

        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(0..<50, id: \.self) { index in
                    ShimmerEffect()
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .frame(size: 256)
                }
            }
        }
    }
    .syncShimmerAnimations(animationDuration: animationDuration)
}
