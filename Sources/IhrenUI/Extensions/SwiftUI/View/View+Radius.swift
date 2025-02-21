//
//  View+Radius.swift
//  IhrenUI
//
//  Created by Danijel Huis on 13.02.2025..
//

import SwiftUI

extension View {
    public func radius(_ radius: CGFloat) -> some View {
        self.clipShape(RoundedRectangle(cornerSize: .init(width: radius, height: radius)))
    }
}
