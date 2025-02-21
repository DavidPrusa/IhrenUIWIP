//
//  TypeAliases.swift
//  IhrenUI
//

import Foundation

public typealias EmptyCallback = () -> Void
public typealias Callback<each T> = (repeat each T) -> Void
public typealias SendableCallback<each T> = @Sendable (repeat each T) -> Void
public typealias SendableMainActorCallback<each T> = @Sendable @MainActor (repeat each T) -> Void
