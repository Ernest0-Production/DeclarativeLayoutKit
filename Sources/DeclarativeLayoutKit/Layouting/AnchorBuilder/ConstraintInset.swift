//
//  ConstraintInset.swift
//  
//
//  Created by Ernest0N on 12.10.2020.
//

import SnapKit
import UIKit


public protocol AnchorLayoutBuilderConstraintInset: AnchorLayoutBuilderConstraint {
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

    public func from(_ target: ConstraintRelatableTarget) -> AnchorLayoutBuilderConstraint {
        var mutable = MutableAnchorLayoutBuilderConstraint(self)
        mutable.target = target
        mutable.inset = inset.map({ -$0.value })
        return mutable
    }
    
    public func to(_ target: ConstraintRelatableTarget) -> AnchorLayoutBuilderConstraint {
        var mutable = MutableAnchorLayoutBuilderConstraint(self)
        mutable.target = target
        return mutable
    }
}
