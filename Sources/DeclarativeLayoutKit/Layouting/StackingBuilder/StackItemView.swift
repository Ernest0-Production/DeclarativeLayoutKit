//
//  StackItemView.swift
//  
//
//  Created by Ernest0N on 14.10.2020.
//

import UIKit


public protocol StackAxis {}
public enum VerticalStackAxis: StackAxis {}
public enum HorizontalStackAxis: StackAxis {}

public struct StackItemView<Axis: StackAxis> {
    let view: View & ViewComposer
    let alignment: Alignment

    public init(_ view: View & ViewComposer, alignment: Alignment = .fill()) {
        self.view = view
        self.alignment = alignment
    }
}

public extension StackItemView {
    struct Alignment {
        let first: AnchorLayoutBuilderConstraint?
        let second: AnchorLayoutBuilderConstraint?

        public static var center: Alignment {
            Alignment(first: nil, second: nil)
        }

        public static func fill(sideInset: AnchorLayoutBuilderConstraint = 0) -> Alignment {
            Alignment(first: sideInset, second: sideInset)
        }

        public static func left(_ inset: AnchorLayoutBuilderConstraint = 0) -> Alignment where Axis == VerticalStackAxis {
            .init(first: inset, second: nil)
        }

        public static func right(_ inset: AnchorLayoutBuilderConstraint = 0) -> Alignment where Axis == VerticalStackAxis {
            .init(first: nil, second: inset)
        }

        public static func custom(left: AnchorLayoutBuilderConstraint, right: AnchorLayoutBuilderConstraint) -> Alignment where Axis == VerticalStackAxis {
            .init(first: left, second: right)
        }

        public static func top(_ inset: AnchorLayoutBuilderConstraint = 0) -> Alignment where Axis == HorizontalStackAxis {
            .init(first: inset, second: nil)
        }

        public static func bottom(_ inset: AnchorLayoutBuilderConstraint = 0) -> Alignment where Axis == HorizontalStackAxis {
            .init(first: nil, second: inset)
        }

        public static func custom(top: AnchorLayoutBuilderConstraint, bottom: AnchorLayoutBuilderConstraint) -> Alignment where Axis == HorizontalStackAxis {
            .init(first: top, second: bottom)
        }
    }
}

public extension HorizontalStackItemConvertable {
    // Arranged view distribution in transverse axis
    func verticalAlignment(_ layout: StackItemView<HorizontalStackAxis>.Alignment) -> StackItemView<HorizontalStackAxis> {
        StackItemView(asStackItem(), alignment: layout)
    }
}

public extension VerticalStackItemConvertable {
    // Arranged view distribution in transverse axis
    func horizontalAlignment(_ layout: StackItemView<VerticalStackAxis>.Alignment) -> StackItemView<VerticalStackAxis> {
        StackItemView(asStackItem(), alignment: layout)
    }
}

extension StackItemView: ViewComposer, View {
    public func add(_ subviews: () -> [View]) -> Self {
        view.add(subviews)
        return self
    }

    public var ui: UIView { view.ui }

    public func didMoveToSuperView() {
        view.didMoveToSuperView()
    }
}


public protocol HorizontalStackItemConvertable {
    func asStackItem() -> StackItemView<HorizontalStackAxis>
}

public protocol VerticalStackItemConvertable {
    func asStackItem() -> StackItemView<VerticalStackAxis>
}

extension StackItemView: HorizontalStackItemConvertable where Axis == HorizontalStackAxis {
    public func asStackItem() -> StackItemView<HorizontalStackAxis> { self }
}

extension StackItemView: VerticalStackItemConvertable where Axis == VerticalStackAxis {
    public func asStackItem() -> StackItemView<VerticalStackAxis> { self }
}

extension UIView: HorizontalStackItemConvertable, VerticalStackItemConvertable {
    public func asStackItem() -> StackItemView<HorizontalStackAxis> {
        StackItemView<HorizontalStackAxis>(self)
    }

    public func asStackItem() -> StackItemView<VerticalStackAxis> {
        StackItemView<VerticalStackAxis>(self)
    }
}
