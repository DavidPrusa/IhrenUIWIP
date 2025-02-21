//
//  UppercasedButton.swift
//  IhrenUI
//

import SwiftUI

public struct UppercasedButton: View {

    public enum Size {
        case `default`
        case small
    }

    let title: String
    let size: Size
    let action: EmptyCallback

    public init(_ title: String,
         size: Size = .default,
         action: @escaping EmptyCallback) {
        self.title = title.uppercased()
        self.size = size
        self.action = action
    }

    public var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(font.bold)
                .foregroundStyle(.ia.secondary500)
                .lineLimit(1)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

private extension UppercasedButton {

    var font: FontResource {
        size == .default ? .ia.p2 : .ia.p3
    }
}

#Preview("Default") {
    UppercasedButton("Click me!", action: {})
        .padding()
}

#Preview("Small") {
    UppercasedButton("Click me!", size: .small, action: {})
        .padding()
}
