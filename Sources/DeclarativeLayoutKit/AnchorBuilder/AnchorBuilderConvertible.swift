//
//  File.swift
//  
//
//  Created by Ernest0N on 15.10.2020.
//

import UIKit
import SnapKit


public protocol AnchorLayoutBuilderConvertible {
    func asAnchorLayoutBuilder() -> AnchorLayoutBuilder
}

extension UIView: AnchorLayoutBuilderConvertible {
    public func asAnchorLayoutBuilder() -> AnchorLayoutBuilder {
        AnchorLayoutBuilder(view: self)
    }
}

public extension AnchorLayoutBuilderConvertible {
    /// SnapKit DSL way to setup constraints.
    func layout(_ build: @escaping AnchorLayoutBuilder.DeferredConstraintMaker) -> AnchorLayoutBuilder {
        self.asAnchorLayoutBuilder().addConstraint(build)
    }

    // MARK: Size constraints

    func widthAnchor(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        makeSizeAnchor(\.width, constraint: constraint)
    }

    func heightAnchor(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        makeSizeAnchor(\.height, constraint: constraint)
    }

    /// heightAnchor + widthAnchor
    func sizeAnchor(_ size: CGSize, priority: UILayoutPriority = 999) -> AnchorLayoutBuilder {
        heightAnchor(size.height).widthAnchor(size.width)
    }

    /// height / width
    func aspectRatioAnchor(_ multiplier: Float) -> AnchorLayoutBuilder {
        let builder = self.asAnchorLayoutBuilder()

        return builder.layout({ [unowned builder] in
            $0.height.equalTo(builder.view.snp.width).multipliedBy(1 / multiplier)
        })
    }

    // MARK: Positioning constraints

    /// left + right + top _ bottom anchors
    func stretchAnchors(_ insets: UIEdgeInsets = .zero,
                        to target: ConstraintRelatableTarget? = nil,
                        priority: UILayoutPriority = 999) -> AnchorLayoutBuilder {
        self.layout { $0.edges.equalToFallbackingSuperview(target).inset(insets).priority(priority) }
    }

    func centerXAnchor(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        makeAnchor(\.centerX, constraint: constraint)
    }

    func centerYAnchor(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        makeAnchor(\.centerY, constraint: constraint)
    }

    /// centerYAnchor + centerXAnchor
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

    /// leftAnchor + rightAnchor
    func horizontalAnchor(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        leftAnchor(constraint).rightAnchor(constraint)
    }

    /// topAnchor + bottomAnchor
    func verticalAnchor(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        topAnchor(constraint).bottomAnchor(constraint)
    }
}

// MARK: Helpers

typealias AnchorKeyPath = KeyPath<ConstraintMaker, ConstraintMakerExtendable>

extension AnchorLayoutBuilderConvertible {
    func makeAnchor(_ keyPath: AnchorKeyPath,
                    constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        layout { $0[keyPath: keyPath].set(constraint: constraint) }
    }

    func makeSizeAnchor(_ keyPath: KeyPath<ConstraintMaker, ConstraintMakerExtendable>,
                        constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilder {
        if constraint.target is SuperviewConstraintTarget, let inset = constraint.inset {
            var mutable = MutableAnchorLayoutBuilderConstraint(constraint)
            mutable.target = inset.value
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
