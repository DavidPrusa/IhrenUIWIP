//
//  Dismissable.swift
//  OverTheCounterSDK
//
//  Created by Danijel Huis on 04.02.2025..
//

import Foundation
import UIKit

@MainActor public protocol Dismissable {
    func dismiss(animated: Bool)
}


