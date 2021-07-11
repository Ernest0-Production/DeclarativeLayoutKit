//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension AutoLayoutItemConvertible {
    func horizontalAnchors(_ constant: CGFloat) -> AutoLayoutItem {
        horizontalAnchors(.to(\.superview!))
    }
    
    func horizontalAnchors<Guide>(_ selfRelatedAnchors: SelfRelatedBidirectionalRelativeAutoLayoutAnchors<Guide>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            let anchors = selfRelatedAnchors.create(from: BidirectionalRelativeAutoLayoutAnchors(
                target: selfRelatedAnchors.targetPath(view)
            ))

            horizontalAnchors(anchors).activate()
        })
    }
    
    func directionalHorizontalAnchors(_ constant: CGFloat) -> AutoLayoutItem {
        directionalHorizontalAnchors(.to(\.superview!))
    }
    
    func directionalHorizontalAnchors<Guide>(_ selfRelatedAnchors: SelfRelatedBidirectionalRelativeAutoLayoutAnchors<Guide>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            let anchors = selfRelatedAnchors.create(from: BidirectionalRelativeAutoLayoutAnchors(
                target: selfRelatedAnchors.targetPath(view)
            ))

            directionalHorizontalAnchors(anchors).activate()
        })
    }
    
    func verticalAnchors(_ constant: CGFloat) -> AutoLayoutItem {
        verticalAnchors(.to(\.superview!))
    }
    
    func verticalAnchors<Guide>(_ selfRelatedAnchors: SelfRelatedBidirectionalRelativeAutoLayoutAnchors<Guide>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            let anchors = selfRelatedAnchors.create(from: BidirectionalRelativeAutoLayoutAnchors(
                target: selfRelatedAnchors.targetPath(view)
            ))

            verticalAnchors(anchors).activate()
        })
    }
}
//AfterBuildModificator<SelfRelatedAutoLayoutAnchor<UIView, BidirectionalRelativeAutoLayoutAnchors>, NSLayoutConstraint>'
// 'AfterBuildModificator<SelfRelatedAutoLayoutAnchor<UIView, BidirectionalRelativeAutoLayoutAnchors>, (width: NSLayoutConstraint, height: NSLayoutConstraint)>
//func example() {
////    let pa: SelfRelatedBidirectionalRelativeNSLayoutConstraintsModificator = 12.to(\UIView.superview!).priority(.almostRequired)
////    pa
//    
//    let qwe = UIView().horizontalAnchors(
//        12.to(\.superview!).priority(.almostRequired)
//    )
//}
