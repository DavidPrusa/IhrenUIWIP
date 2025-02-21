//
//  View+FontResource.swift
//  IhrenUI
//

import SwiftUI

public extension View {

    func font(_ resource: FontResource) -> some View {
        self.font(Font(resource: resource))
    }
}
