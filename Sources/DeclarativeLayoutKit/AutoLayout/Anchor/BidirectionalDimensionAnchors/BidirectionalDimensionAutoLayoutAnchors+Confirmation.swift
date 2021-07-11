//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


extension UIView: BidirectionalDimensionAutoLayoutAnchorsConvertible {
    public func asBidirectionalDimensionAutoLayoutAnchors() -> BidirectionalDimensionAutoLayoutAnchors {
        BidirectionalDimensionAutoLayoutAnchors(target: self)
    }
}
