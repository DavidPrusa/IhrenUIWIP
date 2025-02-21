//
//  DropdownPicker.swift
//  IhrenUI
//

import SwiftUI

public enum DropdownPickerBackground: CaseIterable, Identifiable {
    case `default`
    case clear

    public var id: Self { self }
}

public enum DropdownPickerStyle: CaseIterable, Identifiable {
    case `default`
    case dosage

    public var id: Self { self }
}

public struct DropdownPicker<Value>: View where Value: Equatable & TitleRepresentable {

    let title: String?
    var hint: String?
    var errorMessage: String?
    @Binding var currentValue: Value?
    let allowedValues: [Value]
    let id: String
    var onValueSelected: Callback<Value>?

    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.dropdownPickerBackground) var background: DropdownPickerBackground
    @Environment(\.dropdownPickerStyle) var style: DropdownPickerStyle
    @Environment(\.dropdownPickerMenuAlignment) var menuAlignment: DropdownPickerMenuAlignment
    @Environment(\.dropdownPickerMenu) var menuData: Binding<DropdownPickerMenuData?>

    @State private var pickerRect: CGRect = .zero

    public init(
        title: String? = nil,
        currentValue: Binding<Value?>,
        allowedValues: [Value],
        id: String
    ) {
        self.init(
            title: title,
            hint: nil,
            errorMessage: nil,
            currentValue: currentValue,
            allowedValues: allowedValues,
            background: .default,
            style: .default,
            dropdownAlignment: .above,
            id: id,
            menuData: .constant(nil)
        )
    }

    private init(
        title: String? = nil,
        hint: String? = nil,
        errorMessage: String? = nil,
        currentValue: Binding<Value?>,
        allowedValues: [Value],
        background: DropdownPickerBackground = .default,
        style: DropdownPickerStyle = .default,
        dropdownAlignment: DropdownPickerMenuAlignment = .above,
        id: String,
        menuData: Binding<DropdownPickerMenuData?>
    ) {
        self.title = title
        self.hint = hint
        self.errorMessage = errorMessage
        self._currentValue = currentValue
        self.allowedValues = allowedValues
        self.id = id
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: .spacing.xx_sm) {
            if style == .dosage,
               let title {
                titleLabel(title)
            }

            VStack(alignment: .leading, spacing: .spacing.x_sm) {
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        if style == .default,
                           let title {
                            titleLabel(title)
                        }

                        if let currentValue {
                            currentValueLabel(currentValue)
                        }
                    }

                    dropdownIcon
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.horizontal, .spacing.xx_md)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 48)
                .background(backgroundColor)
                .contentShape(shape)
                .clipShape(shape)
                .overlay {
                    shape
                        .stroke(borderColor, lineWidth: 1)
                }
                .onTapGestureWithContentShape {
                    tapped()
                }

                if let errorMessage {
                    errorMessageLabel(errorMessage)
                }

                if let hint {
                    hintLabel(hint)
                }
            }
            .readRect(into: $pickerRect)
        }
        .onChange(of: pickerRect, initial: false) { _ in
            guard menuData.wrappedValue?.id == id else { return }
            setMenuData()
        }
    }
}

private extension DropdownPicker {

    // MARK: - Logic

    var isPickingValue: Bool {
        menuData.wrappedValue?.id == id
    }

    func tapped() {
        guard isEnabled else { return }

        if menuData.wrappedValue?.id == id {
            menuData.wrappedValue = nil
        } else {
            setMenuData()
        }
    }

    func setMenuData() {
        menuData.wrappedValue = .init(
            id: id,
            values: self.allowedValues.map { $0.title },
            aligment: menuAlignment,
            pickerRect: pickerRect,
            onValueSelected: { index in
                guard let value = allowedValues[safe: index] else { return }
                currentValue = value
                self.menuData.wrappedValue = nil

                if let onValueSelected {
                    onValueSelected(value)
                } else {
                    dprint("Value \(value) was selected, but onValueSelected was not set!")
                }
            })
    }

    // MARK: - Subviews

