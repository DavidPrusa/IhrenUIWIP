//
//  ShimmerAnimationSynchronizer.swift
//  IhrenUI
//

import SwiftUI

@MainActor
final class ShimmerAnimationSynchronizer: ObservableObject {
    
    @Published private(set) var animationProgress: CGFloat = 0.0
    
    private let animationDuration: TimeInterval
    private var animationID = UUID()
    
    init(animationDuration: TimeInterval) {
        self.animationDuration = animationDuration
        
        animate()
    }
    
    func animate() {
        animationProgress = 0
        
        // Using iOS 17.0+ completion closure variant of withAnimation will exectue the completion closure immediately as it's not updating any View body's.
        withAnimation(.linear(duration: animationDuration)) {
            animationProgress = 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) { [weak self, animationID] in
            guard animationID == self?.animationID else { return }

            self?.animate()
        }
    }
    
    func restartAnimation() {
        animationID = UUID()
        animate()
    }
}
