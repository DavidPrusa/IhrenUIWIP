//
//  BottomSheetHostingController.swift
//  OverTheCounterSDK
//
//  Created by Danijel Huis on 11.02.2025..
//

import Foundation
import UIKit
import SwiftUI

/// UIHostingController that presents itself as .pageSheet (UISheetPresentationController).
/// - It uses presentation detents.
/// - It resizes itself with content (resizing works only on iOS 16+). Below that it uses [.medium(), .large()] detents.
/// - Resizing is animated.
/// - Works nicely if rootView has ScrollView.
/// - It works nicely on iPad. On iPhone landscape it is presented as fullscreen and it doesn't dismiss automatically, we would need to add button or something.
/// - I had to use AnyView because rootView.getSize returns generic view. We could do getSize outside and use generics if this causes problems.
/// - See this for more options: https://developer.apple.com/documentation/uikit/uisheetpresentationcontroller
public final class BottomSheetHostingController<T: View>: UIHostingController<AnyView> {
    private var rootViewHeight: CGFloat = 0
    private var maximumDetentValue: CGFloat?
    
    public init(rootView: T) {
        // Doing this because we need self in rootView.getSize and we cannot access self before init.
        super.init(rootView: AnyView(EmptyView()))
        
        // Listen to rootView's change in size and update detents.
        self.rootView = AnyView(            
            rootView.readSize { [weak self] newSize in
                guard #available(iOS 16.0, *), let self, let sheet = sheetPresentationController else { return }
                
                sheet.animateChanges {
                    self.rootViewHeight = newSize.height
                    sheet.invalidateDetents()
                }
            }
        )
        
        // Setup presentation
        self.modalPresentationStyle = .pageSheet
        guard let sheet = sheetPresentationController else { return }
        sheet.prefersGrabberVisible = true  // Always show grabber
        
        // Detents
        guard #available(iOS 16.0, *) else {
            sheet.detents = [.medium(), .large()]
            return
        }
        let customDetent = UISheetPresentationController.Detent.custom(resolver: { context in
            guard self.maximumDetentValue != context.maximumDetentValue else { return self.rootViewHeight }
            self.maximumDetentValue = context.maximumDetentValue
            
            // rootView must have intrinsic height so we can measure it, problem is that height is not intrinsic when rootView is inside ScrollView.
            // We solve this by setting .fixedSize and .maxHeight. Because of .fixedSize ScrollView will always shrink to fit but we cannot
            // allow it to grow larger than max available space (maximumDetentValue) so we use .maxHeight.
            self.rootView = AnyView(
                self.rootView
                    .frame(maxHeight: context.maximumDetentValue)
                    .fixedSize(horizontal: false, vertical: true)
            )
            
            return self.rootViewHeight
        })
        sheet.detents = [customDetent]
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
