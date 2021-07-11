//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension AutoLayoutItemConvertible {
    func leftAnchor(_ secondAnchor: HorizontalRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.leftAnchor,
                with: secondAnchor.asHorizontalRelativeAutoLayoutAnchor()
            )
        })
    }
    
    func leadingAnchor(_ secondAnchor: HorizontalRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.leadingAnchor,
                with: secondAnchor.asHorizontalRelativeAutoLayoutAnchor()
            )
        })
    }
    
    func rightAnchor(_ secondAnchor: HorizontalRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.rightAnchor,
                with: secondAnchor.asHorizontalRelativeAutoLayoutAnchor()
            )
        })
    }
    
    func trailingAnchor(_ secondAnchor: HorizontalRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.trailingAnchor,
                with: secondAnchor.asHorizontalRelativeAutoLayoutAnchor()
            )
        })
    }
  
    func topAnchor(_ secondAnchor: VerticalRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.topAnchor,
                with: secondAnchor.asVerticalRelativeAutoLayoutAnchor()
            )
        })
    }
   
    func bottomAnchor(_ secondAnchor: VerticalRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.bottomAnchor,
                with: secondAnchor.asVerticalRelativeAutoLayoutAnchor()
            )
        })
    }
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
    
    constraint.constant = {
        var value = model.constant.value
        
        if model.constant.kind == .offset { value = -value }
        
        if constraint.secondAttribute.isOpposite { value = -value }
        
        return value
    }()
    
    constraint.isActive = true
    
    return constraint
}

private extension NSLayoutConstraint.Attribute {
    var isOpposite: Bool {
        switch self {
        case .bottom, .bottomMargin, .right, .rightMargin, .trailing, .trailingMargin, .lastBaseline:
            return true
        default:
            return false
        }
    }
}
