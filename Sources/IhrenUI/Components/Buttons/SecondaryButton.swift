//
//  SecondaryButton.swift
//  IhrenUI
//

import SwiftUI

public struct SecondaryButton: View {

    public enum Size {
        case `default`
        case small
    }
    
    let title: String
    let icon: Image?
    let size: Size
    let maxWidth: CGFloat?
    let action: EmptyCallback
    
    public init(
        _ title: String,
        icon: Image? = nil,
        size: Size = .default,
        maxWidth: CGFloat? = nil,
        action: @escaping EmptyCallback
    ) {
        self.title = title
        self.icon = icon
        self.size = size
        self.maxWidth = maxWidth
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: .spacing.x_sm) {
                if let icon {
                    icon
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.ia.primary)
                        .frame(size: .spacing.lg)
                }

                Text(title)
                    .font(.ia.p3.bold)
                    .foregroundStyle(.ia.primary)
                    .lineLimit(1)
                    .padding(.vertical, verticalPadding)
            }
            .padding(.horizontal, .spacing.xx_md)
            .frame(maxWidth: buttonWidth)
        }
        .buttonStyle(.plain)
        .background(.ia.primary50)
        .clipShape(shape)
        .contentShape(shape)
    }
}

private extension SecondaryButton {
    
    var verticalPadding: CGFloat {
        size == .default ? 14 : .spacing.md
    }
    
    var buttonWidth: CGFloat? {
        maxWidth ?? (size == .default ? .infinity : nil)
    }
    
    var shape: some Shape {
        RoundedRectangle(cornerRadius: .radius.box)
    }
}

#Preview("Default") {
    VStack {
        SecondaryButton("Click me!", icon: .init(.iconLocator), action: {})

        SecondaryButton("Click me!", action: {})
    }
        .padding()
}

#Preview("Small") {
    VStack {
        SecondaryButton("Click me!", icon: .init(.iconLocator), size: .small, action: {})

        SecondaryButton("Click me!", size: .small, action: {})
    }
        .padding()
}
