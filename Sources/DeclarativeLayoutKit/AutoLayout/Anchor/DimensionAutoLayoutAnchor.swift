//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


public struct DimensionAutoLayoutAnchor {
    var relationType: RelationType
    
    var priority: UILayoutPriority
    
    var target: Target?
    
    struct Target {
        var anchor: NSLayoutDimension?
        var multiplier: CGFloat
        
        static var superview: Target {
            Target(anchor: nil, multiplier: 1)
        }
    }
    
    var constant: CGFloat
}

public protocol DimensionAutoLayoutAnchorConvertible {
    func asDimensionAutoLayoutAnchor() -> DimensionAutoLayoutAnchor
}

extension DimensionAutoLayoutAnchor: DimensionAutoLayoutAnchorConvertible {
    public func asDimensionAutoLayoutAnchor() -> DimensionAutoLayoutAnchor { self }
}

public extension DimensionAutoLayoutAnchorConvertible {
    func multiplied(by multiplier: CGFloat) -> DimensionAutoLayoutAnchor {
        var copy = asDimensionAutoLayoutAnchor()
        
        assert(
            copy.target != nil,
            "Multiplier applied ONLY to target anchor attribute"
        )
        
        copy.target?.multiplier = multiplier
        
        return copy
    }
    
    func plus(_ constant: CGFloat) -> DimensionAutoLayoutAnchor {
        var copy = asDimensionAutoLayoutAnchor()
        
        copy.constant = constant
        
        return copy
    }
}
