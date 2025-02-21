//
//  TetriaryButton.swift
//  IhrenUI
//

import SwiftUI

public struct TetriaryButton: View {

    let title: String
    let maxWidth: CGFloat?
    let action: EmptyCallback
    
    public init(_ title: String,
         maxWidth: CGFloat? = nil,
         action: @escaping EmptyCallback) {
        self.title = title
        self.maxWidth = maxWidth
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.ia.p3.bold)
                .foregroundStyle(.ia.grey800)
                .lineLimit(1)
                .padding(.vertical, 14)
                .padding(.horizontal, .spacing.x_lg)
                .frame(maxWidth: maxWidth)
                .clipShape(shape)
                .contentShape(shape)
        }
        .buttonStyle(.plain)
    }
}

private extension TetriaryButton {
    
    var shape: some Shape {
        RoundedRectangle(cornerRadius: .radius.box)
    }
}

#Preview {
    TetriaryButton("Click me!", action: {})
}
