//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


public struct RelativeAutoLayoutAnchor<Axis: AnyObject> {
    var relationType: RelationType = .equal
    
    let target: NSLayoutAnchor<Axis>
}

@discardableResult
func makeRelativeConstraint<Axis>(
    to firstAnchor: NSLayoutAnchor<Axis>,
    with model: RelativeAutoLayoutAnchor<Axis>
) -> NSLayoutConstraint {
    let constraint: NSLayoutConstraint

    switch model.relationType {
    case .equal:
        constraint = firstAnchor.constraint(equalTo: model.target)
    case .greater:
        constraint = firstAnchor.constraint(greaterThanOrEqualTo: model.target)
    case .less:
        constraint = firstAnchor.constraint(lessThanOrEqualTo: model.target)
    }

    constraint.isActive = true

    return constraint
}
