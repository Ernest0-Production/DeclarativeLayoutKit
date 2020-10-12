//
//  ViewLayoutBuilder.swift
//  
//
//  Created by Бабаян Эрнест on 26.09.2020.
//

import Foundation
import UIKit
import SnapKit


public protocol ViewLayoutBuilderConvertible: ViewConvertible {
    func asViewLayoutBuilder() -> ViewLayoutBuilder
}

extension ViewLayoutBuilderConvertible {
    public func asUIView() -> UIView {
        asViewLayoutBuilder().view
    }
}


public final class ViewLayoutBuilder: ViewLayoutBuilderConvertible {
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


    public func asViewLayoutBuilder() -> ViewLayoutBuilder { self }
}


extension UIView: ViewConvertible, ViewLayoutBuilderConvertible {
    public func asUIView() -> UIView { self }

    public func asViewLayoutBuilder() -> ViewLayoutBuilder {
        ViewLayoutBuilder(view: self)
    }
}

public extension ViewLayoutBuilderConvertible {
    @discardableResult
    func layout(_ build: @escaping ViewLayoutBuilder.DeferredConstraintMaker) -> ViewLayoutBuilder {
        self.asViewLayoutBuilder().addConstraint(build)
    }

    // MARK: Size constraints

    @discardableResult
    func width(_ constraint: LayoutBuilderConstraint) -> ViewLayoutBuilder {
        makeAnchor(\.width, constraint: constraint)
    }

    @discardableResult
    func height(_ constraint: LayoutBuilderConstraint) -> ViewLayoutBuilder {
        makeAnchor(\.height, constraint: constraint)
    }

    @discardableResult
    func size(_ size: CGSize, priority: UILayoutPriority = .init(999)) -> ViewLayoutBuilder {
        height(size.height).width(size.width)
    }

    /// height / width
    @discardableResult
    func aspectRatio(_ multiplier: Float) -> ViewLayoutBuilder {
        let builder = self.asViewLayoutBuilder()

        builder.layout { [unowned builder] in
            $0.height.equalTo(builder.view.snp.width).multipliedBy(1 / multiplier)
        }

        return builder
    }

    // MARK: Positioning constraints

    @discardableResult
    func stretch(_ insets: UIEdgeInsets = .zero,
                 to item: ConstraintRelatableTarget? = nil,
                 priority: UILayoutPriority = 999) -> ViewLayoutBuilder {
        self.layout { $0.edges.equalToFallbackingSuperview(item).inset(insets).priority(priority) }
    }

    @discardableResult
    func centerXAnchor(_ constraint: LayoutBuilderConstraint) -> ViewLayoutBuilder {
        makeAnchor(\.centerX, constraint: constraint)
    }

    @discardableResult
    func centerYAnchor(_ constraint: LayoutBuilderConstraint) -> ViewLayoutBuilder {
        makeAnchor(\.centerY, constraint: constraint)
    }

    @discardableResult
    func centerAnchor(_ constraint: LayoutBuilderConstraint) -> ViewLayoutBuilder {
        makeAnchor(\.center, constraint: constraint)
    }

    @discardableResult
    func topAnchor(_ constraint: LayoutBuilderConstraint) -> ViewLayoutBuilder {
        makeAnchor(\.top, constraint: constraint)
    }

    @discardableResult
    func bottomAnchor(_ constraint: LayoutBuilderConstraint) -> ViewLayoutBuilder {
        makeAnchor(\.bottom, constraint: constraint)
    }

    @discardableResult
    func leftAnchor(_ constraint: LayoutBuilderConstraint) -> ViewLayoutBuilder {
        makeAnchor(\.left, constraint: constraint)
    }

    @discardableResult
    func rightAnchor(_ constraint: LayoutBuilderConstraint) -> ViewLayoutBuilder {
        makeAnchor(\.right, constraint: constraint)
    }

    @discardableResult
    func hotizontalAnchor(_ constraint: LayoutBuilderConstraint) -> ViewLayoutBuilder {
        leftAnchor(constraint).rightAnchor(constraint)
    }

    @discardableResult
    func verticalAnchor(_ constraint: LayoutBuilderConstraint) -> ViewLayoutBuilder {
        topAnchor(constraint).bottomAnchor(constraint)
    }

    // MARK: Helpers 

    private func makeAnchor(_ keyPath: KeyPath<ConstraintMaker, ConstraintMakerExtendable>,
                            constraint: LayoutBuilderConstraint) -> ViewLayoutBuilder {
        layout { $0[keyPath: keyPath].set(constraint: constraint) }
    }
}

extension ConstraintMakerExtendable {
    func equalToFallbackingSuperview(_ anotherAnchor: ConstraintRelatableTarget? = nil, option: ConstraintComparisonType? = nil) -> ConstraintMakerEditable {
        switch (anotherAnchor, option) {
        case (nil, nil):
            return self.equalToSuperview()
        case (nil, .less):
            return self.lessThanOrEqualToSuperview()
        case (nil, .greater):
            return self.greaterThanOrEqualToSuperview()
        case (let another, nil) where another != nil:
            return self.equalTo(another!)
        case (let another, .less) where another != nil:
            return self.lessThanOrEqualTo(another!)
        case (let another, .greater) where another != nil:
            return self.greaterThanOrEqualTo(another!)
        default:
            fatalError("unexpected condition")
        }
    }

    
    func set(constraint: LayoutBuilderConstraint) {
        equalToFallbackingSuperview(
            constraint.item,
            option: constraint.inset.comparisonType)
            .inset(constraint.inset.value)
            .priority(constraint.priority)
    }
}
