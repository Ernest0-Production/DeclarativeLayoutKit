//
//  StackingConvertible.swift
//  
//
//  Created by Ernest0N on 14.10.2020.
//

import UIKit


typealias StackingLayoutBuilderConvertible = VerticalStackingLayoutBuilderConvertible & HorizontalStackingLayoutBuilderConvertible

public protocol VerticalStackingLayoutBuilderConvertible {
    func asStackingLayoutBuilder() -> StackingLayoutBuilder<VerticalStackAxis>
}

public protocol HorizontalStackingLayoutBuilderConvertible {
    func asStackingLayoutBuilder() -> StackingLayoutBuilder<HorizontalStackAxis>
}

extension UIView: StackingLayoutBuilderConvertible {
    public func asStackingLayoutBuilder() -> StackingLayoutBuilder<VerticalStackAxis> {
        StackingLayoutBuilder(view: self)
    }

    public func asStackingLayoutBuilder() -> StackingLayoutBuilder<HorizontalStackAxis> {
        StackingLayoutBuilder(view: self)
    }
}

public extension VerticalStackingLayoutBuilderConvertible {
    /// before space of arranged view
    func topSpace(_ space: CGFloat, priority: UILayoutPriority = 999) -> StackingLayoutBuilder<VerticalStackAxis> {
        let builder = self.asStackingLayoutBuilder()
        builder.beforeSpace = .init(value: space, priority: priority)
        return builder
    }

    /// after space of arranged view
    func bottomSpace(_ space: CGFloat, priority: UILayoutPriority = 999) -> StackingLayoutBuilder<VerticalStackAxis> {
        let builder = self.asStackingLayoutBuilder()
        builder.afterSpace = .init(value: space, priority: priority)
        return builder
    }

    // arranged view distribution in transverse axis
    func horizontalAlignment(_ layout: StackingLayoutBuilder<VerticalStackAxis>.Alignment) -> StackingLayoutBuilder<VerticalStackAxis> {
        let builder = self.asStackingLayoutBuilder()
        builder.alignment = layout
        return builder
    }
}

public extension HorizontalStackingLayoutBuilderConvertible {
    /// before space of arranged view
    func leftSpace(_ space: CGFloat, priority: UILayoutPriority = 999) -> StackingLayoutBuilder<HorizontalStackAxis> {
        let builder = self.asStackingLayoutBuilder()
        builder.beforeSpace = .init(value: space, priority: priority)
        return builder
    }

    /// after space of arranged view
    func rightSpace(_ space: CGFloat, priority: UILayoutPriority = 999) -> StackingLayoutBuilder<HorizontalStackAxis> {
        let builder = self.asStackingLayoutBuilder()
        builder.afterSpace = .init(value: space, priority: priority)
        return builder
    }

    // arranged view distribution in transverse axis
    func verticalAlignment(_ layout: StackingLayoutBuilder<HorizontalStackAxis>.Alignment) -> StackingLayoutBuilder<HorizontalStackAxis> {
        let builder = self.asStackingLayoutBuilder()
        builder.alignment = layout
        return builder
    }
}
