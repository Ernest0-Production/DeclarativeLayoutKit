//
//  StackingLayoutBuilder.swift
//  
//
//  Created by Бабаян Эрнест on 12.10.2020.
//

import UIKit
import SnapKit


public protocol StackingLayoutBuilderConvertible {
    func asStackingLayoutBuilder() -> StackingLayoutBuilder
}

public final class StackingLayoutBuilder: StackingLayoutBuilderConvertible, ViewContainer {
    public enum Axis {
        case vertical, horizontal
    }

    struct Margin {
        let value: CGFloat
        let priority: UILayoutPriority
    }

    let view: UIView
    var beforeSpace: Margin
    var afterSpace: Margin
    var sideInset: Margin
    var centerAlign: Bool
    var didMoveToSuperview: () -> () = {}

    init(view: UIView,
         beforeSpace: Margin = .zero,
         afterSpace: Margin = .zero,
         sideInset: Margin = .zero,
         centerAlign: Bool = false) {
        self.view = view
        self.beforeSpace = beforeSpace
        self.afterSpace = afterSpace
        self.sideInset = sideInset
        self.centerAlign = centerAlign
    }

    public func asStackingLayoutBuilder() -> StackingLayoutBuilder { self }

    public func addSubview(_ view: UIView) {
        view.addSubview(view)
    }
}

extension UIView: StackingLayoutBuilderConvertible {
    public func asStackingLayoutBuilder() -> StackingLayoutBuilder {
        StackingLayoutBuilder(view: self)
    }
}

extension StackingLayoutBuilder.Margin {
    static var zero: StackingLayoutBuilder.Margin {
        .init(value: 0, priority: 999)
    }
}

public extension StackingLayoutBuilderConvertible {
    func beforeSpace(_ space: CGFloat, priority: UILayoutPriority = 999) -> StackingLayoutBuilder {
        let builder = self.asStackingLayoutBuilder()
        builder.beforeSpace = .init(value: space, priority: priority)

        return builder
    }

    func afterSpace(_ space: CGFloat, priority: UILayoutPriority = 999) -> StackingLayoutBuilder {
        let builder = self.asStackingLayoutBuilder()
        builder.afterSpace = .init(value: space, priority: priority)

        return builder
    }

    func sideInset(_ space: CGFloat, priority: UILayoutPriority = 999) -> StackingLayoutBuilder {
        let builder = self.asStackingLayoutBuilder()
        builder.sideInset = .init(value: space, priority: priority)

        return builder
    }

    func centerAlign() -> StackingLayoutBuilder {
        let builder = self.asStackingLayoutBuilder()
        builder.centerAlign = true

        return builder
    }
}
