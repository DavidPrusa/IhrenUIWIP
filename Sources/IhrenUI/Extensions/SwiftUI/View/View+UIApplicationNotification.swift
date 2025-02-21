//
//  View+UIApplicationNotification.swift
//  IhrenUI
//

import SwiftUI

public extension View {

    func onAppWillResignActive(_ action: @escaping @MainActor () -> Void) -> some View {
        self.onReceive(
            NotificationCenter.default
                .publisher(for: UIApplication.willResignActiveNotification)
                .receive(on: RunLoop.main)) { _ in
            action()
        }
    }

    func onAppWillEnterForeground(_ action: @escaping @MainActor () -> Void) -> some View {
        self.onReceive(
            NotificationCenter.default
                .publisher(for: UIApplication.willEnterForegroundNotification)
                .receive(on: RunLoop.main)) { _ in
            action()
        }
    }
}
