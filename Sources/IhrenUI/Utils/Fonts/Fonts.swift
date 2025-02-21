//
//  Fonts.swift
//  IhrenUI
//

import SwiftUI
/*
 100 – Thin.
 200 – Extra Light (Ultra Light)
 300 – Light.
 400 – Normal.
 500 – Medium.
 600 – Semi Bold (Demi Bold)
 700 – Bold.
 800 – Extra Bold (Ultra Bold)
 */

public struct Fonts: Sendable {
    
    init() {
        /*UIFont.register(
            "OpenSans-Light.ttf",
            "OpenSans-Regular.ttf" ,
            "OpenSans-SemiBold.ttf" ,
            "OpenSans-Bold.ttf",
            "OpenSans-LightItalic.ttf" ,
            "OpenSans-Italic.ttf" ,
            "OpenSans-BoldItalic.ttf",
            "OpenSans-SemiBoldItalic.ttf"
        )*/
    }
    
    // Title
    /// 22, bold
    public let t0 = FontResource(size: 22, weight: .bold, style: .title)
    /// 20, bold
    public let t1 = FontResource(size: 20, weight: .bold, style: .title)
    /// 20, regular
    public let t1Regular = FontResource(size: 20, weight: .regular, style: .title)
    /// 17, bold
    public let t2 = FontResource(size: 17, weight: .bold, style: .title2)
    /// 15, bold
    public let t3 = FontResource(size: 15, weight: .bold, style: .body)
    /// 13, bold
    public let t4 = FontResource(size: 13, weight: .bold, style: .body)
    
    // Headline
    /// 19, semibold
    public let h1 = FontResource(size: 19, weight: .semibold, style: .title2)
    /// 17, semibold
    public let h2 = FontResource(size: 17, weight: .semibold, style: .title2)
    /// 15, semibold
    public let h3 = FontResource(size: 15, weight: .semibold, style: .body)
    /// 13, semibold
    public let h4 = FontResource(size: 13, weight: .semibold, style: .body)
    /// 11, semibold
    public let h5 = FontResource(size: 11, weight: .semibold, style: .footnote)
    /// 10, semibold
    public let h6 = FontResource(size: 10, weight: .semibold, style: .footnote) // @TODO not in Figma
    
    public func h(_ size: CGFloat) -> FontResource {
        return .init(size: size, weight: .semibold, style: .footnote)
    }
    
    // Paragraph
    /// 17, regular
    public let p1 = FontResource(size: 17, weight: .regular, style: .title2)
    /// 15, regular
    public let p2 = FontResource(size: 15, weight: .regular, style: .body)
    /// 13, regular
    public let p3 = FontResource(size: 13, weight: .regular, style: .body)
    /// 11, regular
    public let p4 = FontResource(size: 11, weight: .regular, style: .body)
    
    // Links
    /// 17, bold
    public let l1 = FontResource(size: 17, weight: .bold, style: .title2)
    /// 15, bold
    public let l2 = FontResource(size: 15, weight: .bold, style: .body)
    /// 13, bold
    public let l3 = FontResource(size: 13, weight: .bold, style: .body)
    /// 10, regular
    public let l4 = FontResource(size: 10, weight: .regular, style: .footnote)  // @TODO not in Figma
    
    // Text
    /// 13, regular, italic
    public let disclaimer = FontResource(size: 13, weight: .regular, isItalic: true, style: .body)
    /// 13, regular
    public let description = FontResource(size: 13, weight: .regular, style: .body)
    /// 13, regular
    public let hint = FontResource(size: 13, weight: .regular, style: .body)
    /// 12, regular
    public let navigationDefault = FontResource(size: 12, weight: .regular, style: .body)
    /// 12, bold
    public let navigationActive = FontResource(size: 12, weight: .bold, style: .body)
    /// 9, semibold
    public let badge = FontResource(size: 9, weight: .semibold, style: .footnote)
    /// 6, bold
    public let smallBadge = FontResource(size: 6, weight: .bold, style: .footnote)  // @TODO not in Figma
    /// 8 bold
    public let mediumBadge = FontResource(size: 8, weight: .bold, style: .footnote)  // @TODO not in Figma
    /// 8 regular
    public let priceSuperscript = FontResource(size: 8, weight: .regular, style: .footnote)  // @TODO not in Figma
    
    // Price
    /// 22, bold
    public let `default` = FontResource(size: 22, weight: .bold, style: .title)
    /// 13, semibold
    public let discount = FontResource(size: 13, weight: .semibold, style: .body)
    
    /// Used but not in figma. @TODO think of better names.
    public let custom1 = FontResource(size: 12, weight: .regular, style: .body)
    public let custom2 = FontResource(size: 12, weight: .bold, style: .body)
    public let custom3 = FontResource(size: 23, weight: .bold, style: .body)
    public let custom4 = FontResource(size: 9, weight: .regular, style: .footnote)
    public let custom5 = FontResource(size: 6, weight: .regular, style: .footnote)
    public let custom6 = FontResource(size: 10, weight: .regular, style: .footnote)
    public let custom7 = FontResource(size: 8, weight: .regular, style: .footnote)
}

private extension FontResource {
    
    init(size: Double, weight: Font.Weight, isItalic: Bool = false, style: Font.TextStyle) {
        self.init(name: FontManager.primaryFontName, size: size, weight: weight, style: style)
    }
}
