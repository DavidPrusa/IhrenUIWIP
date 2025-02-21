//
//  Binding+.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 29.01.2025..
//

import SwiftUI

public extension Binding where Value == Bool {

    static prefix func !(_ binding: Binding<Bool>) -> Binding<Bool> {
        return .init(get: {
            return !binding.wrappedValue
        }, set: { newValue in
            binding.wrappedValue = !newValue
        })
    }
}
