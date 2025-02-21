//
//  DropdownPickerExample.swift
//  IhrenUI
//

import SwiftUI

@available(iOS 17.0, *)
#Preview("Single DropdownPicker") {
    @Previewable @State var selectedOption: String?
    @Previewable @State var menuData: DropdownPickerMenuData?
    
    ScrollView {
        VStack {
            PlaceholderContent()
            
            PlaceholderContent()
            
            DropdownPicker(
                title: "Choose an Option",
                currentValue: $selectedOption,
                allowedValues: ["Option #1", "Option #2", "Option #3", "Option #4"],
                id: "example"
            )
            
            PlaceholderContent()
        }
        .padding()
    }
    .maxFrame()
    .overlayDropdownPickerMenu($menuData)
}

@available(iOS 17.0, *)
#Preview("Horizontal DropdownPickers") {
    @Previewable @State var selectedOption: String?
    @Previewable @State var selected2ndOption: String?
    @Previewable @State var menuData: DropdownPickerMenuData?
    
    ScrollView {
        VStack {
            PlaceholderContent()
            
            PlaceholderContent()
            
            HStack {
                DropdownPicker(
                    title: "Choose an Option",
                    currentValue: $selectedOption,
                    allowedValues: ["Option #1", "Option #2", "Option #3", "Option #4"],
                    id: "example1"
                )
                
                DropdownPicker(
                    title: "Choose a 2nd Option",
                    currentValue: $selected2ndOption,
                    allowedValues: ["Option #1", "Option #2", "Option #3", "Option #4"],
                    id: "example2"
                )
            }
            
            PlaceholderContent()
        }
        .padding()
    }
    .overlayDropdownPickerMenu($menuData)
}

@available(iOS 17.0, *)
#Preview("Vertical DropdownPickers") {
    @Previewable @State var selectedOption: String?
    @Previewable @State var selected2ndOption: String?
    @Previewable @State var menuData: DropdownPickerMenuData?
    
    ScrollView {
        VStack {
            PlaceholderContent()
            
            PlaceholderContent()
            
            VStack(spacing: 16) {
                DropdownPicker(
                    title: "Choose an Option",
                    currentValue: $selectedOption,
                    allowedValues: ["Option #1", "Option #2", "Option #3", "Option #4"],
                    id: "example1"
                )
                
                DropdownPicker(
                    title: "Choose a 2nd Option",
                    currentValue: $selected2ndOption,
                    allowedValues: ["Option #1", "Option #2", "Option #3", "Option #4"],
                    id: "example2"
                )
            }
            
            PlaceholderContent()
        }
        .padding()
    }
    .overlayDropdownPickerMenu($menuData)
}

private struct PlaceholderContent: View {
    
    var body: some View {
        Text("Placeholder")
            .font(.largeTitle.bold())
            .rotationEffect(.degrees(-12.25))
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 80)
            .background(.tertiary)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
