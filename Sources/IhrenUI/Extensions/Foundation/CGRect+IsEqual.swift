//
//  CGRect+IsEqual.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 10.02.2025..
//

import Foundation

extension CGRect {

    func isEqual(to rect: CGRect, withMarginError margin: CGFloat = 0.0) -> Bool {
        return abs(self.minX - rect.minX) <= margin
        && abs(self.maxX - rect.maxX) <= margin
        && abs(self.minY - rect.minY) <= margin
        && abs(self.maxY - rect.maxY) <= margin
    }
}
