//
//  View+PreviewOutline.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 29.01.2025..
//

import SwiftUI

public extension View {

    @ViewBuilder
    func previewOutline(color: Color = .gray) -> some View {
        #if DEBUG
        if ProcessInfo.isRunningPreviews {
            self.overlay {
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .foregroundStyle(color)
            }
        } else {
            self
        }
        #else
        self
        #endif
    }
}

#Preview {
    Text("Lorem Ipsum")
        .padding(16)
        .background(.red.opacity(0.1))
        .previewOutline()
}
