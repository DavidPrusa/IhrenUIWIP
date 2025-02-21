//
//  UIKit+Navigation.swift
//  OverTheCounterSDK
//
//  Created by Danijel Huis on 03.02.2025..
//

import Foundation
import UIKit
import SwiftUI

// MARK: - topPresentedViewController -

extension UIApplication {
    /// Returns topmost presented view controller in application.
    public var topPresentedViewController: UIViewController? {
        return UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .filter { $0.activationState == .foregroundActive }
            .first?
            .keyWindow?
            .rootViewController?
            .topPresentedViewController
    }
}

extension UIViewController {
    /// Returns topmost presented view controller on `self`.
    public var topPresentedViewController: UIViewController {
        var topController: UIViewController = self
        while let presenter = topController.presentedViewController {
            topController = presenter
        }
        return topController
    }
}
