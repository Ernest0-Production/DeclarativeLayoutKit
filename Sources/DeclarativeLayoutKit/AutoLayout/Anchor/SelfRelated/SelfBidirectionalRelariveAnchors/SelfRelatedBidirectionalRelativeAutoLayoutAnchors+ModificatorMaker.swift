//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension AutoLayoutItemConvertible {
    func verticalAnchors<Guide>(
        _ selfRelatedAnchors: SelfRelatedBidirectionalRelativeNSLayoutConstraintsModificator<Guide>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            selfRelatedAnchors.build({ (selfRelatedAnchors: SelfRelatedBidirectionalRelativeAutoLayoutAnchors<Guide>) in
                let anchos = selfRelatedAnchors.create(from: BidirectionalRelativeAutoLayoutAnchors(target: view))
                
                let leftAnchor = makeRelativeConstraint(
                    to: view.topAnchor,
                    with: anchos.toRelativeAnchor(anchorPath: { $0.topAnchor })
                )
                
                let rightAnchor = makeRelativeConstraint(
                    to: view.bottomAnchor,
                    with: anchos.toRelativeAnchor(anchorPath: { $0.bottomAnchor })
                )
                
                return (leftAnchor, rightAnchor)
            })
        })
    }
    
    func horizontalAnchors<Guide>(
        _ selfRelatedAnchors: SelfRelatedBidirectionalRelativeNSLayoutConstraintsModificator<Guide>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            selfRelatedAnchors.build({ (selfRelatedAnchors: SelfRelatedBidirectionalRelativeAutoLayoutAnchors<Guide>) in
                let anchos = selfRelatedAnchors.create(from: BidirectionalRelativeAutoLayoutAnchors(target: view))
                
                let leftAnchor = makeRelativeConstraint(
                    to: view.leftAnchor,
                    with: anchos.toRelativeAnchor(anchorPath: { $0.leftAnchor })
                )
                
                let rightAnchor = makeRelativeConstraint(
                    to: view.rightAnchor,
                    with: anchos.toRelativeAnchor(anchorPath: { $0.rightAnchor })
                )
                
                return (leftAnchor, rightAnchor)
            })
        })
    }
    
    func directionalHorizontalAnchors<Guide>(
        _ selfRelatedAnchors: SelfRelatedBidirectionalRelativeNSLayoutConstraintsModificator<Guide>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            selfRelatedAnchors.build({ (selfRelatedAnchors: SelfRelatedBidirectionalRelativeAutoLayoutAnchors<Guide>) in
                let anchos = selfRelatedAnchors.create(from: BidirectionalRelativeAutoLayoutAnchors(target: view))
                
                let leftAnchor = makeRelativeConstraint(
                    to: view.leadingAnchor,
                    with: anchos.toRelativeAnchor(anchorPath: { $0.leadingAnchor })
                )
                
                let rightAnchor = makeRelativeConstraint(
                    to: view.trailingAnchor,
                    with: anchos.toRelativeAnchor(anchorPath: { $0.trailingAnchor })
                )
                
                return (leftAnchor, rightAnchor)
            })
        })
    }
}
