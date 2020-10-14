//
//  ConstraintInset.swift
//  
//
//  Created by Бабаян Эрнест on 12.10.2020.
//

import SnapKit
import UIKit


struct SuperviewConstraintTarget: ConstraintRelatableTarget {}

public protocol AnchorLayoutBuilderConstraintInset: AnchorLayoutBuilderConstraint, ConstraintRelatableTarget {
    var value: CGFloat { get }
}

extension Int: AnchorLayoutBuilderConstraintInset {
    public var value: CGFloat { CGFloat(self) }
}
extension Float: AnchorLayoutBuilderConstraintInset {
    public var value: CGFloat { CGFloat(self) }
}
extension Double: AnchorLayoutBuilderConstraintInset {
    public var value: CGFloat { CGFloat(self) }
}
extension CGFloat: AnchorLayoutBuilderConstraintInset {
    public var value: CGFloat { CGFloat(self) }
}

extension AnchorLayoutBuilderConstraintInset {
    public var target: ConstraintRelatableTarget { SuperviewConstraintTarget() }
    public var inset: AnchorLayoutBuilderConstraintInset? { self }

    public var orLess: AnchorLayoutBuilderConstraint {
        var mutable = MutableAnchorLayoutBuilderConstraint(self)
        mutable.comparisonType = .less
        return mutable
    }

    public var orGreater: AnchorLayoutBuilderConstraint {
        var mutable = MutableAnchorLayoutBuilderConstraint(self)
        mutable.comparisonType = .greater
        return mutable
    }

    public func from(_ target: ConstraintRelatableTarget) -> AnchorLayoutBuilderConstraint {
        var mutable = MutableAnchorLayoutBuilderConstraint(self)
        mutable.target = target
        return mutable
    }
}
