//
//  TitleRepresentable.swift
//  IhrenUI
//

public protocol TitleRepresentable {

    var title: String { get }
}

extension String: TitleRepresentable {

    public var title: String { self }
}

extension Int: TitleRepresentable {

    public var title: String {
        String(self)
    }
}
