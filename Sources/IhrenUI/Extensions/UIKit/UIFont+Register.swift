//
//  UIFont+Register.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 28.01.2025..
//

import UIKit

public extension UIFont {

    static func register(_ filenameString: String) {
        register(filenameString, bundle: .module)
    }

    static func register(_ filenameStrings: String...) {
        filenameStrings.forEach {
            register($0, bundle: .module)
        }
    }

    static func register(_ filenameString: String, bundle: Bundle) {
        guard let pathForResourceString = bundle.path(forResource: filenameString, ofType: nil) else {
            print("UIFont:  Failed to register font - path for resource not found.")
            return
        }

        guard let fontData = NSData(contentsOfFile: pathForResourceString) else {
            print("UIFont:  Failed to register font - font data could not be loaded.")
            return
        }

        guard let dataProvider = CGDataProvider(data: fontData) else {
            print("UIFont:  Failed to register font - data provider could not be loaded.")
            return
        }

        guard let font = CGFont(dataProvider) else {
            print("UIFont:  Failed to register font - font could not be loaded.")
            return
        }

        var errorRef: Unmanaged<CFError>? = nil
        if (CTFontManagerRegisterGraphicsFont(font, &errorRef) == false) {
            print("UIFont:  Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
        }
    }
}
