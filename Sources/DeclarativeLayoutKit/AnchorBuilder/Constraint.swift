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
}

public enum ConstraintComparisonType {
    case less
    case equal
    case greater
}

struct MutableAnchorLayoutBuilderConstraint: AnchorLayoutBuilderConstraint {
    var target: ConstraintRelatableTarget
    var inset: AnchorLayoutBuilderConstraintInset?
    var comparisonType: ConstraintComparisonType
    var priority: ConstraintPriorityTarget
}

extension MutableAnchorLayoutBuilderConstraint {
    init(_ constraint: AnchorLayoutBuilderConstraint) {
        self.init(target: constraint.target, inset: constraint.inset, comparisonType: constraint.comparisonType, priority: constraint.priority)
    }
}

public prefix func -(_ constraint: AnchorLayoutBuilderConstraint) -> AnchorLayoutBuilderConstraint {
    var mutable = MutableAnchorLayoutBuilderConstraint(constraint)
    mutable.inset = constraint.inset.flatMap({ -$0.value })
    return mutable
}
