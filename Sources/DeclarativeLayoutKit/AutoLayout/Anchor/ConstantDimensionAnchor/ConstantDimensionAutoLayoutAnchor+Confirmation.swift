//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


extension AutoLayoutConstant {
    public func asConstantDimensionAutoLayoutAnchor() -> ConstantDimensionAutoLayoutAnchor {
        ConstantDimensionAutoLayoutAnchor(constant: self.value)
    }
}
