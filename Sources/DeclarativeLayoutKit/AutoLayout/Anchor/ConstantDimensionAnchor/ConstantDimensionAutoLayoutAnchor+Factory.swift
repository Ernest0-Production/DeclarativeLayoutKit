//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension ConstantDimensionAutoLayoutAnchorConvertible {
    var orGreater: ConstantDimensionAutoLayoutAnchor {
        var copy = self.asConstantDimensionAutoLayoutAnchor()
        copy.relationType = .greater
        return copy
    }
    
    var orLess: ConstantDimensionAutoLayoutAnchor {
        var copy = self.asConstantDimensionAutoLayoutAnchor()
        copy.relationType = .less
        return copy
    }
}
