//
//  InputField.swift
//  IhrenUI
//

import SwiftUI

public enum InputFieldStyle: CaseIterable, Identifiable {
    case clear
    case grey

    public var id: Self { self }
}

public struct InputField: View {

    private let title: String
    @Binding var query: String
    var isFocusedExternally: Binding<Bool>?
    var onSubmit: EmptyCallback?
    var errorMessage: String?
    var hint: String?
    var leadingIcon: Image?
    var trailingIcon: Image?
    var submitLabel: SubmitLabel?

    @State private var smallTitleOpacity: CGFloat = 0
    @State private var smallTitleOffset: CGFloat = 0
    @FocusState private var isFocusedFromFocusState

    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.inputFieldStyle) private var inputFieldStyle

    @StateObject private var viewModel: InputFieldViewModel

    public init(
        title: String,
        query: Binding<String>,
        debouncedQuery: Binding<String>? = nil,
        debounceTime: TimeInterval? = nil) {
            self.title = title
            self._query = query

            self._viewModel = .init(
                wrappedValue: .init(
                    query: query,
                    debouncedQuery: debouncedQuery,
                    debounceTime: debounceTime
                )
            )
        }

    public var body: some View {
        VStack(alignment: .leading, spacing: .spacing.md) {
            HStack(spacing: 0) {
                if let leadingIcon {
                    leadingIcon
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.ia.grey600)
                        .frame(size: .spacing.xx_md)
                        .padding(.trailing, 10)
                }

                TextField(title, text: $viewModel.fieldText)
                    .applyIfLet(submitLabel) { view, label in
                        view.submitLabel(label)
                    }
                    .foregroundStyle(fieldTextColor)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .animation(nil, value: isFocusedFromFocusState)
                    .onSubmit {
                        setFocused(false)
                        onSubmit?()
                    }
                    .focused($isFocusedFromFocusState)
                    .contentShape(Rectangle())
                // High Priority Gesture is needed to "overwrite" TextField's gesture so that the focus binding works from call site.
                    .highPriorityGesture(
                        TapGesture()
                            .onEnded {
                                setFocused(true)
                            })
                    .padding(.top, isSmallTitleVisible ? 16 : 0)
                    .overlay(alignment: .topLeading) {
                        Text(title)
                            .font(.ia.p4)
                            .lineLimit(1)
                            .foregroundStyle(smallTitleColor)
                            .opacity(smallTitleOpacity)
                            .offset(y: smallTitleOffset)
                            .onChange(of: isSmallTitleVisible, initial: true) { isInitial in
                                if isSmallTitleVisible {
                                    if isInitial {
                                        smallTitleOpacity = 1
                                        smallTitleOffset = 0
                                    } else {
                                        withAnimation(.linear(duration: 0.2)) {
                                            smallTitleOpacity = 1
                                            smallTitleOffset = 0
                                        }
                                    }
                                } else {
                                    smallTitleOpacity = 0
                                    smallTitleOffset = 8
                                }
                            }
                    }

                xButton

                if let trailingIcon {
                    Rectangle()
                        .fill(isEnabled ? .ia.grey300 : .ia.grey200)
                        .frame(width: 1)
                        .padding(.vertical, 8)
                        .padding(.leading, 10)
                        .padding(.trailing, 16)

                    trailingIcon
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(isEnabled ? .ia.primary : .ia.grey200)
                        .frame(size: .spacing.xx_md)
                }
            }
            .padding(.horizontal, 16)
            .frame(height: 48)
            .background(backgroundColor)
            .overlay {
                fieldShape
                    .stroke(borderColor, lineWidth: 1)
            }
            .clipShape(fieldShape)

            if let errorMessage {
                Text(verbatim: errorMessage)
                    .font(.ia.hint)
                    .foregroundStyle(.ia.error)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            if let hint {
                Text(verbatim: hint)
                    .font(.ia.hint)
                    .foregroundStyle(.ia.black)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .onChange(of: isFocusedExternally?.wrappedValue ?? false, initial: true) { _ in
            // This onChange allows call-sites to edit FocusState
            isFocusedFromFocusState = isFocusedExternally?.wrappedValue ?? false
        }
        .onChange(of: query, initial: true) { _ in
            guard query != viewModel.fieldText else { return }
            self.viewModel.fieldText = query
        }
    }
}

private extension InputField {

    // MARK: - Logic

    var isFocused: Bool {
        isFocusedExternally?.wrappedValue ?? isFocusedFromFocusState
    }

    func setFocused(_ focused: Bool) {
        if let isFocusedExternally {
            isFocusedExternally.wrappedValue = focused
        } else {
            isFocusedFromFocusState = focused
        }
    }

    var fieldShape: some Shape {
        RoundedRectangle(cornerRadius: .radius.box)
    }

    var xButton: some View {
        Button {
            viewModel.deleteQuery()
        } label: {
            Image(.iconX)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .foregroundStyle(.ia.grey300)
                .frame(size: .spacing.x_md)
                .frame(size: 24)
        }
        .buttonStyle(.plain)
        .hidden(viewModel.fieldText.isEmpty)
    }

    var isSmallTitleVisible: Bool {
        return !viewModel.fieldText.isEmpty
    }

    var borderColor: Color {
        if !isEnabled {
            return .ia.darkBg
        }

        if errorMessage != nil {
            return .ia.error500
        }

        if isFocused {
            return .ia.grey600
        }

        return .ia.grey200
    }

    var backgroundColor: Color {
        if !isEnabled {
            return .ia.darkBg
        }

        return switch inputFieldStyle {
        case .clear: .ia.white
        case .grey: .ia.darkBg
        }
    }

    var smallTitleColor: Color {
        if errorMessage != nil {
            return .ia.error
        }

        return .ia.grey500
    }

    var fieldTextColor: Color {
        if errorMessage != nil {
            if isFocused {
                return .ia.grey800
            } else {
                return .ia.error500
            }
        }

        if !viewModel.fieldText.isEmpty || isFocusedFromFocusState {
            return .ia.black
        }

        return .ia.grey400
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var query = "Hello, Previews!"

    @Previewable @State var hasLeadingIcon = true
    @Previewable @State var hasTrailingIcon = true
    @Previewable @State var hasErrorMessage = true
    @Previewable @State var hasHintMessage = true

    @Previewable @State var isDisabled = false
    @Previewable @State var inputFieldStyle: InputFieldStyle = .clear

    VStack {
        VStack(spacing: 12) {
            Toggle("Leading Icon", isOn: $hasLeadingIcon)
            Toggle("Trailing Icon", isOn: $hasTrailingIcon)
            Toggle("Error message", isOn: $hasErrorMessage)
            Toggle("Hint message", isOn: $hasHintMessage)

            Toggle("Is Disabled", isOn: $isDisabled)

            HStack {
                Text("Style")

                Spacer(minLength: 64)

                Picker("Style", selection: $inputFieldStyle) {
                    ForEach(InputFieldStyle.allCases) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
        }
        .padding()

        InputField(title: "Input Field Title", query: $query)
            .leadingIcon(hasLeadingIcon ? .init(.iconCart) : nil)
            .trailingIcon(hasTrailingIcon ? .init(.iconLocator) : nil)
            .errorMessage(hasErrorMessage ? "This is an error message" : nil)
            .hint(hasHintMessage ? "Ths is a hint" : nil)
            .disabled(isDisabled)
            .inputFieldStyle(inputFieldStyle)
            .padding()
    }
}
