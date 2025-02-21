//
//  InputField+Environment.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 20.02.2025..
//

import SwiftUI

public extension EnvironmentValues {

    @Entry var inputFieldStyle: InputFieldStyle = .clear
}

extension View {

    func inputFieldStyle(_ style: InputFieldStyle) -> some View {
        self.environment(\.inputFieldStyle, style)
    }
}
