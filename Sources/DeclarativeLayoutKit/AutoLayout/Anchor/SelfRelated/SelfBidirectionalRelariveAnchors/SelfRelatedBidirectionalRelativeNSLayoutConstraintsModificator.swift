//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public typealias SelfRelatedBidirectionalRelativeNSLayoutConstraintsModificator<Guide: AutoLayoutGuide> = AfterBuildModificator<
    SelfRelatedBidirectionalRelativeAutoLayoutAnchors<Guide>,
    (first: NSLayoutConstraint, second: NSLayoutConstraint)
>

//public protocol SelfRelatedBidirectionalRelativeNSLayoutConstraintsModificatorConvertible {
//    associatedtype Guide: AutoLayoutGuide
//    
//    func asSelfRelatedBidirectionalRelativeNSLayoutConstraintsModificator() -> SelfRelatedBidirectionalRelativeNSLayoutConstraintsModificator<Guide>
//}
//
//extension AfterBuildModificator: SelfRelatedBidirectionalRelativeNSLayoutConstraintsModificatorConvertible where Model: AutoLayoutGuide {
//    public func asSelfRelatedBidirectionalRelativeNSLayoutConstraintsModificator() -> SelfRelatedBidirectionalRelativeNSLayoutConstraintsModificator<Model> {
//        self
//    }
//}

public extension AfterBuildModificator {
    func priority<Guide>(
        _ priority: UILayoutPriority
    ) -> SelfRelatedBidirectionalRelativeNSLayoutConstraintsModificator<Guide>
    where Model == SelfRelatedBidirectionalRelativeAutoLayoutAnchors<Guide>, Result == (first: NSLayoutConstraint, second: NSLayoutConstraint) {
        then({
            $0.first.priority = priority
            $0.second.priority = priority
        })
    }
}
