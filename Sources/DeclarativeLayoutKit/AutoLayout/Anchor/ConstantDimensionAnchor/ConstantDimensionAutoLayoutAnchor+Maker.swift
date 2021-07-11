//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension AutoLayoutItemConvertible {
    func widthAnchor(_ secondAnchor: ConstantDimensionAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeConstantDimensionConstraint(
                to: view.widthAnchor,
                with: secondAnchor.asConstantDimensionAutoLayoutAnchor()
            )
        })
    }
    
    func heightAnchor(_ secondAnchor: ConstantDimensionAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeConstantDimensionConstraint(
                to: view.heightAnchor,
                with: secondAnchor.asConstantDimensionAutoLayoutAnchor()
            )
        })
    }
}

@discardableResult
func makeConstantDimensionConstraint(
    to firstAnchor: NSLayoutDimension,
    with model: ConstantDimensionAutoLayoutAnchor
) -> NSLayoutConstraint {
    let constraint: NSLayoutConstraint
    
    switch model.relationType {
    case .equal:
        constraint = firstAnchor.constraint(equalToConstant: model.constant)
    case .greater:
        constraint = firstAnchor.constraint(greaterThanOrEqualToConstant: model.constant)
    case .less:
        constraint = firstAnchor.constraint(lessThanOrEqualToConstant: model.constant)
    }
    
    constraint.isActive = true
    
    return constraint
}
