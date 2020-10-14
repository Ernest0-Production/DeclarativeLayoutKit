//
//  AnchorLayoutBuilderConstraintInset.swift
//  
//
//  Created by Бабаян Эрнест on 12.10.2020.
//

import SnapKit


public enum ConstraintComparisonType {
    case less
    case equal
    case greater
}

public protocol AnchorLayoutBuilderConstraintInset: AnchorLayoutBuilderConstraint {
    var value: ConstraintInsetTarget { get }
    var comparisonType: ConstraintComparisonType { get }
}

public extension AnchorLayoutBuilderConstraintInset {
    var inset: AnchorLayoutBuilderConstraintInset { self }
    var item: ConstraintRelatableTarget? { nil }
    var priority: ConstraintPriorityTarget { 999 }

    func from(_ item: ConstraintRelatableTarget) -> AnchorLayoutBuilderConstraint {
        AnyLayoutBuilderConstraint(inset: self, item: item, priority: priority)
    }
}
