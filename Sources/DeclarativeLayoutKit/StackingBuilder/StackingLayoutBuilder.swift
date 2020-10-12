//
//  StackingLayoutBuilder.swift
//  
//
//  Created by Бабаян Эрнест on 12.10.2020.
//

import UIKit
import SnapKit


public protocol StackingLayoutBuilderConvertible: ViewConvertible {
    func asStackingLayoutBuilder() -> StackingLayoutBuilder
}


extension StackingLayoutBuilderConvertible {
    public func asUIView() -> UIView {
        asStackingLayoutBuilder().view
    }
}


public final class StackingLayoutBuilder: StackingLayoutBuilderConvertible {
    public enum Axis {
        case vertical, horizontal
    }

    struct Attribute {
        let value: CGFloat
        let priority: UILayoutPriority
    }

    let view: UIView
    var height: LayoutBuilderConstraint?
    var beforeSpace: Attribute
    var afterSpace: Attribute
    var sideInset: Attribute
    var centerAlign: Bool

    init(view: UIView,
         height: LayoutBuilderConstraint? = nil,
         beforeSpace: Attribute = .zero,
         afterSpace: Attribute = .zero,
         sideInset: Attribute = .zero,
         centerAlign: Bool = false) {
        self.view = view
        self.height = height
        self.beforeSpace = beforeSpace
        self.afterSpace = afterSpace
        self.sideInset = sideInset
        self.centerAlign = centerAlign
    }

    public func asStackingLayoutBuilder() -> StackingLayoutBuilder { self }
}

extension UIView: StackingLayoutBuilderConvertible {
    public func asStackingLayoutBuilder() -> StackingLayoutBuilder {
        StackingLayoutBuilder(view: self)
    }
}

extension StackingLayoutBuilder.Attribute {
    static var zero: StackingLayoutBuilder.Attribute {
        .init(value: 0, priority: 999)
    }
}

public extension StackingLayoutBuilderConvertible {
    @discardableResult
    func height(_ constraint: LayoutBuilderConstraint) -> StackingLayoutBuilder {
        let builder = self.asStackingLayoutBuilder()
        builder.height = constraint

        return builder
    }

    @discardableResult
    func beforeSpace(_ space: CGFloat, priority: UILayoutPriority = 999) -> StackingLayoutBuilder {
        let builder = self.asStackingLayoutBuilder()
        builder.beforeSpace = .init(value: space, priority: priority)

        return builder
    }

    @discardableResult
    func afterSpace(_ space: CGFloat, priority: UILayoutPriority = 999) -> StackingLayoutBuilder {
        let builder = self.asStackingLayoutBuilder()
        builder.afterSpace = .init(value: space, priority: priority)

        return builder
    }

    @discardableResult
    func sideInset(_ space: CGFloat, priority: UILayoutPriority = 999) -> StackingLayoutBuilder {
        let builder = self.asStackingLayoutBuilder()
        builder.sideInset = .init(value: space, priority: priority)

        return builder
    }

    @discardableResult
    func centerAlign() -> StackingLayoutBuilder {
        let builder = self.asStackingLayoutBuilder()
        builder.centerAlign = true

        return builder
    }
}
