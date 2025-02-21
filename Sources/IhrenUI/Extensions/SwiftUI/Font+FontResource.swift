//
//  Font+FontResource.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 28.01.2025..
//

import SwiftUI

extension Font {

    public init(resource: FontResource) {
        var font = Font.custom(resource.name, size: resource.size, relativeTo: resource.style).weight(resource.weight)

        if resource.isItalic {
            font = font.italic()
        }

        self = font
    }
}
