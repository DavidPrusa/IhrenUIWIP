//
//  UIColorPalette.swift
//  IhrenUI
//

import UIKit

@MainActor
public protocol UIColorPalette {

    // Basic colors
    var white: UIColor { get }
    var black: UIColor { get }

    // Background colors
    var screenBg: UIColor { get }
    var darkBg: UIColor { get }
    var lightBg: UIColor { get }
    var backdrop: UIColor { get }

    // Primary colors
    var primary: UIColor { get }
    var primary50: UIColor { get }
    var primary100: UIColor { get }
    var primary200: UIColor { get }
    var primary300: UIColor { get }
    var primary400: UIColor { get }
    var primary500: UIColor { get }
    var primary600: UIColor { get }
    var primary700: UIColor { get }
    var primary800: UIColor { get }
    var primary900: UIColor { get }

    // Secondary colors
    var secondary: UIColor { get }
    var secondary50: UIColor { get }
    var secondary100: UIColor { get }
    var secondary200: UIColor { get }
    var secondary300: UIColor { get }
    var secondary400: UIColor { get }
    var secondary500: UIColor { get }
    var secondary600: UIColor { get }
    var secondary700: UIColor { get }
    var secondary800: UIColor { get }
    var secondary900: UIColor { get }

    // Grey scale colors
    var grey: UIColor { get }
    var grey50: UIColor { get }
    var grey100: UIColor { get }
    var grey200: UIColor { get }
    var grey300: UIColor { get }
    var grey400: UIColor { get }
    var grey500: UIColor { get }
    var grey600: UIColor { get }
    var grey700: UIColor { get }
    var grey800: UIColor { get }
    var grey900: UIColor { get }

    // Success colors
    var success: UIColor { get }
    var success50: UIColor { get }
    var success100: UIColor { get }
    var success200: UIColor { get }
    var success300: UIColor { get }
    var success400: UIColor { get }
    var success500: UIColor { get }
    var success600: UIColor { get }
    var success700: UIColor { get }
    var success800: UIColor { get }
    var success900: UIColor { get }

    // Info colors
    var info: UIColor { get }
    var info50: UIColor { get }
    var info100: UIColor { get }
    var info200: UIColor { get }
    var info300: UIColor { get }
    var info400: UIColor { get }
    var info500: UIColor { get }
    var info600: UIColor { get }
    var info700: UIColor { get }
    var info800: UIColor { get }
    var info900: UIColor { get }

    // Warning colors
    var warning: UIColor { get }
    var warning50: UIColor { get }
    var warning100: UIColor { get }
    var warning200: UIColor { get }
    var warning300: UIColor { get }
    var warning400: UIColor { get }
    var warning500: UIColor { get }
    var warning600: UIColor { get }
    var warning700: UIColor { get }
    var warning800: UIColor { get }
    var warning900: UIColor { get }

    // Error colors
    var error: UIColor { get }
    var error50: UIColor { get }
    var error100: UIColor { get }
    var error200: UIColor { get }
    var error300: UIColor { get }
    var error400: UIColor { get }
    var error500: UIColor { get }
    var error600: UIColor { get }
    var error700: UIColor { get }
    var error800: UIColor { get }
    var error900: UIColor { get }

    // Miscellaneous
    var link: UIColor { get }
    var productCoupon: UIColor { get }
}
