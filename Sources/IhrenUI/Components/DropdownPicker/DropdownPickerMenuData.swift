//
//  DropdownPickerMenuData.swift
//  IhrenUI
//

import Foundation

/// DropdownPickerMenuData contains all the neccessarry data to draw an Option menu attached to a Picker.
/// The callback part could have been implemented using Bindings, but that would force us to use generics
/// for this data struct and any every picker would have to have it's own DropdownPickerMenuOverlay which bloats the call-site.
public struct DropdownPickerMenuData: Equatable {
    let id: String
    let values: [String]
    let aligment: DropdownPickerMenuAlignment
    let pickerRect: CGRect
    let onValueSelected: Callback<Int>

    public init(
        id: String,
        values: [String],
        aligment: DropdownPickerMenuAlignment = .above,
        pickerRect: CGRect,
        onValueSelected: @escaping Callback<Int>
    ) {
        self.id = id
        self.values = values
        self.aligment = aligment
        self.pickerRect = pickerRect
        self.onValueSelected = onValueSelected
    }

    public static func == (lhs: DropdownPickerMenuData, rhs: DropdownPickerMenuData) -> Bool {
        lhs.id == rhs.id
        && lhs.values == rhs.values
        && lhs.aligment == rhs.aligment
        // Optimization: 0.25 margin of error improves rendering performance as SwiftUI is not required to
        // redraw the view on a sub-pixel dimension change (most impactful when scrolling).
        && lhs.pickerRect.isEqual(to: rhs.pickerRect, withMarginError: 0.25)
    }
}

public enum DropdownPickerMenuAlignment: CaseIterable, Identifiable {
    case above
    case below

    public var id: Self { self }
}
