//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension DimensionAutoLayoutAnchorConvertible {
    func multiplied(by multiplier: CGFloat) -> DimensionAutoLayoutAnchor {
        var copy = self.asDimensionAutoLayoutAnchor()
        copy.multiplier = multiplier
        return copy
    }
    
    var orGreater: DimensionAutoLayoutAnchor {
        var copy = self.asDimensionAutoLayoutAnchor()
        copy.relationType = .greater
        return copy
    }
    
    var orLess: DimensionAutoLayoutAnchor {
        var copy = self.asDimensionAutoLayoutAnchor()
        copy.relationType = .less
        return copy
    }
}
