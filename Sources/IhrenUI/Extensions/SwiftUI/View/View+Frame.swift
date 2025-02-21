//
//  View+Frame.swift
//  IhrenUI
//

import SwiftUI

public extension View {

    func frame(size: CGFloat, alignment: Alignment = .center) -> some View {
        self.frame(width: size, height: size, alignment: alignment)
    }

    func maxFrame(alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
}
