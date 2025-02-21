//
//  DropdownPicker+Environment.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 14.02.2025..
//

import SwiftUI

public extension EnvironmentValues {

    @Entry var dropdownPickerBackground: DropdownPickerBackground = .default

    @Entry var dropdownPickerStyle: DropdownPickerStyle = .default

    @Entry var dropdownPickerMenuAlignment: DropdownPickerMenuAlignment = .below

    @Entry var dropdownPickerMenu: Binding<DropdownPickerMenuData?> = .init(
        get: {
            dprint("Trying to access dropdownPickerMenuData without binding a DropdownPicker to an overlay.")
            return nil
        },
        set: { data in
            guard let id = data?.id else { return }
            dprint("Trying to show DropdownPickerMenu for \(id), but the overlay binding was never set")
        })
}

public extension View {

    func dropdownPickerBackground(_ background: DropdownPickerBackground) -> some View {
        self.environment(\.dropdownPickerBackground, background)
    }

    func dropdownPickerStyle(_ style: DropdownPickerStyle) -> some View {
        self.environment(\.dropdownPickerStyle, style)
    }

    func dropdownPickerMenuAlignemnt(_ alignment: DropdownPickerMenuAlignment) -> some View {
        self.environment(\.dropdownPickerMenuAlignment, alignment)
    }

    func dropdownPickerMenuOverlayBinding(_ binding: Binding<DropdownPickerMenuData?>) -> some View {
        self.environment(\.dropdownPickerMenu, binding)
    }
}
