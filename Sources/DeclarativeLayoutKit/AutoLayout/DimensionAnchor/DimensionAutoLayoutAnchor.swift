//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


public struct DimensionAutoLayoutAnchor {
    var relationType: RelationType = .equal
    
    let target: NSLayoutDimension
    
    var multiplier: CGFloat = 1
}

public protocol DimensionAutoLayoutAnchorConvertible {
    func asDimensionAutoLayoutAnchor() -> DimensionAutoLayoutAnchor
}

extension DimensionAutoLayoutAnchor: DimensionAutoLayoutAnchorConvertible {
    public func asDimensionAutoLayoutAnchor() -> DimensionAutoLayoutAnchor { self }
}
