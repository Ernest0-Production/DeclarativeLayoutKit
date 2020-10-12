//
//  LayoutBuilderConstraint.swift
//  
//
//  Created by Бабаян Эрнест on 12.10.2020.
//

import SnapKit
import UIKit


public protocol LayoutBuilderConstraint {
    var inset: LayoutBuilderConstraintInset { get }
    var item: ConstraintRelatableTarget? { get }
    var priority: ConstraintPriorityTarget { get }
}

public extension LayoutBuilderConstraint {
    func priority(_ priority: UILayoutPriority) -> LayoutBuilderConstraint {
        AnyLayoutBuilderConstraint(inset: inset, item: item, priority: priority)
    }
}

struct AnyLayoutBuilderConstraint: LayoutBuilderConstraint {
    let inset: LayoutBuilderConstraintInset
    let item: ConstraintRelatableTarget?
    let priority: ConstraintPriorityTarget
}
