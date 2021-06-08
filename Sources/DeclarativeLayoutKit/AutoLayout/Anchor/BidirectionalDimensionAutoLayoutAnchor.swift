//
//  File.swift
//  
//
//  Created by Ernest Babayan on 06.06.2021.
//

import UIKit


public struct BidirectionalDimensionAutoLayoutAnchor {
    var relationType: RelationType
    
    var priority: UILayoutPriority
    
    struct Target {
        var layoutGuide: UILayoutGuide?
        var multiplier: CGFloat
        
        static var superview: Target {
            Target(layoutGuide: nil, multiplier: 1)
        }
    }
    
    var target: Target?
    
    var constant: CGFloat
}

public protocol BidirectionalDimensionAutoLayoutAnchorConvertible {
    func asBidirectionalDimensionAutoLayoutAnchor() -> BidirectionalDimensionAutoLayoutAnchor
}

extension BidirectionalDimensionAutoLayoutAnchor: BidirectionalDimensionAutoLayoutAnchorConvertible {
    public func asBidirectionalDimensionAutoLayoutAnchor() -> BidirectionalDimensionAutoLayoutAnchor { self }
}

public extension BidirectionalDimensionAutoLayoutAnchorConvertible {
    func multiplied(by multiplier: CGFloat) -> BidirectionalDimensionAutoLayoutAnchor {
        var copy = asBidirectionalDimensionAutoLayoutAnchor()
        
        assert(
            copy.target != nil,
            "Multiplier applied ONLY to target anchor attribute"
        )
        
        copy.target?.multiplier = multiplier
        
        return copy
    }
    
    func plus(_ constant: CGFloat) -> BidirectionalDimensionAutoLayoutAnchor {
        var copy = asBidirectionalDimensionAutoLayoutAnchor()
        
        copy.constant = constant
        
        return copy
    }
}
