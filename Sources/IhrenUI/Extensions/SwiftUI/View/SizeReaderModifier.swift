//
//  SizeReaderModifier.swift
//  OverTheCounterSDK
//
//  Created by Danijel Huis on 30.01.2025..
//

import SwiftUI

@MainActor
public struct SizeReaderModifier: ViewModifier {    
    @Binding private var size: CGSize
    private var onSizeChange: SendableMainActorCallback<CGSize>?

    init(size: Binding<CGSize>) {
        self._size = size
        self.onSizeChange = nil
    }
    
    init(onSizeChange: SendableMainActorCallback<CGSize>? = nil) {
        self._size = .constant(.zero)
        self.onSizeChange = onSizeChange
    }
    
    public func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { geometry in
                    Color.clear.preference(key: ViewSizePreferenceKey.self, value: geometry.size)
                }
            }
            .onPreferenceChange(ViewSizePreferenceKey.self) { [$size] size in
                $size.wrappedValue = size
                MainActor.assumeIsolated {
                    onSizeChange?(size)
                }
            }
    }
    
    struct ViewSizePreferenceKey: PreferenceKey {
        
        static let defaultValue: CGSize = .zero
        
        static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
            value = nextValue()
        }
    }
}

extension View {
    
    public func readSize(into binding: Binding<CGSize>) -> some View {
        self.modifier(SizeReaderModifier(size: binding))
    }
    
    public func readSize(onSizeChange: SendableMainActorCallback<CGSize>?) -> some View {
        self.modifier(SizeReaderModifier(onSizeChange: onSizeChange))
    }
}
