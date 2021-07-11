//
//  File.swift
//  
//
//  Created by Ernest Babayan on 06.06.2021.
//

import UIKit


public struct BidirectionalDimensionAutoLayoutAnchors {
    var relationType: RelationType = .equal
    
    let target: AutoLayoutGuide
    
    var multiplier: CGFloat = 1
}

public protocol BidirectionalDimensionAutoLayoutAnchorsConvertible {
    func asBidirectionalDimensionAutoLayoutAnchors() -> BidirectionalDimensionAutoLayoutAnchors
}

extension BidirectionalDimensionAutoLayoutAnchors: BidirectionalDimensionAutoLayoutAnchorsConvertible {
    public func asBidirectionalDimensionAutoLayoutAnchors() -> BidirectionalDimensionAutoLayoutAnchors { self }
}
