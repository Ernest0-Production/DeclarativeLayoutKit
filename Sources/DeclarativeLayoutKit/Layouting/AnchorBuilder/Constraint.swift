//
//  AnchorLayoutBuilderConstraint.swift
//  
//
//  Created by Ernest0N on 12.10.2020.
//

import SnapKit
import UIKit


public protocol AnchorLayoutBuilderConstraint {
    var target: ConstraintRelatableTarget { get }
    var inset: AnchorLayoutBuilderConstraintInset? { get }
    var comparisonType: ConstraintComparisonType { get }
    var priority: ConstraintPriorityTarget { get }
}

public extension AnchorLayoutBuilderConstraint {
    var comparisonType: ConstraintComparisonType { .equal }
    var priority: ConstraintPriorityTarget { 999 }

    func priority(_ priority: UILayoutPriority) -> AnchorLayoutBuilderConstraint {
        var mutable = MutableAnchorLayoutBuilderConstraint(self)
        mutable.priority = priority
        return mutable
    }
    
    var orLess: AnchorLayoutBuilderConstraint {
        var mutable = MutableAnchorLayoutBuilderConstraint(self)
        mutable.comparisonType = ConstraintComparisonType.less
        return mutable
    }

    var orGreater: AnchorLayoutBuilderConstraint {
        var mutable = MutableAnchorLayoutBuilderConstraint(self)
        mutable.comparisonType = ConstraintComparisonType.greater
        return mutable
    }
}

/// Workaround internal mark to detect superview target
public struct SuperviewConstraintTarget: ConstraintRelatableTarget {
    public init() {}
}

public enum ConstraintComparisonType {
    case less
    case equal
    case greater
}

public struct MutableAnchorLayoutBuilderConstraint: AnchorLayoutBuilderConstraint {
    public var target: ConstraintRelatableTarget
    public var inset: AnchorLayoutBuilderConstraintInset?
    public var comparisonType: ConstraintComparisonType
    public var priority: ConstraintPriorityTarget

    public init(target: ConstraintRelatableTarget, inset: AnchorLayoutBuilderConstraintInset? = nil, comparisonType: ConstraintComparisonType, priority: ConstraintPriorityTarget) {
        self.target = target
        self.inset = inset
        self.comparisonType = comparisonType
        self.priority = priority
    }

    public init(_ constraint: AnchorLayoutBuilderConstraint) {
        self.init(target: constraint.target, inset: constraint.inset, comparisonType: constraint.comparisonType, priority: constraint.priority)
    }
}

public prefix func -(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilderConstraint {
    var mutable = MutableAnchorLayoutBuilderConstraint(constraint)
    mutable.inset = constraint.inset.flatMap({ -$0.value }) ?? constraint.inset
    return mutable
}

extension ConstraintMakerExtendable {
    @discardableResult
    public func set(constraint: AnchorLayoutBuilderConstraint) -> ConstraintMakerFinalizable {
        let snapKitConstraint = equalToFallbackingSuperview(constraint.target, option: constraint.comparisonType)

        if let inset = constraint.inset {
            snapKitConstraint.inset(inset.value)
        }

        return snapKitConstraint.priority(constraint.priority)
    }

    func equalToFallbackingSuperview(_ anotherAnchor: ConstraintRelatableTarget, option: ConstraintComparisonType = .equal) -> ConstraintMakerEditable {
        let anchor: ConstraintRelatableTarget? = anotherAnchor is SuperviewConstraintTarget ? nil : anotherAnchor

        switch (anchor, option) {
        case (nil, ConstraintComparisonType.equal):
            return self.equalToSuperview()
        case (nil, ConstraintComparisonType.less):
            return self.lessThanOrEqualToSuperview()
        case (nil, ConstraintComparisonType.greater):
            return self.greaterThanOrEqualToSuperview()
        case (Optional.some(let another), ConstraintComparisonType.equal):
            return self.equalTo(another)
        case (Optional.some(let another), ConstraintComparisonType.less):
            return self.lessThanOrEqualTo(another)
        case (Optional.some(let another), ConstraintComparisonType.greater):
            return self.greaterThanOrEqualTo(another)
        }
    }
}
