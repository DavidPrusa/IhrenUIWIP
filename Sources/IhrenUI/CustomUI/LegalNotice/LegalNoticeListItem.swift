//
//  LegalNoticeListItem.swift
//  IhrenUI
//
//  Created by Danijel Huis on 13.02.2025..
//

import SwiftUI

// @TODO this is just placeholder, to be implemented later.
public struct LegalNoticeListItem: View {
    public init() {}
    
    public var body: some View {
        ListItem(icon: nil, 
                 title: "Rechtliche Hinweise", 
                 subtitle: "Informationen zu Preise und Verfügbarkeit & Auflösung der Fußnoten.",
                 accessoryIcon: .init(.iconChevronRight))
    }
}

#Preview {
    VStack {        
        LegalNoticeListItem()
    }
    .padding(20)
    .background(.gray)
}

