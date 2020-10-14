//
//  SnapKitInsetConvertible.swift
//  
//
//  Created by Бабаян Эрнест on 12.10.2020.
//

import SnapKit
import  UIKit


public protocol SnapKitInsetConvertible: AnchorLayoutBuilderConstraintInset {
    func asConstraintInsertTarget() -> ConstraintInsetTarget
}

extension SnapKitInsetConvertible where Self: ConstraintInsetTarget {
    public func asConstraintInsertTarget() -> ConstraintInsetTarget { self }
}

extension Int: SnapKitInsetConvertible {}
extension Float: SnapKitInsetConvertible {}
extension Double: SnapKitInsetConvertible {}
extension CGFloat: SnapKitInsetConvertible {}

extension SnapKitInsetConvertible {
    public var value: ConstraintInsetTarget { asConstraintInsertTarget() }
    public var comparisonType: ConstraintComparisonType { .equal }

    public var orLess: AnchorLayoutBuilderConstraintInset {
        AnyLayoutBuilderConstraintInset(value: value, comparisonType: .less)
    }

    public var orGreater: AnchorLayoutBuilderConstraintInset {
        AnyLayoutBuilderConstraintInset(value: value, comparisonType: .greater)
    }
}

struct AnyLayoutBuilderConstraintInset: AnchorLayoutBuilderConstraintInset {
    let value: ConstraintInsetTarget
    let comparisonType: ConstraintComparisonType
}
