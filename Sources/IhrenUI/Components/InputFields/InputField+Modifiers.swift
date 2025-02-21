//
//  InputField+Modifiers.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 10.02.2025..
//

import SwiftUI

public extension InputField {

    func isFocused(_ isFocused: Binding<Bool>) -> InputField {
        var copy = self
        copy.isFocusedExternally = isFocused
        return copy
    }

    func isFocused<T>(_ isFocused: Binding<T?>, value: T) -> InputField where T: Equatable {
        var copy = self
        copy.isFocusedExternally = .init(
            get: {
                isFocused.wrappedValue == value
            },
            set: { focused in
                isFocused.wrappedValue = focused ? value : nil
            }
        )
        return copy
    }

    func onSubmit(_ onSubmit: EmptyCallback?) -> InputField {
        var copy = self
        copy.onSubmit = onSubmit
        return copy
    }

    func submitLabel(_ label: SubmitLabel?) -> InputField {
        var copy = self
        copy.submitLabel = label
        return copy
    }

    func hint(_ hint: String?) -> InputField {
        var copy = self
        copy.hint = hint
        return copy
    }

    func errorMessage(_ message: String?) -> InputField {
        var copy = self
        copy.errorMessage = message
        return copy
    }

    func leadingIcon(_ icon: Image?) -> InputField {
        var copy = self
        copy.leadingIcon = icon
        return copy
    }

    func trailingIcon(_ icon: Image?) -> InputField {
        var copy = self
        copy.trailingIcon = icon
        return copy
    }
}
