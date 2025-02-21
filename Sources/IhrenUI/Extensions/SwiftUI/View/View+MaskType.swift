//
//  View+MaskType.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 03.02.2025..
//

import SwiftUI

public enum MaskType {
    case bottomSheet(cornerRadius: CGFloat)
}

public extension View {

    func mask(_ type: MaskType) -> some View {
        self.mask {
            switch type {
            case .bottomSheet(let cornerRadius):
                ZStack {
                    RoundedRectangle(cornerRadius: cornerRadius)

                    Rectangle()
                        .padding(.top, cornerRadius)
                }
            }
        }
    }
}
