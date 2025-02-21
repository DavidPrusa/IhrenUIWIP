//
//  View+SyncShimmerAnimations.swift
//  IhrenUI
//

import SwiftUI

public extension View {

    func syncShimmerAnimations(animationDuration: TimeInterval = 2.0) -> some View {
        self.environmentObject(ShimmerAnimationSynchronizer(animationDuration: animationDuration))
    }
}
