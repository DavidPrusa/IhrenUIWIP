//
//  FormPreview.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 19.02.2025..
//

import SwiftUI

@available(iOS 17.0, *)
#Preview("No Focus Handling") {
    @Previewable @State var input = "Your input goes here..."

    VStack {
        InputField(title: "Input", query: $input)
    }
    .padding()
}

@available(iOS 17.0, *)
#Preview("Single InputField") {
    @Previewable @State var input = "Your input goes here..."

    @Previewable @State var isFieldInFocus = false

    VStack(spacing: 16) {
        InputField(title: "Input", query: $input)
            .isFocused($isFieldInFocus)

        Button("Remove Focus") {
            isFieldInFocus = false
        }
        .buttonStyle(.plain)
    }
    .padding()
}

private enum FieldInFocus {
    case firstField
    case secondField
}

@available(iOS 17.0, *)
#Preview("Multiple InputFields") {
    @Previewable @State var input1 = "Your input goes here..."
    @Previewable @State var input2 = "Your input also goes here..."

    @Previewable @State var fieldInFocus: FieldInFocus?

    VStack {
        InputField(title: "Input #1", query: $input1)
            .isFocused($fieldInFocus, value: .firstField)

        InputField(title: "Input #2", query: $input2)
            .isFocused($fieldInFocus, value: .secondField)
    }
    .padding()
}
