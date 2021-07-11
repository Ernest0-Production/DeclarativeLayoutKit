//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public struct ConstantDimensionAutoLayoutAnchor {
    var relationType: RelationType = .equal
    
    let constant: CGFloat
}

public protocol ConstantDimensionAutoLayoutAnchorConvertible {
    func asConstantDimensionAutoLayoutAnchor() -> ConstantDimensionAutoLayoutAnchor
}

extension ConstantDimensionAutoLayoutAnchor: ConstantDimensionAutoLayoutAnchorConvertible {
    public func asConstantDimensionAutoLayoutAnchor() -> ConstantDimensionAutoLayoutAnchor { self }
}
