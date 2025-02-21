//
//  NSMutableAttributedString+.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 30.01.2025..
//

import Foundation

public extension NSMutableAttributedString {

    func appending(_ string: String, attributes: [NSAttributedString.Key: Any]) -> NSMutableAttributedString {
        self.append(NSMutableAttributedString(string: string, attributes: attributes))

        return self
    }
}
