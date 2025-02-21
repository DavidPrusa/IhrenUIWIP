//
//  WebView.swift
//  OverTheCounterSDK
//
//  Created by Danijel Huis on 05.02.2025..
//

import SwiftUI
import WebKit

/// Autoresizing web view component meant to be used inline with other content.
/// Note regarding font, it will use exact size but font weight can be only regular or bold.
public struct WebView: View {
    public let htmlString: String
    public let font: FontResource
    public let color: Color
    @State private var height: CGFloat = 0
    
    public init(htmlString: String, font: FontResource, color: Color) {
        self.htmlString = htmlString
        self.font = font
        self.color = color
    }
    
    public var body: some View {
        WebViewInternal(htmlString: htmlString, font: font, color: color, height: $height)
            .frame(height: height)
            .padding(-7)
    }
}

private struct WebViewInternal: UIViewRepresentable {
    let htmlString: String
    let font: FontResource
    let color: Color
    @Binding var height: CGFloat

    struct Constants {
        static let fontFamily = "OpenSans-Regular"
        static let fontFile = "OpenSans-Regular.ttf"
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.bounces = false
        webView.navigationDelegate = context.coordinator
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear
        loadHTML(webView: webView)
        return webView
    }  
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {}
    
    private func loadHTML(webView: WKWebView) {
        let html = htmlTemplate.replacingVariables(
            [
                "FONT_FAMILY": Constants.fontFamily,
                "FONT_FILE": Constants.fontFile,
                "FONT_SIZE": String(Int(font.size)),
                "FONT_WEIGHT": font.weight == .bold ? "bold" : "normal",
                "TEXT_COLOR": color.hexRGB,
                "BODY": htmlString
            ]
        )
        
        // BaseURL is needed for WKWebView to find fonts (FONT_FILE).
        webView.loadHTMLString(html, baseURL: Bundle.module.bundleURL)
    }
}  

private extension WebViewInternal {
    final class Coordinator: NSObject, WKNavigationDelegate {
        private let parent: WebViewInternal
        
        init(_ parent: WebViewInternal) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.documentElement.scrollHeight", completionHandler: { (height, error) in
                guard let height = height as? CGFloat else { return }
                DispatchQueue.main.async {
                    self.parent.height = height
                }
            })
        }
    }
}

private let htmlTemplate = 
"""
<!doctype html>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
    <head>
        <style>
            @font-face {
                font-family: '{{FONT_FAMILY}}';
                src: url("{{FONT_FILE}}") format('truetype');
            }

            body {
                font-size: {{FONT_SIZE}}px;                
                font-family: "{{FONT_FAMILY}}";
                color: {{TEXT_COLOR}};
                font-weight: {{FONT_WEIGHT}};
                line-height: 1.4;   # To match SwiftUI Text line height
            }
        </style>
    </head>
    <body>
        {{BODY}}
    </body>
</html>
"""
