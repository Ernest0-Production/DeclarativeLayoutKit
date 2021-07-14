//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension AutoLayoutItemConvertible {
    /// firstView.leftAnchor(secondView.rightAnchor.orLess)
    func leftAnchor(_ secondAnchor: HorizontalRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.leftAnchor,
                with: secondAnchor.asHorizontalRelativeAutoLayoutAnchor()
            )
        })
    }
    
    /// firstView.leadingAnchor(secondView.leadingAnchor.orLess)
    func leadingAnchor(_ secondAnchor: HorizontalRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.leadingAnchor,
                with: secondAnchor.asHorizontalRelativeAutoLayoutAnchor()
            )
        })
    }
    
    /// firstView.rightAnchor(secondView.rightAnchor.orLess)
    func rightAnchor(_ secondAnchor: HorizontalRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.rightAnchor,
                with: secondAnchor.asHorizontalRelativeAutoLayoutAnchor()
            )
        })
    }
    
    /// firstView.trailingAnchor(secondView.trailingAnchor.orLess)
    func trailingAnchor(_ secondAnchor: HorizontalRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.trailingAnchor,
                with: secondAnchor.asHorizontalRelativeAutoLayoutAnchor()
            )
        })
    }
  
    /// firstView.topAnchor(secondView.topAnchor.orLess)
    func topAnchor(_ secondAnchor: VerticalRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.topAnchor,
                with: secondAnchor.asVerticalRelativeAutoLayoutAnchor()
            )
        })
    }
   
    /// firstView.bottomAnchor(secondView.bottomAnchor.orLess)
    func bottomAnchor(_ secondAnchor: VerticalRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.bottomAnchor,
                with: secondAnchor.asVerticalRelativeAutoLayoutAnchor()
            )
        })
    }
}
