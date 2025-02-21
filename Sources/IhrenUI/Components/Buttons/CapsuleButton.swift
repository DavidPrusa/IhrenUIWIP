//
//  CapsuleButton.swift
//  OverTheCounterSDK
//
//  Created by Bruno Benčević on 05.02.2025..
//

import SwiftUI

public struct CapsuleButton: View {

    public enum Appearance {
        case dark
        case light
    }

    let title: String
    let appearance: Appearance
    let action: EmptyCallback

    init(
        _ title: String,
        appearance: Appearance,
        _ action: @escaping EmptyCallback
    ) {
        self.title = title
        self.appearance = appearance
        self.action = action
    }

    public var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.ia.h4)
                .foregroundStyle(appearance == .dark ? .ia.white : .ia.primary500)
                .padding(.vertical, .spacing.md)
                .padding(.horizontal, 20)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .background(appearance == .dark ? .ia.primary500 : .ia.white)
        .clipShape(Capsule())
    }
}

public extension CapsuleButton {

    static func dark(_ title: String, _ action: @escaping EmptyCallback) -> CapsuleButton {
        CapsuleButton(title, appearance: .dark, action)
    }

    static func light(_ title: String, _ action: @escaping EmptyCallback) -> CapsuleButton {
        CapsuleButton(title, appearance: .light, action)
    }
}

#Preview {
    HStack {
        VStack(alignment: .trailing, spacing: 64) {
            CapsuleButton("Button", appearance: .dark) {
                print("Dark Button Tapped")
            }
            .shadow(.floatingButton)

            CapsuleButton("Button", appearance: .light) {
                print("Light Button Tapped")
            }
            .shadow(.floatingButton)
        }
    }
}
