//
//  Color+ColorPalette.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 28.01.2025..
//

import SwiftUI

/// Namespacing all colors because colors with same names are defined in the system.
public extension Color {

    @MainActor
    static var ia: ColorPalette = DefaultColorPalette()
}
