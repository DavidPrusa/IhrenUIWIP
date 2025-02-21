//
//  OnFirstAppearViewModifier.swift
//  IhrenUI
//

import SwiftUI

public struct OnFirstAppearViewModifier: ViewModifier {

    private let onFirstAppear: EmptyCallback

    @State private var didAppear = false

    init(onFirstAppear: @escaping () -> Void) {
        self.onFirstAppear = onFirstAppear
    }
    
    public func body(content: Content) -> some View {
        content.onAppear {
            guard !didAppear else { return }
            didAppear = true

            onFirstAppear()
        }
    }
}

public extension View {

    func onFirstAppear(_ onFirstAppear: @escaping EmptyCallback) -> some View {
        modifier(OnFirstAppearViewModifier(onFirstAppear: onFirstAppear))
    }
}
