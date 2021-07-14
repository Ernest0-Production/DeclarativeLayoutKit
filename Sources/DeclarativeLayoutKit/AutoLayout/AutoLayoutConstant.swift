//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


public protocol AutoLayoutConstant:
    AfterRelationConstantBuildNSLayoutConstraintModificatorConvertible
//    ConstantDimensionAutoLayoutAnchorConvertible,
//    BidirectionalConstantDimensionNSLayoutConstraintModificatorConvertible
{
    var value: CGFloat { get }
}

extension AutoLayoutConstant {
    public func asAfterRelationConstantBuildNSLayoutConstraintModificator() -> AfterBuildModificator<(CGFloat, RelationType), NSLayoutConstraint> {
        AfterBuildModificator<(CGFloat, RelationType), NSLayoutConstraint>(model: (value, RelationType.equal))
    }
}

extension Int: AutoLayoutConstant {
    public var value: CGFloat { CGFloat(self) }
}

extension Float: AutoLayoutConstant {
    public var value: CGFloat { CGFloat(self) }
}

extension Double: AutoLayoutConstant {
    public var value: CGFloat { CGFloat(self) }
}

extension CGFloat: AutoLayoutConstant {
    public var value: CGFloat { CGFloat(self) }
}
