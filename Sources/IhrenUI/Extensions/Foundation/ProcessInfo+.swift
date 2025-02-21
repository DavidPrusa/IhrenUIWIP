//
//  File.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 28.01.2025..
//

import Foundation

public extension ProcessInfo {

    static var isRunningPreviews: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}
