//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


extension NSLayoutDimension: DimensionAutoLayoutAnchorConvertible {
    public func asDimensionAutoLayoutAnchor() -> DimensionAutoLayoutAnchor {
        DimensionAutoLayoutAnchor(
            relationType: .equal,
            priority: .almostRequired,
            target: DimensionAutoLayoutAnchor.Target(anchor: self, multiplier: 1),
            constant: .zero
        )
    }
}

extension NSLayoutXAxisAnchor: HorizontalRelativeAutoLayoutAnchorConvertible {
    public func asHorizontalRelativeAutoLayoutAnchor() -> HorizontalRelativeAutoLayoutAnchor {
        RelativeAutoLayoutAnchor(
            relationType: .equal,
            priority: .almostRequired,
            target: self,
            constant: .zero
        )
    }
}

extension NSLayoutYAxisAnchor: VerticalRelativeAutoLayoutAnchorConvertible {
    public func asVerticalRelativeAutoLayoutAnchor() -> VerticalRelativeAutoLayoutAnchor {
        RelativeAutoLayoutAnchor(
            relationType: .equal,
            priority: .almostRequired,
            target: self,
            constant: .zero
        )
    }
}

extension UIView: BidirectionRelativeAutoLayoutAnchorConvertible {
    public func asBidirectionalRelativeAutoLayoutAnchor() -> BidirectionRelativeAutoLayoutAnchor {
        BidirectionRelativeAutoLayoutAnchor(
            relationType: .equal,
            priority: .almostRequired,
            target: self,
            constant: .zero
        )
    }
}
