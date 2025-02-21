//
//  UIColor+ColorPalette.swift
//  IhrenUI
//

import UIKit

/// Namespacing all colors because colors with same names are defined in the system.
public extension UIColor {

    @MainActor
    static var ia: ColorPalette = DefaultColorPalette()
}
