//
//  Text+NSMutableAttributedString.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 30.01.2025..
//

import SwiftUI

public extension Text {

    init(_ stringGenerator: (NSMutableAttributedString) -> NSAttributedString) {
        let string = stringGenerator(NSMutableAttributedString())
        self.init(AttributedString(string))
    }
}

#Preview {
    Text {
        $0.appending("Hello, ", attributes: [
            .foregroundColor: UIColor.red
        ])
        .appending("World!", attributes: [
            .foregroundColor: UIColor.blue
        ])
    }
}
