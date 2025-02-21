//
//  PrimaryButton.swift
//  IhrenUI
//

import SwiftUI

public struct PrimaryButton: View {

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
                .foregroundStyle(.ia.white)
                .lineLimit(1)
                .padding(.vertical, 14)
                .padding(.horizontal, .spacing.xx_md)
                .frame(maxWidth: maxWidth)
                .background(.ia.primary)
                .clipShape(shape)
                .contentShape(shape)
        }
        .buttonStyle(.plain)
    }
}

private extension PrimaryButton {
    
    var shape: some Shape {
        RoundedRectangle(cornerRadius: .radius.box)
    }
}

#Preview {
    VStack(spacing: 64) {
        PrimaryButton("Click me!", action: {})
            
        PrimaryButton("Click me!", maxWidth: .infinity, action: {})
        
        PrimaryButton("Click me!", maxWidth: 220, action: {})
    }
    .padding()
}
