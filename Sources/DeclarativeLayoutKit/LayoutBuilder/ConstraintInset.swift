//
//  LayoutBuilderConstraintInset.swift
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

public protocol LayoutBuilderConstraintInset: LayoutBuilderConstraint {
    var value: ConstraintInsetTarget { get }
    var comparisonType: ConstraintComparisonType { get }
}

public extension LayoutBuilderConstraintInset {
    var inset: LayoutBuilderConstraintInset { self }
    var item: ConstraintRelatableTarget? { nil }
    var priority: ConstraintPriorityTarget { 999 }

    func from(_ item: ConstraintRelatableTarget) -> LayoutBuilderConstraint {
        AnyLayoutBuilderConstraint(inset: self, item: item, priority: priority)
    }
}
