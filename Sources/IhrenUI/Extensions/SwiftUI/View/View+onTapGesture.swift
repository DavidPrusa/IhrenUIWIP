//
//  File.swift
//  IhrenUI
//
//  Created by Danijel Huis on 17.02.2025..
//

import Foundation
import SwiftUI

extension View {
    public func onTapGestureWithContentShape<S: Shape>(_ shape: S = Rectangle(), action: @escaping EmptyCallback) -> some View {
        self.contentShape(shape)
            .onTapGesture(count: 1, perform: action)
    }
}
