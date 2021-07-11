//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension BidirectionalDimensionAutoLayoutAnchorsConvertible {
    func multiplied(by multiplier: CGFloat) -> BidirectionalDimensionAutoLayoutAnchors {
        var copy = asBidirectionalDimensionAutoLayoutAnchors()
        copy.multiplier = multiplier
        return copy
    }
    
    var orGreater: BidirectionalDimensionAutoLayoutAnchors {
        var copy = asBidirectionalDimensionAutoLayoutAnchors()
        copy.relationType = .greater
        return copy
    }
    
    var orLess: BidirectionalDimensionAutoLayoutAnchors {
        var copy = asBidirectionalDimensionAutoLayoutAnchors()
        copy.relationType = .less
        return copy
    }
}
