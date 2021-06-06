//
//  File.swift
//  
//
//  Created by Ernest Babayan on 06.06.2021.
//

import UIKit


public struct BidirectionRelativeAutoLayoutAnchor {
    var relationType: RelationType
    
    var priority: UILayoutPriority
    
    var target: AutoLauoutGuide?
    
    typealias Constant = RelativeAutoLayoutConstant
    
    var constant: Constant
}

public protocol BidirectionRelativeAutoLayoutAnchorConvertible {
    func asBidirectionalRelativeAutoLayoutAnchor() -> BidirectionRelativeAutoLayoutAnchor
}

extension BidirectionRelativeAutoLayoutAnchor: BidirectionRelativeAutoLayoutAnchorConvertible {
    public func asBidirectionalRelativeAutoLayoutAnchor() -> BidirectionRelativeAutoLayoutAnchor { self }
}
