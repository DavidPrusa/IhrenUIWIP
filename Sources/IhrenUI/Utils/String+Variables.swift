//
//  String+Variables.swift
//  IhrenUI
//
//  Created by Danijel Huis on 13.02.2025..
//

import Foundation

extension String {
    /// Replaces variables in format {{$variable$}}.
    public func replacingVariables(_ variables: [String: String]) -> String {
        var string = self
        for (key, value) in variables {
            string = string.replacingOccurrences(of: "{{\(key)}}", with: value, options: .caseInsensitive)
            
        }
        return string
    }
}
