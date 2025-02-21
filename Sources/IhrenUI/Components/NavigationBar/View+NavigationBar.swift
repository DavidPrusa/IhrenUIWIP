//
//  File.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 29.01.2025..
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    let title: String
    let subtitle: String?
    let showsBackButton: Bool
    let backAction: EmptyCallback?
    let dismissAction: EmptyCallback?
    let titleColor: Color?
    let backgroundColor: Color?
    let useHeaderForBackground: Bool

    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            NavigationBar(title: title, subtitle: subtitle, showsBackButton: showsBackButton, backAction: backAction, dismissAction: dismissAction, titleColor: titleColor, backgroundColor: useHeaderForBackground ? .clear : backgroundColor)

            content
                .maxFrame()
        }
        .background(alignment: .topLeading) {
            if useHeaderForBackground {
                Image(.illustrationHeaderSmall)
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
            }
        }
        .apply {
            if #available(iOS 18.0, *) {
                $0.toolbarVisibility(.hidden, for: .navigationBar)
            } else if #available(iOS 16.0, *) {
                $0.toolbar(.hidden, for: .navigationBar)
            } else {
                $0.navigationBarTitleDisplayMode(.inline)
            }
        }
        .navigationBarHidden(true)
    }
}

public extension View {

    func setupNavigationBar(
        title: String,
        titleColor: Color? = nil,
        subtitle: String? = nil,
        backgroundColor: Color? = nil,
        useHeaderForBackground: Bool = false,
        showsBackButton: Bool = true,
        backAction: EmptyCallback? = nil,
        dismissAction: EmptyCallback? = nil
    ) -> some View {
        self.modifier(
            NavigationBarModifier(
                title: title,
                subtitle: subtitle,
                showsBackButton: showsBackButton,
                backAction: backAction, 
                dismissAction: dismissAction,
                titleColor: titleColor,
                backgroundColor: backgroundColor,
                useHeaderForBackground: useHeaderForBackground
            )
        )
    }
}

#Preview {
    NavigationView {
        Text("Preview")
            .setupNavigationBar(title: "Title", backAction: {
                print("Back Tapped")
            }, dismissAction: {
                print("Dismiss Tapped")
            })
    }
}

#Preview("Subtitle") {
    NavigationView {
        Text("Preview")
            .setupNavigationBar(title: "Title", subtitle: "Subtitle")
    }
}
