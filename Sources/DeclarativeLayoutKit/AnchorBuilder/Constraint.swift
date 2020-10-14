//
//  AnchorLayoutBuilderConstraint.swift
//  
//
//  Created by Бабаян Эрнест on 12.10.2020.
//

import SnapKit
import UIKit


public protocol AnchorLayoutBuilderConstraint {
    var inset: AnchorLayoutBuilderConstraintInset { get }
    var item: ConstraintRelatableTarget? { get }
    var priority: ConstraintPriorityTarget { get }
}

public extension AnchorLayoutBuilderConstraint {
    func priority(_ priority: UILayoutPriority) -> AnchorLayoutBuilderConstraint {
        AnyLayoutBuilderConstraint(inset: inset, item: item, priority: priority)
    }
}

struct AnyLayoutBuilderConstraint: AnchorLayoutBuilderConstraint {
    let inset: AnchorLayoutBuilderConstraintInset
    let item: ConstraintRelatableTarget?
    let priority: ConstraintPriorityTarget
}
