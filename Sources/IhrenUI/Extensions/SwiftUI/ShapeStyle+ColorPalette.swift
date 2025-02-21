//
//  File.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 28.01.2025..
//

import SwiftUI

/// This is needed so we can write .foregroundStyle(.ia.primary).
public extension ShapeStyle where Self == Color {

    @MainActor
    static var ia: ColorPalette { Color.ia }
}
