//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension AutoLayoutItemConvertible {
    func sizeAnchors(_ anchor: ConstantDimensionAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            let anchor = anchor.asConstantDimensionAutoLayoutAnchor()
            
            makeConstantDimensionConstraint(
                to: view.widthAnchor,
                with: anchor
            )
            
            makeConstantDimensionConstraint(
                to: view.heightAnchor,
                with: anchor
            )
        })
    }
    
    func sizeAnchors(_ anchor: BidirectionalConstantDimensionNSLayoutConstraintModificator) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            anchor.build({ (anchor: ConstantDimensionAutoLayoutAnchor) in
                let widthAnchor = makeConstantDimensionConstraint(
                    to: view.widthAnchor,
                    with: anchor
                )
                
                let heightAnchor = makeConstantDimensionConstraint(
                    to: view.heightAnchor,
                    with: anchor
                )
                
                return (width: widthAnchor, height: heightAnchor)
            })
        })
    }
}
