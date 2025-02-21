//
//  FontResource.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 28.01.2025..
//

import SwiftUI

public struct FontResource: Sendable {
    public let name: String
    public let size: Double
    public let weight: Font.Weight
    public let isItalic: Bool
    /// This is used for relative sizing (dynamic font).
    public let style: Font.TextStyle

    public init(name: String, size: Double, weight: Font.Weight, isItalic: Bool = false, style: Font.TextStyle) {
        self.name = name
        self.size = size
        self.weight = weight
        self.isItalic = isItalic
        self.style = style
    }

    // For some styles (Paragraph) we don't have weight/italic defined in the style, so we can have any combination.
    public var bold: FontResource { copy(weight: .bold) }
    public var semibold: FontResource { copy(weight: .semibold) }
    public var italic: FontResource { copy(isItalic: true) }
}

private extension FontResource {

    func copy(weight newWeight: Font.Weight? = nil, isItalic newIsItalic: Bool? = nil) -> FontResource {
        .init(name: self.name,
              size: self.size,
              weight: newWeight ?? self.weight,
              isItalic: newIsItalic ?? self.isItalic,
              style: self.style)
    }
}

public extension FontResource {

    /// This is done this way just so we can use dot notation.
    static var ia: Fonts { FontManager.fonts }
}
