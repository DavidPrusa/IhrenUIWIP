//
//  NavigationBar.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 12.02.2025..
//

import SwiftUI

struct NavigationBar: View {

    let title: String?
    let subtitle: String?
    let showsBackButton: Bool
    let backAction: EmptyCallback?
    let dismissAction: EmptyCallback?
    let titleColor: Color
    let backgroundColor: Color

    @EnvironmentObject var navigator: UIKitNavigator

    init(
        title: String? = nil,
        subtitle: String? = nil,
        showsBackButton: Bool,
        backAction: EmptyCallback? = nil,
        dismissAction: EmptyCallback? = nil,
        titleColor: Color? = nil,
        backgroundColor: Color? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.showsBackButton = showsBackButton
        self.backAction = backAction
        self.dismissAction = dismissAction
        self.titleColor = titleColor ?? .ia.white
        self.backgroundColor = backgroundColor ?? .ia.primary
    }

    var body: some View {
        HStack {
            if showsBackButton {
                Button {
                    navigator.pop(isAnimated: true)
                    backAction?()
                } label: {
                    Image(.iconBack)
                        .resizable()
                        .scaledToFit()
                        .frame(size: .spacing.xx_md)
                        .padding(.vertical, .spacing.x_md)
                        .padding(.leading, .spacing.xx_md)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .previewOutline()
            } else {
                Spacer()
                    .frame(maxWidth: 2 * .spacing.xx_md)
            }

            VStack(spacing: 0) {
                if let title {
                    Text(title)
                        .font(.ia.t2)
                        .multilineTextAlignment(.center)
                }

                if let subtitle {
                    Text(subtitle)
                        .font(.ia.navigationDefault)
                        .lineLimit(1)
                }
            }
            .frame(maxWidth: .infinity)

            if let dismissAction {
                Button {
                    dismissAction()
                } label: {
                    Image(.iconX)
                        .resizable()
                        .scaledToFit()
                        .frame(size: .spacing.xx_md)
                        .padding(.vertical, .spacing.x_md)
                        .padding(.trailing, .spacing.xx_md)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .previewOutline()
            } else {
                Spacer()
                    .frame(maxWidth: 2 * .spacing.xx_md)
            }
        }
        .padding(.bottom, 12)
        .foregroundStyle(titleColor)
        .background(backgroundColor)
        .previewOutline()
    }
}

#Preview {
    VStack {
        NavigationBar(
            title: "Hello, Previews!", 
            showsBackButton: false
        )

        NavigationBar(
            title: "Hello, Previews!",
            subtitle: "XCode crashes like crazy",
            showsBackButton: false
        )

        NavigationBar(
            title: "Hello, Previews!",
            showsBackButton: true,
            backAction: {
            print("Back Tapped!")
        })

        NavigationBar(
            title: "Hello, Previews!",
            showsBackButton: true,
            dismissAction: {
            print("Dismiss Tapped!")
        })
    }
}
