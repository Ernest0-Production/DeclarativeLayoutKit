//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension AutoLayoutItemConvertible {
    func verticalAnchors(_ anchors: BidirectionalRelativeAutoLayoutAnchorsConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            let anchors = anchors.asBidirectionalRelativeAutoLayoutAnchors()
            
            makeRelativeConstraint(
                to: view.topAnchor,
                with: anchors.toRelativeAnchor(anchorPath: { $0.topAnchor })
            )
            
            makeRelativeConstraint(
                to: view.bottomAnchor,
                with: anchors.toRelativeAnchor(anchorPath: { $0.bottomAnchor })
            )
        })
    }
  
    func verticalAnchors(_ anchors: BidirectionalRelativeNSLayoutConstraintsModificator) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            anchors.build({ (anchors: BidirectionalRelativeAutoLayoutAnchors) in
                let topAnchor = makeRelativeConstraint(
                    to: view.topAnchor,
                    with: anchors.toRelativeAnchor(anchorPath: { $0.topAnchor })
                )
                
                let bototmAnchor = makeRelativeConstraint(
                    to: view.bottomAnchor,
                    with: anchors.toRelativeAnchor(anchorPath: { $0.bottomAnchor })
                )
                
                return (topAnchor, bototmAnchor)
            })
        })
    }
    
    func horizontalAnchors(_ anchors: BidirectionalRelativeAutoLayoutAnchorsConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            let anchors = anchors.asBidirectionalRelativeAutoLayoutAnchors()
            
            makeRelativeConstraint(
                to: view.leftAnchor,
                with: anchors.toRelativeAnchor(anchorPath: { $0.leftAnchor })
            )
            
            makeRelativeConstraint(
                to: view.rightAnchor,
                with: anchors.toRelativeAnchor(anchorPath: { $0.rightAnchor })
            )
        })
    }
    
    func directionalHorizontalAnchors(_ anchors: BidirectionalRelativeAutoLayoutAnchorsConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            let anchors = anchors.asBidirectionalRelativeAutoLayoutAnchors()
            
            makeRelativeConstraint(
                to: view.leadingAnchor,
                with: anchors.toRelativeAnchor(anchorPath: { $0.leadingAnchor })
            )
            
            makeRelativeConstraint(
                to: view.trailingAnchor,
                with: anchors.toRelativeAnchor(anchorPath: { $0.trailingAnchor })
            )
        })
    }
    
    func horizontalAnchors(_ anchors: BidirectionalRelativeNSLayoutConstraintsModificator) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            anchors.build({ (anchors: BidirectionalRelativeAutoLayoutAnchors) in
                let leftAnchor = makeRelativeConstraint(
                    to: view.leftAnchor,
                    with: anchors.toRelativeAnchor(anchorPath: { $0.leftAnchor })
                )
                
                let rightAnchor = makeRelativeConstraint(
                    to: view.rightAnchor,
                    with: anchors.toRelativeAnchor(anchorPath: { $0.rightAnchor })
                )
                
                return (leftAnchor, rightAnchor)
            })
        })
    }
    
    func directionalHorizontalAnchors(_ anchors: BidirectionalRelativeNSLayoutConstraintsModificator) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            anchors.build({ (anchors: BidirectionalRelativeAutoLayoutAnchors) in
                let leadingAnchor = makeRelativeConstraint(
                    to: view.leadingAnchor,
                    with: anchors.toRelativeAnchor(anchorPath: { $0.leadingAnchor })
                )
                
                let trailingAnchor = makeRelativeConstraint(
                    to: view.trailingAnchor,
                    with: anchors.toRelativeAnchor(anchorPath: { $0.trailingAnchor })
                )
                
                return (leadingAnchor, trailingAnchor)
            })
        })
    }
}


extension BidirectionalRelativeAutoLayoutAnchors {
    func toRelativeAnchor<Axis>(
        anchorPath: (AutoLayoutGuide) -> NSLayoutAnchor<Axis>
    ) -> RelativeAutoLayoutAnchor<Axis> {
        RelativeAutoLayoutAnchor(
            relationType: relationType,
            target: anchorPath(target),
            constant: constant
        )
    }
}
