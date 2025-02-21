//
//  DropdownPickerMenuOverlay.swift
//  IhrenUI
//

import SwiftUI

public struct DropdownPickerMenuOverlay: View{
    
    private let menuData: DropdownPickerMenuData?

    @State private var overlayRect: CGRect = .zero
    
    public init(menuData: DropdownPickerMenuData?) {
        self.menuData = menuData
    }
    
    public var body: some View {
        ZStack(alignment: .topLeading) {
            if let menuData {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(menuData.values.indices, id: \.self) { index in
                        optionRow(menuData.values[index]) {
                            menuData.onValueSelected(index)
                        }
                    }
                }
                .multilineTextAlignment(.leading)
                .padding(.vertical, .spacing.x_sm)
                .background(.ia.white)
                .contentShape(shape)
                .clipShape(shape)
                .overlay {
                    shape
                        .stroke(.ia.grey200, lineWidth: 1)
                }
                .frame(maxWidth: menuData.pickerRect.width)
                .previewOutline()
                .readRect(into: $overlayRect)
                .position(getDropdownPosition(for: menuData))
            }
        }
        .maxFrame(alignment: .topLeading)
        .ignoresSafeArea(.all)
    }
}

private extension DropdownPickerMenuOverlay {
    
    func getDropdownPosition(for overlayData: DropdownPickerMenuData) -> CGPoint {
        let xPos = overlayData.pickerRect.minX + overlayRect.width / 2
        
        let position: CGPoint = switch overlayData.aligment {
        case .above: .init(
            x: xPos,
            y: overlayData.pickerRect.minY - (overlayRect.height + 1) + overlayRect.height / 2
        )
        case .below: .init(
            x: xPos,
            y: overlayData.pickerRect.maxY + 1 + overlayRect.height / 2
        )
        }
        
        return position
    }
    
    var shape: some Shape {
        RoundedRectangle(cornerRadius: .radius.box)
    }
    
    func optionRow(_ title: String, onTapped: @escaping EmptyCallback) -> some View {
        Text(title)
            .font(.ia.p2)
            .foregroundStyle(.ia.grey800)
            .padding(.vertical, .spacing.x_md)
            .padding(.horizontal, .spacing.xx_md)
            .frame(maxWidth: .infinity, alignment: .leading)
            .onTapGestureWithContentShape {
                onTapped()
            }
            .previewOutline()
    }
}

#Preview {
    DropdownPickerMenuOverlay(
        menuData: .init(
            id: .init(),
            values: [
                "Option #1",
                "Option #2",
                "Option #3"
            ],
            pickerRect: .init(
                x: 150,
                y: 400,
                width: 200,
                height: 60
            ),
            onValueSelected: {
                print(
                    "Selected option #\($0 + 1)"
                )
            })
    )
    .maxFrame(alignment: .topLeading)
    .ignoresSafeArea(.all)
}

#Preview("Bottom Alignment") {
    DropdownPickerMenuOverlay(
        menuData: .init(
            id: .init(),
            values: [
                "Option #1",
                "Option #2",
                "Option #3"
            ],
            aligment: .below,
            pickerRect: .init(
                x: 150,
                y: 400,
                width: 200,
                height: 60
            ),
            onValueSelected: {
                print(
                    "Selected option #\($0 + 1)"
                )
            })
    )
}
