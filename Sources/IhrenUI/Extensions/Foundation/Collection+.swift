//
//  Collection+.swift
//  IhrenUI
//

import Foundation

public extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript(safe index: Index) -> Element? {
        return self.indices.contains(index) ? self[index] : nil
    }
    
    /// Returns nil if collection is empty.
    var nilIfEmpty: Self? {
        isEmpty ? nil : self
    }
    
    /// Returns true if collection has elements.
    var hasElements: Bool {
        return !isEmpty
    }
}

public extension Array where Element: Equatable {
    /// Removes all matching objects and returns new array.
    func removing(equatable: Element) -> Self {
        filter({ $0 != equatable })
    }
    /// Removes all matching objects by mutating array in place.
    mutating func remove(equatable: Element) {
        self = removing(equatable: equatable)
    }
}
