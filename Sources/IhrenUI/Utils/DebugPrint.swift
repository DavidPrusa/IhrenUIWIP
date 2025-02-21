//
//  DebugPrint.swift
//  CardLinkSDK
//
//  Created by Bruno Benčević on 29.11.2024..
//

import Foundation

func dprint(_ items: Any..., separator: String = " ", terminator: String = "\n") {
#if DEBUG
    print(items, separator: separator, terminator: terminator)
#endif
}
