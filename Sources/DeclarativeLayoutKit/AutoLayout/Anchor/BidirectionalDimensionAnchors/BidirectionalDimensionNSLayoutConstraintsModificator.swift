//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public typealias BidirectionalDimensionNSLayoutConstraintsModificator = AfterBuildModificator<
    BidirectionalDimensionAutoLayoutAnchors,
    (width: NSLayoutConstraint, height: NSLayoutConstraint)
>

public protocol BidirectionalDimensionNSLayoutConstraintsModificatorConvertible {
    func asBidirectionalDimensionNSLayoutConstraintsModificator() -> BidirectionalDimensionNSLayoutConstraintsModificator
}

extension BidirectionalDimensionNSLayoutConstraintsModificator: BidirectionalDimensionNSLayoutConstraintsModificatorConvertible {
    public func asBidirectionalDimensionNSLayoutConstraintsModificator() -> BidirectionalDimensionNSLayoutConstraintsModificator { self }
}

extension BidirectionalDimensionAutoLayoutAnchors: BidirectionalDimensionNSLayoutConstraintsModificatorConvertible {
    public func asBidirectionalDimensionNSLayoutConstraintsModificator() -> BidirectionalDimensionNSLayoutConstraintsModificator {
        BidirectionalDimensionNSLayoutConstraintsModificator(model: self)
    }
}

extension UIView: BidirectionalDimensionNSLayoutConstraintsModificatorConvertible {
    public func asBidirectionalDimensionNSLayoutConstraintsModificator() -> BidirectionalDimensionNSLayoutConstraintsModificator {
        BidirectionalDimensionNSLayoutConstraintsModificator(model: BidirectionalDimensionAutoLayoutAnchors(target: self))
    }
}

public extension BidirectionalDimensionNSLayoutConstraintsModificatorConvertible {
    func priority(_ priority: UILayoutPriority) -> BidirectionalDimensionNSLayoutConstraintsModificator {
        asBidirectionalDimensionNSLayoutConstraintsModificator().then({
            $0.width.priority = priority
            $0.height.priority = priority
        })
    }
    
    func plus(_ constant: CGFloat) -> BidirectionalDimensionNSLayoutConstraintsModificator {
        asBidirectionalDimensionNSLayoutConstraintsModificator().then({
            $0.width.constant = constant
            $0.height.constant = constant
        })
    }
    
    func minus(_ constant: CGFloat) -> BidirectionalDimensionNSLayoutConstraintsModificator {
        asBidirectionalDimensionNSLayoutConstraintsModificator().then({
            $0.width.constant = -constant
            $0.height.constant = -constant
        })
    }
}
