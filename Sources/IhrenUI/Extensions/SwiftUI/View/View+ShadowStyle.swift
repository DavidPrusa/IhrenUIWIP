//
//  View+ShadowStyle.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 29.01.2025..
//

import SwiftUI

@MainActor
public struct ShadowStyle {
    public let color: Color
    public let opacity: Double
    public let radius: Double
    public let offset: CGSize

    /// Color 0xFF000000 (opacity 0.15). Radius 10.
    @MainActor public static let bottomSheet = ShadowStyle(color: .ia.black, opacity: 0.15, radius: 10, offset: CGSize(width: 0, height: 0))
    /// Color 0xFF000000 (opacity 0.25). Radius 10.
    @MainActor public static let floatingButton = ShadowStyle(color: .ia.black, opacity: 0.25, radius: 10, offset: CGSize(width: 0, height: 0))
}

public extension View {

    func shadow(_ style: ShadowStyle) -> some View {
        self.shadow(
            color: style.color.opacity(Double(style.opacity)),
            radius: CGFloat(style.radius),
            x: style.offset.width,
            y: style.offset.height
        )
    }
}

