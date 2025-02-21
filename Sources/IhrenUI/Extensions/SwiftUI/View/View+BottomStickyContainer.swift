//
//  View+BottomStickyContainer.swift
//  IhrenUI
//

import SwiftUI

public extension View {
    
    /// Container with shadow, background and rounded corners. It is positioned above bottom safe area and animates with keyboard.
    /// - Parameter topPadding:    When keyboard shows, SwiftUI will auto-scroll so that Textfield is just above this sticky view. This adds spacing between sticky view and Textfield.
    func bottomStickyContainer(
        backgroundColor: Color = .ia.white,
        cornerRadius: CGFloat = .radius.bottomSheet,
        topPadding: CGFloat? = nil,
        shouldIgnoreKeyboard: Bool = true,
        @ViewBuilder _ content: () -> some View
    ) -> some View {
        self.safeAreaInset(edge: .bottom) {
            VStack(spacing: 0) {
                if let topPadding {
                    Spacer()
                        .frame(height: topPadding)
                }
                
                content()
                    .frame(maxWidth: .infinity)
                    .background(backgroundColor)
                    .mask(.bottomSheet(cornerRadius: cornerRadius))
                    .shadow(.bottomSheet)
                
                // The purpose of this rectangle is to set background color of bottom safe area. It is colored automatically by last view.
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 0)
                    .background(backgroundColor)
            }
        }
        .applyIf(shouldIgnoreKeyboard) {
            $0.ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

