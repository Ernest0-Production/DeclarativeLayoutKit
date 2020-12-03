//
//  StackingLayoutBuilder.swift
//  
//
//  Created by Ernest0N on 12.10.2020.
//

import UIKit
import SnapKit


public protocol StackAxis {}
public enum VerticalStackAxis: StackAxis {}
public enum HorizontalStackAxis: StackAxis {}

public final class StackingLayoutBuilder<Axis: StackAxis> {
    struct Margin {
        let value: CGFloat
        let priority: UILayoutPriority
    }

    let view: View & ViewComposer
    var beforeSpace: Margin
    var afterSpace: Margin
    var alignment: Alignment

    init(view: View & ViewComposer,
         beforeSpace: Margin = .zero,
         afterSpace: Margin = .zero,
         alignment: Alignment = .fill()) {
        self.view = view
        self.beforeSpace = beforeSpace
        self.afterSpace = afterSpace
        self.alignment = alignment
    }
}

extension StackingLayoutBuilder: VerticalStackingLayoutBuilderConvertible where Axis == VerticalStackAxis {
    public func asStackingLayoutBuilder() -> StackingLayoutBuilder<VerticalStackAxis> { self }
}

extension StackingLayoutBuilder: HorizontalStackingLayoutBuilderConvertible where Axis == HorizontalStackAxis {
    public func asStackingLayoutBuilder() -> StackingLayoutBuilder<HorizontalStackAxis> { self }
}

extension StackingLayoutBuilder: ViewComposer, View {
    public func add(_ subviews: () -> [View]) -> Self {
        view.add(subviews)
        return self
    }

    public var ui: UIView { view.ui }

    public func didMoveToSuperView() {
        view.didMoveToSuperView()
    }
}

extension StackingLayoutBuilder.Margin {
    static var zero: StackingLayoutBuilder.Margin {
        .init(value: 0, priority: 999)
    }
}
