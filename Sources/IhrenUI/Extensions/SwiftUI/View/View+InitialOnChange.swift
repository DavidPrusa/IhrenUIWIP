//
//  View+InitialOnChange.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 18.09.2024..
//

import SwiftUI

public extension View {
    
    func onChange<V>(of value: V, initial: Bool = false, _ action: @escaping Callback<Bool>) -> some View where V : Equatable {
        self.onChange(of: value) { _ in
            action(false)
        }
        .onFirstAppear {
            guard initial else { return }
            action(true)
        }
    }
}
