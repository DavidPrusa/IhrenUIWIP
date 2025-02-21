//
//  IconButton.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 30.01.2025..
//

import SwiftUI

public struct IconButton: View {
    let icon: Image
    let iconColor: Color
    let backgroundColor: Color
    let action: EmptyCallback

    public var body: some View {
        Button {
            action()
        } label: {
            icon
                .resizable()
                .foregroundStyle(iconColor)
                .scaledToFit()
                .frame(size: 16)
                .padding(.spacing.xxx_sm)
        }
        .buttonStyle(.plain)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: .spacing.x_sm))
    }
}

public extension IconButton {
    static func primary(_ icon: Image, action: @escaping EmptyCallback) -> Self {
        .init(icon: icon, iconColor: .ia.white, backgroundColor: .ia.primary, action: action)
    }
    
    static func secondary(_ icon: Image, action: @escaping EmptyCallback) -> Self {
        .init(icon: icon, iconColor: .ia.primary, backgroundColor: .ia.primary50, action: action)
    }
}

#Preview {
    VStack {
        IconButton.primary(Image(.iconLocator), action: {})
        IconButton.secondary(Image(.iconLocator), action: {})
    }
}

