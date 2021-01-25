//
//  ViewStyleCompatible.swift
//  
//
//  Created by Ernest0N on 13.10.2020.
//


public protocol ViewStyleCompatible {}

extension ViewStyleCompatible {
    @discardableResult
    public func set(viewStyle styles: ViewStyle<Self>...) -> Self {
        styles.merge().apply(into: self)
        return self
    }

    @discardableResult
    public func set(@ViewStyleBuilder<Self> viewStyle builder: () -> ViewStyle<Self>) -> Self {
        builder().apply(into: self)
        return self
    }
}

@_functionBuilder
public struct ViewStyleBuilder<Target: ViewStyleCompatible> {
    public typealias Element = ViewStyle<Target>

    public static func buildBlock( _ elements: [Element]) -> Element { elements.merge() }

    public static func buildBlock( _ elements: Element...) -> Element { elements.merge() }

    public static func buildOptional(_ element: Element?) -> Element { element ?? Element.empty }

    public static func buildIf(_ value: Element?) -> Element { value ?? Element.empty }

    public static func buildEither(first: Element) -> Element { first }

    public static func buildEither(second: Element) -> Element { second }
}

extension ViewStyle {
    static var empty: ViewStyle<Target> {
        ViewStyle({ _ in })
    }
}

import UIKit

extension UIView: ViewStyleCompatible {}
