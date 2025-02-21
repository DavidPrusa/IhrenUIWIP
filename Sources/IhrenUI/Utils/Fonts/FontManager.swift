//
//  FontManager.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 28.01.2025..
//

import Foundation

final class FontManager {
    static let primaryFontName = "Open Sans"

    nonisolated(unsafe)     // @TODO
    private static var _fonts = Fonts()
    static var fonts: Fonts { _fonts }

    @MainActor
    static func reloadFonts() {
        _fonts = Fonts()
    }
}
