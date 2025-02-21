//
//  View+DropdownPickerMenuOverlay.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 06.02.2025..
//

import SwiftUI

public extension View {

    func overlayDropdownPickerMenu(_ menuData: Binding<DropdownPickerMenuData?>) -> some View {
        self.dropdownPickerMenuOverlayBinding(menuData)
            .maxFrame()
            .overlay(alignment: .topLeading) {
                DropdownPickerMenuOverlay(menuData: menuData.wrappedValue)
            }
    }
}
