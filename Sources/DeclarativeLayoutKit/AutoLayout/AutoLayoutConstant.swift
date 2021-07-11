//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


public protocol AutoLayoutConstant: ConstantDimensionAutoLayoutAnchorConvertible,
                                    BidirectionalConstantDimensionNSLayoutConstraintModificatorConvertible {
    var value: CGFloat { get }
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
