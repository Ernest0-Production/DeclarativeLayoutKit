//
//  AnchorLayoutBuilder.swift
//  
//
//  Created by Бабаян Эрнест on 26.09.2020.
//

import Foundation
import UIKit
import SnapKit


public protocol AnchorLayoutBuilderConvertible {
    func asAnchorLayoutBuilder() -> AnchorLayoutBuilder
}

public final class AnchorLayoutBuilder {
    public typealias DeferredConstraintMaker = (ConstraintMaker) -> Void
    public let view: UIView
    private var constraintMakers: [DeferredConstraintMaker]

    fileprivate init(view: UIView, constraintMakers: [DeferredConstraintMaker] = []) {
        self.view = view
        self.constraintMakers = constraintMakers
    }

    public func build() {
        view.snp.makeConstraints { maker in
            constraintMakers.forEach({ $0(maker) })
        }
    }

    @discardableResult
    func addConstraint(_ build: @escaping DeferredConstraintMaker) -> Self {
        constraintMakers.append(build)
        return self
    }
}

extension AnchorLayoutBuilder: AnchorLayoutBuilderConvertible {
    public func asAnchorLayoutBuilder() -> AnchorLayoutBuilder { self }
}

extension AnchorLayoutBuilder: ViewContainer, ViewContainerSubview {
    public func add(@ViewContainerBuilder _ subviews: () -> [ViewContainerSubview]) -> Self {
        view.add(subviews)
        return self
    }

    public var ui: UIView { view }

    public func didMoveToSuperView() { build() }
}

extension AnchorLayoutBuilder: StackingLayoutBuilderConvertible {
    public func asStackingLayoutBuilder() -> StackingLayoutBuilder<VerticalStackAxis> {
        StackingLayoutBuilder(view: self)
    }

    public func asStackingLayoutBuilder() -> StackingLayoutBuilder<HorizontalStackAxis> {
        StackingLayoutBuilder(view: self)
    }
}

extension UIView: AnchorLayoutBuilderConvertible {
    public func asAnchorLayoutBuilder() -> AnchorLayoutBuilder {
        AnchorLayoutBuilder(view: self)
    }
}

public extension AnchorLayoutBuilderConvertible {
    func layout(_ build: @escaping AnchorLayoutBuilder.DeferredConstraintMaker) -> AnchorLayoutBuilder {
        self.asAnchorLayoutBuilder().addConstraint(build)
    }

    // MARK: Size constraints
    func width(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        makeSizeAnchor(\.width, constraint: constraint)
    }

    func height(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        makeSizeAnchor(\.height, constraint: constraint)
    }

    func size(_ size: CGSize, priority: UILayoutPriority = 999) -> AnchorLayoutBuilder {
        height(size.height).width(size.width)
    }

    /// height / width
    func aspectRatio(_ multiplier: Float) -> AnchorLayoutBuilder {
        let builder = self.asAnchorLayoutBuilder()

        return builder.layout({ [unowned builder] in
            $0.height.equalTo(builder.view.snp.width).multipliedBy(1 / multiplier)
        })
    }

    // MARK: Positioning constraints

    func stretch(_ insets: UIEdgeInsets = .zero,
                 to item: ConstraintRelatableTarget? = nil,
                 priority: UILayoutPriority = 999) -> AnchorLayoutBuilder {
        self.layout { $0.edges.equalToFallbackingSuperview(item).inset(insets).priority(priority) }
    }

    func centerXAnchor(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        makeAnchor(\.centerX, constraint: constraint)
    }

    func centerYAnchor(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        makeAnchor(\.centerY, constraint: constraint)
    }

    func centerAnchor(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        makeAnchor(\.center, constraint: constraint)
    }

    func topAnchor(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        makeAnchor(\.top, constraint: constraint)
    }

    func bottomAnchor(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        makeAnchor(\.bottom, constraint: constraint)
    }

    func leftAnchor(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        makeAnchor(\.left, constraint: constraint)
    }

    func rightAnchor(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        makeAnchor(\.right, constraint: constraint)
    }

    func horizontalAnchor(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        leftAnchor(constraint).rightAnchor(constraint)
    }

    func verticalAnchor(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        topAnchor(constraint).bottomAnchor(constraint)
    }
}

// MARK: Helpers

extension AnchorLayoutBuilderConvertible {
    func makeAnchor(_ keyPath: KeyPath<ConstraintMaker, ConstraintMakerExtendable>,
                    constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        layout { $0[keyPath: keyPath].set(constraint: constraint) }
    }

    func makeSizeAnchor(_ keyPath: KeyPath<ConstraintMaker, ConstraintMakerExtendable>,
                        constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        if constraint.target is SuperviewConstraintTarget, let inset = constraint.inset {
            var mutable = MutableAnchorLayoutBuilderConstraint(constraint)
            mutable.target = inset
            mutable.inset = nil
            return makeAnchor(keyPath, constraint: mutable)
        }

        return makeAnchor(keyPath, constraint: constraint)
    }
}

private extension ConstraintMakerExtendable {
    func equalToFallbackingSuperview(_ anotherAnchor: ConstraintRelatableTarget? = nil, option: ConstraintComparisonType = .equal) -> ConstraintMakerEditable {
        var anchor = anotherAnchor
        if anotherAnchor is SuperviewConstraintTarget {
            anchor = nil
        }

        switch (anchor, option) {
        case (nil, .equal):
            return self.equalToSuperview()
        case (nil, .less):
            return self.lessThanOrEqualToSuperview()
        case (nil, .greater):
            return self.greaterThanOrEqualToSuperview()
        case (let another, .equal) where another != nil:
            return self.equalTo(another!)
        case (let another, .less) where another != nil:
            return self.lessThanOrEqualTo(another!)
        case (let another, .greater) where another != nil:
            return self.greaterThanOrEqualTo(another!)
        default:
            fatalError("unexpected condition")
        }
    }

    func set(constraint: AnchorLayoutBuilderConstraint) {
        let snapKitConstraint = equalToFallbackingSuperview(constraint.target, option: constraint.comparisonType)

        if let inset = constraint.inset {
            snapKitConstraint.inset(inset.value)
        }

        snapKitConstraint.priority(constraint.priority)
    }
}
