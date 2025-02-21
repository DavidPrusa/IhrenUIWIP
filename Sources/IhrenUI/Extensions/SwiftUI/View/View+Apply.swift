//
//  View+Apply.swift
//  IhrenUI
//

import SwiftUI

public extension View {

    func apply(@ViewBuilder _ modification: (Self) -> some View) -> some View {
        modification(self)
    }

    @ViewBuilder
    func applyIf(_ condition: @autoclosure () -> Bool, @ViewBuilder _ modification: (Self) -> some View) -> some View {
        if condition() {
            modification(self)
        } else {
            self
        }
    }

    @ViewBuilder
    func applyIf(_ condition: @autoclosure () -> Bool, @ViewBuilder _ modification: (Self) -> some View, else elseModification: (Self) -> some View) -> some View {
        if condition() {
            modification(self)
        } else {
            elseModification(self)
        }
    }

    @ViewBuilder
    func applyIfLet<T>(_ optional: T?, @ViewBuilder _ modification: (Self, T) -> some View) -> some View {
        if let optional {
            modification(self, optional)
        } else {
            self
        }
    }
}
