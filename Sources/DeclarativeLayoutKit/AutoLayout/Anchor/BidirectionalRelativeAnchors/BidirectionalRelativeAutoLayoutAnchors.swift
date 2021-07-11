//
//  File.swift
//  
//
//  Created by Ernest Babayan on 06.06.2021.
//

import UIKit


public struct BidirectionalRelativeAutoLayoutAnchors {
    var relationType: RelationType = .equal
    
    let target: AutoLayoutGuide
    
    typealias Constant = RelativeAutoLayoutConstant
    
    var constant: Constant = .zero
}

public protocol BidirectionalRelativeAutoLayoutAnchorsConvertible {
    func asBidirectionalRelativeAutoLayoutAnchors() -> BidirectionalRelativeAutoLayoutAnchors
}

extension BidirectionalRelativeAutoLayoutAnchors: BidirectionalRelativeAutoLayoutAnchorsConvertible {
    public func asBidirectionalRelativeAutoLayoutAnchors() -> BidirectionalRelativeAutoLayoutAnchors { self }
}
