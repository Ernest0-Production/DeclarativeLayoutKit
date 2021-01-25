//
//  StackBuilderItemView.swift
//  
//
//  Created by Ernest0N on 14.10.2020.
//

import UIKit


public protocol StackAxis {}
public enum VerticalStackAxis: StackAxis {}
public enum HorizontalStackAxis: StackAxis {}

public struct StackBuilderItemView<Axis: StackAxis> {
    let view: View & ViewComposer
    let alignment: Alignment

    public init(_ view: View & ViewComposer, alignment: Alignment = .fill()) {
        self.view = view
        self.alignment = alignment
    }
}

public extension StackBuilderItemView {
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

public extension HorizontalStackBuilderItemConvertable {
    // Arranged view distribution in transverse axis
    func verticalAlignment(_ layout: StackBuilderItemView<HorizontalStackAxis>.Alignment) -> StackBuilderItemView<HorizontalStackAxis> {
        StackBuilderItemView(asStackBuilderItem(), alignment: layout)
    }
}

public extension VerticalStackBuilderItemConvertable {
    // Arranged view distribution in transverse axis
    func horizontalAlignment(_ layout: StackBuilderItemView<VerticalStackAxis>.Alignment) -> StackBuilderItemView<VerticalStackAxis> {
        StackBuilderItemView(asStackBuilderItem(), alignment: layout)
    }
}

extension StackBuilderItemView: ViewComposer, View {
    public func add(_ subviews: () -> [View]) -> Self {
        view.add(subviews)
        return self
    }

    public var ui: UIView { view.ui }

    public func didMoveToSuperView() {
        view.didMoveToSuperView()
    }
}


public protocol HorizontalStackBuilderItemConvertable {
    func asStackBuilderItem() -> StackBuilderItemView<HorizontalStackAxis>
}

public protocol VerticalStackBuilderItemConvertable {
    func asStackBuilderItem() -> StackBuilderItemView<VerticalStackAxis>
}

extension StackBuilderItemView: HorizontalStackBuilderItemConvertable where Axis == HorizontalStackAxis {
    public func asStackBuilderItem() -> StackBuilderItemView<HorizontalStackAxis> { self }
}

extension StackBuilderItemView: VerticalStackBuilderItemConvertable where Axis == VerticalStackAxis {
    public func asStackBuilderItem() -> StackBuilderItemView<VerticalStackAxis> { self }
}

extension UIView: HorizontalStackBuilderItemConvertable, VerticalStackBuilderItemConvertable {
    public func asStackBuilderItem() -> StackBuilderItemView<HorizontalStackAxis> {
        StackBuilderItemView<HorizontalStackAxis>(self)
    }

    public func asStackBuilderItem() -> StackBuilderItemView<VerticalStackAxis> {
        StackBuilderItemView<VerticalStackAxis>(self)
    }
}
