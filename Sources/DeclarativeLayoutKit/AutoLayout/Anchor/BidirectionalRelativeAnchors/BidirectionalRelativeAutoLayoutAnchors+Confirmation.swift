//
//  File.swift
//
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


extension UIView: BidirectionalRelativeAutoLayoutAnchorsConvertible {
    public func asBidirectionalRelativeAutoLayoutAnchors() -> BidirectionalRelativeAutoLayoutAnchors {
        BidirectionalRelativeAutoLayoutAnchors(target: self)
    }
}
