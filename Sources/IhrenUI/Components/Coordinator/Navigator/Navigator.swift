//
//  Navigator.swift
//  OverTheCounterSDK
//
//  Created by Danijel Huis on 04.02.2025..
//

import Foundation
import SwiftUI

@MainActor public protocol Navigator {
    func open(_ id: String, view: any View, navigationType: NavigationType) -> Dismissable
    
    /// This is needed for components like UIActivityViewController and other legacy components that don't exist in SwiftUI. It is needed by both UIKit and SwiftUI navigators.
    func present(_ controller: UIViewController, from presentingController: UIViewController?, isAnimated: Bool) -> Dismissable

    func pop(isAnimated: Bool)
}

public enum NavigationType {
    case push(options: PushOptions)
    case present(options: PresentationOptions)
    case bottomSheet(options: BottomSheetOptions)
}

public final class PushOptions {
    let isAnimated: Bool
    
    public init(isAnimated: Bool) {
        self.isAnimated = isAnimated
    }    
}

public final class PresentationOptions {
    weak var rootViewController: UIViewController?
    let isAnimated: Bool
    let isFullScreen: Bool
    let overrideUserInterfaceStyle: UIUserInterfaceStyle?
    
    public init(rootViewController: UIViewController? = nil, isAnimated: Bool, isFullScreen: Bool, overrideUserInterfaceStyle: UIUserInterfaceStyle?) {
        self.rootViewController = rootViewController
        self.isAnimated = isAnimated
        self.isFullScreen = isFullScreen
        self.overrideUserInterfaceStyle = overrideUserInterfaceStyle
    }    
}

public final class BottomSheetOptions {
    weak var rootViewController: UIViewController?
    let isAnimated: Bool
    
    public init(rootViewController: UIViewController? = nil, isAnimated: Bool) {
        self.rootViewController = rootViewController
        self.isAnimated = isAnimated
    }    
}
