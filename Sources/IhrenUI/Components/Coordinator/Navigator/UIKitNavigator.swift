//
//  Navigator.swift
//  OverTheCounterSDK
//
//  Created by Danijel Huis on 03.02.2025..
//

import Foundation
import SwiftUI
import Combine


/// Navigator is the worker class for Coordinator, it handles navigation, push, pop etc.
@MainActor public final class UIKitNavigator: Navigator, ObservableObject {
    public let navigationController = UINavigationController()
    
    public init() {}
    
    /// Opens route. id is here because we will need it in the future for SwiftUI navigation.
    /// Use `navigationType` to set .push or .present.
    public func open(_ id: String, view: any View, navigationType: NavigationType) -> Dismissable {
        switch navigationType {
        case .push(let options):
            return pushSwiftUIView(view, options: options)
            
        case .present(let options):
            return presentSwiftUIView(view, options: options)
            
        case .bottomSheet(let options):
            return presentSwiftUIViewAsBottomSheet(view, options: options)
        }
    }
    
    // MARK: - Internal -
    
    /// Pushes SwiftUI view by embedding it into UIHostingController.
    private func pushSwiftUIView<V: View>(_ view: V, options: PushOptions) -> Dismissable {
        let view = view.environmentObject(self)
        let hostController = UIHostingController(rootView: view)
        navigationController.pushViewController(hostController, animated: options.isAnimated)
        return PushedController(navigationController: navigationController)
    }
    
    /// Presents SwiftUI view by embedding it into UIHostingController. It returns object that can be dismissed.
    private func presentSwiftUIView<V: View>(_ view: V, options: PresentationOptions) -> Dismissable {
        let view = view.environmentObject(self)
        let hostController = BaseHostingController(rootView: view)
        
        // If navigationController is not presented (only for initial controller) then we present navigation controller and put hostController in it.
        // Else if navigationController is already presented then we present hostController.
        let controllerToPresent: UIViewController 
        if navigationController.presentingViewController == nil {
            navigationController.viewControllers = [hostController]
            controllerToPresent = navigationController
        } else {
            controllerToPresent = hostController
        }
        
        // Set options
        if options.isFullScreen {
            controllerToPresent.modalPresentationStyle = .fullScreen
        }
        if let overrideUserInterfaceStyle = options.overrideUserInterfaceStyle {
            controllerToPresent.overrideUserInterfaceStyle = overrideUserInterfaceStyle
        }
        
        // Present
        return present(controllerToPresent, from: options.rootViewController, isAnimated: options.isAnimated)
    }
    
    /// Presents SwiftUI view in bottom sheet.
    private func presentSwiftUIViewAsBottomSheet<V: View>(_ view: V, options: BottomSheetOptions) -> Dismissable {
        let view = view
            .padding(.horizontal, .spacing.grid_xl)
            .padding(.top, .spacing.x_lg)
            .padding(.bottom, .spacing.x_lg)
            .environmentObject(self)
        let controller = BottomSheetHostingController(rootView: view)
        return present(controller, from: options.rootViewController, isAnimated: options.isAnimated)
    }
    
    public func present(_ controller: UIViewController, from presentingController: UIViewController?, isAnimated: Bool) -> Dismissable {
        let presentingController = presentingController ?? UIApplication.shared.topPresentedViewController
        presentingController?.present(controller, animated: isAnimated)
        return PresentedController(controller: controller)
    }
    
    public func pop(isAnimated: Bool) {
        navigationController.popViewController(animated: isAnimated)
    }
}

// MARK: - Support -

@MainActor final class PushedController: Dismissable {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    func dismiss(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
}

@MainActor final class PresentedController: Dismissable {
    private weak var controller: UIViewController?
    
    init(controller: UIViewController?) {
        self.controller = controller
    }
    
    func dismiss(animated: Bool) {
        controller?.presentingViewController?.dismiss(animated: animated)
    }
}
