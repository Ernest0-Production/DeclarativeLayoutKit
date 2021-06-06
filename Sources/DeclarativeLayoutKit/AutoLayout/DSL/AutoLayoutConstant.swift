//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


protocol AutoLayoutConstant: DimensionAutoLayoutAnchorConvertible,
                             HorizontalRelativeAutoLayoutAnchorConvertible,
                             VerticalRelativeAutoLayoutAnchorConvertible,
                             BidirectionRelativeAutoLayoutAnchorConvertible,
                             BidirectionalDimensionAutoLayoutAnchorConvertible {
    var value: CGFloat { get }
}

extension AutoLayoutConstant {
    public func asDimensionAutoLayoutAnchor() -> DimensionAutoLayoutAnchor {
        DimensionAutoLayoutAnchor(
            relationType: .equal,
            priority: .almostRequired,
            target: nil,
            constant: value
        )
    }
    
    public func asHorizontalRelativeAutoLayoutAnchor() -> HorizontalRelativeAutoLayoutAnchor {
        HorizontalRelativeAutoLayoutAnchor(
            relationType: .equal,
            priority: .almostRequired,
            target: nil,
            constant: .init(value: value, kind: .inset)
        )
    }
    
    public func asVerticalRelativeAutoLayoutAnchor() -> VerticalRelativeAutoLayoutAnchor {
        VerticalRelativeAutoLayoutAnchor(
            relationType: .equal,
            priority: .almostRequired,
            target: nil,
            constant: .init(value: value, kind: .inset)
        )
    }
    
    public func asBidirectionalRelativeAutoLayoutAnchor() -> BidirectionRelativeAutoLayoutAnchor {
        BidirectionRelativeAutoLayoutAnchor(
            relationType: .equal,
            priority: .almostRequired,
            target: nil,
            constant: .init(value: value, kind: .inset)
        )
    }
    
    public func asBidirectionalDimensionAutoLayoutAnchor() -> BidirectionalDimensionAutoLayoutAnchor {
        BidirectionalDimensionAutoLayoutAnchor(
            relationType: .equal,
            priority: .almostRequired,
            target: nil,
            constant: value
        )
    }
}

extension Int: AutoLayoutConstant {
    public var value: CGFloat { CGFloat(self) }
}

extension Float: AutoLayoutConstant {
    public var value: CGFloat { CGFloat(self) }
}

extension Double: AutoLayoutConstant {
    public var value: CGFloat { CGFloat(self) }
}

extension CGFloat: AutoLayoutConstant {
    public var value: CGFloat { CGFloat(self) }
}
