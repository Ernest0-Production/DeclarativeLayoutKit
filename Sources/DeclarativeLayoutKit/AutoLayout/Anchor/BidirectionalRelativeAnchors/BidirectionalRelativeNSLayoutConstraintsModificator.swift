//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


//public typealias BidirectionalRelativeNSLayoutConstraintsModificator = AfterBuildModificator<
//    BidirectionalRelativeAutoLayoutAnchors,
//    (first: NSLayoutConstraint, second: NSLayoutConstraint)
//>
//
//public protocol BidirectionalRelativeNSLayoutConstraintsModificatorConvertible {
//    func asBidirectionalRelativeNSLayoutConstraintsModificator() -> BidirectionalRelativeNSLayoutConstraintsModificator
//}
//
//extension BidirectionalRelativeNSLayoutConstraintsModificator: BidirectionalRelativeNSLayoutConstraintsModificatorConvertible {
//    public func asBidirectionalRelativeNSLayoutConstraintsModificator() -> BidirectionalRelativeNSLayoutConstraintsModificator { self }
//}
//
//extension BidirectionalRelativeAutoLayoutAnchors: BidirectionalRelativeNSLayoutConstraintsModificatorConvertible {
//    public func asBidirectionalRelativeNSLayoutConstraintsModificator() -> BidirectionalRelativeNSLayoutConstraintsModificator {
//        BidirectionalRelativeNSLayoutConstraintsModificator(model: self)
//    }
//}
//
//extension UIView: BidirectionalRelativeNSLayoutConstraintsModificatorConvertible {
//    public func asBidirectionalRelativeNSLayoutConstraintsModificator() -> BidirectionalRelativeNSLayoutConstraintsModificator {
//        BidirectionalRelativeNSLayoutConstraintsModificator(model: BidirectionalRelativeAutoLayoutAnchors(target: self))
//    }
//}
//
//public extension BidirectionalRelativeNSLayoutConstraintsModificatorConvertible {
//    func priority(_ priority: UILayoutPriority) -> BidirectionalRelativeNSLayoutConstraintsModificator {
//        asBidirectionalRelativeNSLayoutConstraintsModificator().then({
//            $0.first.priority = priority
//            $0.second.priority = priority
//        })
//    }
//}
