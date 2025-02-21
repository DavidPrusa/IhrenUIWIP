//
//  File.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 30.01.2025..
//

import UIKit

public extension UIColor {

    convenience init(argb hex: Int) {
        let alpha = Double((hex & 0xff000000) >> 24) / 255.0
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    convenience init(rgb hex: Int) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

