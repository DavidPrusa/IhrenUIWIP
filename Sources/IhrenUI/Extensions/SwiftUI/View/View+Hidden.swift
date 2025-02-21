//
//  View+Hidden.swift
//  IhrenUI
//

import SwiftUI

public extension View {
    
    func hidden(_ isHidden: Bool) -> some View {
        self.opacity(isHidden ? 0 : 1)
            .allowsHitTesting(!isHidden)
    }
}
