//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension AutoLayoutItemConvertible {
    func widthAnchor(_ secondAnchor: DimensionAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeDimensionConstraint(
                to: view.widthAnchor,
                with: secondAnchor.asDimensionAutoLayoutAnchor()
            )
        })
    }
    
    func heightAnchor(_ secondAnchor: DimensionAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeDimensionConstraint(
                to: view.heightAnchor,
                with: secondAnchor.asDimensionAutoLayoutAnchor()
            )
        })
    }
}

@discardableResult
func makeDimensionConstraint(
    to firstAnchor: NSLayoutDimension,
    with model: DimensionAutoLayoutAnchor
) -> NSLayoutConstraint {
    let constraint: NSLayoutConstraint
    
    switch model.relationType {
    case .equal:
        constraint = firstAnchor.constraint(equalTo: model.target, multiplier: model.multiplier)
    case .greater:
        constraint = firstAnchor.constraint(greaterThanOrEqualTo: model.target, multiplier: model.multiplier)
    case .less:
        constraint = firstAnchor.constraint(lessThanOrEqualTo: model.target, multiplier: model.multiplier)
    }
    
    constraint.isActive = true
    
    return constraint
}
