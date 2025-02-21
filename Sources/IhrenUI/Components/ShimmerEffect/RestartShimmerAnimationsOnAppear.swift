//
//  View+RestartShimmerAnimationsOnAppear.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 03.02.2025..
//

import SwiftUI

struct RestartShimmerAnimationsOnAppearViewModifier: ViewModifier {

    @EnvironmentObject private var animationSynchronizer: ShimmerAnimationSynchronizer

    func body(content: Content) -> some View {
        content
            .onAppear {
                animationSynchronizer.restartAnimation()
            }
    }
}

public extension View {

    func restartShimmerAnimationsOnAppear() -> some View {
        self.modifier(RestartShimmerAnimationsOnAppearViewModifier())
    }
}
