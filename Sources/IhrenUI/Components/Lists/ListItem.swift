//
//  ListItem.swift
//  IhrenUI
//

import SwiftUI

public struct ListItem: View {
    private let icon: Image?
    private let title: String?
    private let subtitle: String?
    private let html: String?
    private let accessoryIcon: Image?
    
    public init(icon: Image?, title: String, subtitle: String?, accessoryIcon: Image? = nil) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.html = nil
        self.accessoryIcon = accessoryIcon
    }
    
    public init(icon: Image?, html: String, accessoryIcon: Image? = nil) {
        self.icon = icon
        self.title = nil
        self.subtitle = nil
        self.html = html
        self.accessoryIcon = accessoryIcon
    }
    
    public var body: some View {
        HStack(spacing: .spacing.x_md) {
            if let icon {
                icon
            }
            
            if let html {
                WebView(htmlString: html, font: .ia.p3, color: .ia.grey600)
            } else {
                VStack(alignment: .leading, spacing: .spacing.sm) {
                    if let title {
                        Text(title)
                            .font(.ia.h3)
                            .foregroundStyle(.ia.grey800)
                    }
                    
                    if let subtitle {
                        Text(subtitle)
                            .font(.ia.p3)
                            .foregroundStyle(.ia.grey600)
                    }                
                }
            }
            
            Spacer()
            
            if let accessoryIcon {
                accessoryIcon
                    .foregroundStyle(.ia.primary)
            }
            
        }
        .padding(.horizontal, .spacing.xx_md)
        .padding(.vertical, .spacing.md)
        .background(.ia.white)
        .radius(.radius.box)
    }
}

#Preview {
    VStack {
        ListItem(icon: nil, title: "Sofort-Lieferung", subtitle: "Innerhalb von XX Minuten6")        
    }
    .padding(20)
    .background(.gray)
}
