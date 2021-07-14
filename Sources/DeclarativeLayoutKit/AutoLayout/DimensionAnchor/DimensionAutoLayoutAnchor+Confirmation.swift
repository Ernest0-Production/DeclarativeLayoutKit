//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


extension NSLayoutDimension: DimensionAutoLayoutAnchorConvertible {
    public func asDimensionAutoLayoutAnchor() -> DimensionAutoLayoutAnchor {
        DimensionAutoLayoutAnchor(target: self)
    }
}