    func titleLabel(_ title: String) -> some View {
        Text(title)
            .font(titleFont)
            .foregroundStyle(titleColor)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    func currentValueLabel(_ value: Value) -> some View {
        Text(value.title)
            .font(currentValueFont)
            .foregroundStyle(currentValueColor)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    var dropdownIcon: some View {
        Image(.iconChevronDown)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .foregroundStyle(chevronColor)
            .frame(size: 12)
            .rotationEffect(.degrees(isPickingValue ? -180 : 0))
            .animation(.linear(duration: 0.2), value: isPickingValue)
    }

    func errorMessageLabel(_ message: String) -> some View {
        Text(message)
            .font(.ia.hint)
            .foregroundStyle(.ia.error500)
            .padding(.leading, .spacing.xx_md)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    func hintLabel(_ hint: String) -> some View {
        Text(hint)
            .font(.ia.hint)
            .foregroundStyle(.ia.grey700)
            .padding(.leading, .spacing.xx_md)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: - Utils

    var shape: some Shape {
        RoundedRectangle(cornerRadius: .radius.box)
    }

    var backgroundColor: Color {
        if !isEnabled {
            return .ia.grey100
        }

        if isPickingValue || currentValue != nil {
            return .ia.white
        }

        return switch background {
        case .default: .ia.darkBg
        case .clear: .ia.white
        }
    }

    var borderColor: Color {
        if !isEnabled {
            return .ia.grey200
        }

        if isPickingValue {
            return .ia.primary500
        }

        return .ia.grey200
    }

    var chevronColor: Color {
        if !isEnabled {
            return .ia.grey300
        }

        if errorMessage != nil {
            return .ia.error500
        }

        return .ia.primary500
    }

    var titleFont: FontResource {
        return switch style {
        case .default: currentValue == nil ? .ia.p2 : .ia.p4
        case .dosage: .ia.h2.semibold
        }
    }

    var titleColor: Color {
        return switch style {
        case .default: currentValue == nil ? .ia.grey500 : .ia.grey600
        case .dosage: .ia.grey800
        }
    }

    var currentValueFont: FontResource {
        return switch style {
        case .default: .ia.p2
        case .dosage: isEnabled ? .ia.h2 : .ia.p2
        }
    }

    var currentValueColor: Color {
        isEnabled ? .ia.grey800 : .ia.grey300
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var selectedValue: String?
    @Previewable @State var menuData: DropdownPickerMenuData?
    @Previewable @State var isDisabled: Bool = false
    @Previewable @State var background: DropdownPickerBackground = .default
    @Previewable @State var style: DropdownPickerStyle = .default
    @Previewable @State var menuAlignment: DropdownPickerMenuAlignment = .below

    DropdownPicker(
        title: "Preview",
        currentValue: $selectedValue,
        allowedValues: ["Option #1", "Option #2"],
        id: "123"
    )
    .dropdownPickerBackground(background)
    .dropdownPickerStyle(style)
    .dropdownPickerMenuAlignemnt(menuAlignment)
    .disabled(isDisabled)
    .padding()
    .overlayDropdownPickerMenu($menuData)
    .overlay(alignment: .top) {
        VStack {
            Toggle(isOn: $isDisabled) {
                Text("Disabled")
            }

            HStack {
                Text("Background")

                Spacer()

                Picker("Background", selection: $background) {
                    ForEach(DropdownPickerBackground.allCases) {
                        Text("\($0)")
                    }
                }
                .frame(width: 150)
            }

            HStack {
                Text("Style")

                Spacer()

                Picker("Style", selection: $style) {
                    ForEach(DropdownPickerStyle.allCases) {
                        Text("\($0)")
                    }
                }
                .frame(width: 150)
            }

            HStack {
                Text("Menu Alignment")

                Spacer()

                Picker("Menu Alignment", selection: $menuAlignment) {
                    ForEach(DropdownPickerMenuAlignment.allCases) {
                        Text("\($0)")
                    }
                }
                .frame(width: 150)
            }
        }
        .pickerStyle(.segmented)
        .padding()
    }
}
