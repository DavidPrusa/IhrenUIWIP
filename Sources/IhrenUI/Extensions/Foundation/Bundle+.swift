//
//  Bundle+.swift
//  IhrenUI
//

import Foundation

public extension Bundle {

    /// Loads a decodable file from the bundle. Performs fatalError in case the file with the given name does not exist or is incorrectly formatted
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        guard let loaded = try? JSONDecoder.default.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}

private class ClassForInitializingBundle {}
