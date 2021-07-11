//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension AutoLayoutItemConvertible {
    func sizeAnchors(_ anchors: BidirectionalDimensionAutoLayoutAnchorsConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            let anchors = anchors.asBidirectionalDimensionAutoLayoutAnchors()
            
            makeDimensionConstraint(
                to: view.widthAnchor,
                with: anchors.toDimensionAnchor(anchorPath: \.widthAnchor)
            )
            
            makeDimensionConstraint(
                to: view.heightAnchor,
                with: anchors.toDimensionAnchor(anchorPath: \.heightAnchor)
            )
        })
    }
    
    func sizeAnchors(_ anchors: BidirectionalDimensionNSLayoutConstraintsModificator) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            anchors.build({ (anchors: BidirectionalDimensionAutoLayoutAnchors) in
                let anchors = anchors.asBidirectionalDimensionAutoLayoutAnchors()
                
                let widthAnchor = makeDimensionConstraint(
                    to: view.widthAnchor,
                    with: anchors.toDimensionAnchor(anchorPath: \.widthAnchor)
                )
                
                let heightAnchor = makeDimensionConstraint(
                    to: view.heightAnchor,
                    with: anchors.toDimensionAnchor(anchorPath: \.heightAnchor)
                )
                
                return (widthAnchor, heightAnchor)
            })
        })
    }
}

private extension BidirectionalDimensionAutoLayoutAnchors {
    func toDimensionAnchor(
        anchorPath: (AutoLayoutGuide) -> NSLayoutDimension
    ) -> DimensionAutoLayoutAnchor {
        DimensionAutoLayoutAnchor(
            relationType: relationType,
            target: anchorPath(target),
            multiplier: multiplier
        )
    }
}
