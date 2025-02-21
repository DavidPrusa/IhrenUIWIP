//
//  DropdownPicker+Modifiers.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 06.02.2025..
//

import SwiftUI

public extension DropdownPicker {

    func hint(_ hint: String?) -> DropdownPicker {
        var copy = self
        copy.hint = hint
        return copy
    }

    func errorMessage(_ message: String?) -> DropdownPicker {
        var copy = self
        copy.errorMessage = message
        return copy
    }
    
    func onValueSelected(_ onValueSelected: Callback<Value>?) -> DropdownPicker {
        var copy = self
        copy.onValueSelected = onValueSelected
        return copy
    }
}
