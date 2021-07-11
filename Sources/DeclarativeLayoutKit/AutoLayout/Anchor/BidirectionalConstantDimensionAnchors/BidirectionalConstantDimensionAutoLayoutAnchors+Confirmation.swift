//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


extension ConstantDimensionAutoLayoutAnchor: BidirectionalConstantDimensionNSLayoutConstraintModificatorConvertible {
    public func asBidirectionalConstantDimensionNSLayoutConstraintModificator() -> BidirectionalConstantDimensionNSLayoutConstraintModificator {
        BidirectionalConstantDimensionNSLayoutConstraintModificator(model: self)
    }
}

extension AutoLayoutConstant {
    public func asBidirectionalConstantDimensionNSLayoutConstraintModificator() -> BidirectionalConstantDimensionNSLayoutConstraintModificator {
        BidirectionalConstantDimensionNSLayoutConstraintModificator(
            model: ConstantDimensionAutoLayoutAnchor(constant: self.value)
        )
    }
}
