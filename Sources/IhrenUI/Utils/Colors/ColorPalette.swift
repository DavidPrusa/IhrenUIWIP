//
//  ColorPalette.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 28.01.2025..
//

import SwiftUI

@MainActor
public protocol ColorPalette {

    // Basic colors
    var white: Color { get }
    var black: Color { get }

    // Background colors
    var screenBg: Color { get }
    var darkBg: Color { get }
    var lightBg: Color { get }
    var backdrop: Color { get }

    // Primary colors
    var primary: Color { get }
    var primary50: Color { get }
    var primary100: Color { get }
    var primary200: Color { get }
    var primary300: Color { get }
    var primary400: Color { get }
    var primary500: Color { get }
    var primary600: Color { get }
    var primary700: Color { get }
    var primary800: Color { get }
    var primary900: Color { get }

    // Secondary colors
    var secondary: Color { get }
    var secondary50: Color { get }
    var secondary100: Color { get }
    var secondary200: Color { get }
    var secondary300: Color { get }
    var secondary400: Color { get }
    var secondary500: Color { get }
    var secondary600: Color { get }
    var secondary700: Color { get }
    var secondary800: Color { get }
    var secondary900: Color { get }

    // Grey scale colors
    var grey: Color { get }
    var grey50: Color { get }
    var grey100: Color { get }
    var grey200: Color { get }
    var grey300: Color { get }
    var grey400: Color { get }
    var grey500: Color { get }
    var grey600: Color { get }
    var grey700: Color { get }
    var grey800: Color { get }
    var grey900: Color { get }

    // Success colors
    var success: Color { get }
    var success50: Color { get }
    var success100: Color { get }
    var success200: Color { get }
    var success300: Color { get }
    var success400: Color { get }
    var success500: Color { get }
    var success600: Color { get }
    var success700: Color { get }
    var success800: Color { get }
    var success900: Color { get }

    // Info colors
    var info: Color { get }
    var info50: Color { get }
    var info100: Color { get }
    var info200: Color { get }
    var info300: Color { get }
    var info400: Color { get }
    var info500: Color { get }
    var info600: Color { get }
    var info700: Color { get }
    var info800: Color { get }
    var info900: Color { get }

    // Warning colors
    var warning: Color { get }
    var warning50: Color { get }
    var warning100: Color { get }
    var warning200: Color { get }
    var warning300: Color { get }
    var warning400: Color { get }
    var warning500: Color { get }
    var warning600: Color { get }
    var warning700: Color { get }
    var warning800: Color { get }
    var warning900: Color { get }

    // Error colors
    var error: Color { get }
    var error50: Color { get }
    var error100: Color { get }
    var error200: Color { get }
    var error300: Color { get }
    var error400: Color { get }
    var error500: Color { get }
    var error600: Color { get }
    var error700: Color { get }
    var error800: Color { get }
    var error900: Color { get }

    // Miscellaneous
    var link: Color { get }
    var productCoupon: Color { get }
    var headline1: Color { get }
}
