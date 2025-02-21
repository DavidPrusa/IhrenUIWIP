//
//  RectReaderModifier.swift
//  OverTheCounterSDK
//

import SwiftUI

struct RectReaderModifier: ViewModifier {

    private let rect: Binding<CGRect>
    private let coordinateSpace: CoordinateSpace

    init(rectBinding: Binding<CGRect>, coordinateSpace: CoordinateSpace) {
        self.rect = rectBinding
        self.coordinateSpace = coordinateSpace
    }

    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { geometry in
                    Color.clear.preference(key: ViewRectPreferenceKey.self, value: geometry.frame(in: coordinateSpace))
                }
            }
            .onPreferenceChange(ViewRectPreferenceKey.self) { rect in
                self.rect.wrappedValue = rect
            }
    }

    struct ViewRectPreferenceKey: PreferenceKey {

        static let defaultValue: CGRect = .zero

        static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
            value = nextValue()
        }
    }
}

extension View {

    func readRect(into binding: Binding<CGRect>, coordinateSpace: CoordinateSpace = .global) -> some View {
        self.modifier(RectReaderModifier(rectBinding: binding, coordinateSpace: coordinateSpace))
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var previewButtonRect: CGRect = .zero

    VStack {
        Button("Preview") {
            print("Hello!")
        }
        .buttonStyle(.borderedProminent)
        .readRect(into: $previewButtonRect)

        Text("Button's CGRect:\n \(previewButtonRect)")
            .multilineTextAlignment(.center)
    }
}
