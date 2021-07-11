//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public typealias SelfRelatedRelativeAutoLayoutAnchor<Axis: AnyObject> = SelfRelatedAutoLayoutAnchor<Axis, RelativeAutoLayoutAnchor<Axis>>


public extension AutoLayoutItemConvertible {
    func leftAnchor(_ constant: CGFloat) -> AutoLayoutItem {
        leftAnchor(.to(\.superview!.leftAnchor))
    }
    
    func leftAnchor(
        _ selfRelatedAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.leftAnchor,
                with: selfRelatedAnchor.create(from: HorizontalRelativeAutoLayoutAnchor(
                    target: selfRelatedAnchor.targetPath(view)
                ))
            )
        })
    }
    
    func leadingAnchor(_ constant: CGFloat) -> AutoLayoutItem {
        leftAnchor(.to(\.superview!.leadingAnchor))
    }
    
    func leadingAnchor(
        _ selfRelatedAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.leadingAnchor,
                with: selfRelatedAnchor.create(from: HorizontalRelativeAutoLayoutAnchor(
                    target: selfRelatedAnchor.targetPath(view)
                ))
            )
        })
    }

    func rightAnchor(_ constant: CGFloat) -> AutoLayoutItem {
        rightAnchor(.to(\.superview!.rightAnchor))
    }
    
    func rightAnchor(
        _ selfRelatedAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.rightAnchor,
                with: selfRelatedAnchor.create(from: HorizontalRelativeAutoLayoutAnchor(
                    target: selfRelatedAnchor.targetPath(view)
                ))
            )
        })
    }
    
    func trailingAnchor(_ constant: CGFloat) -> AutoLayoutItem {
        trailingAnchor(.to(\.superview!.trailingAnchor))
    }
    
    func trailingAnchor(
        _ selfRelatedAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.trailingAnchor,
                with: selfRelatedAnchor.create(from: HorizontalRelativeAutoLayoutAnchor(
                    target: selfRelatedAnchor.targetPath(view)
                ))
            )
        })
    }
    
    func topAnchor(_ constant: CGFloat) -> AutoLayoutItem {
        topAnchor(.to(\.superview!.topAnchor))
    }
    
    func topAnchor(
        _ selfRelatedAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutYAxisAnchor>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.topAnchor,
                with: selfRelatedAnchor.create(from: VerticalRelativeAutoLayoutAnchor(
                    target: selfRelatedAnchor.targetPath(view)
                ))
            )
        })
    }
    
    func bottomAnchor(_ constant: CGFloat) -> AutoLayoutItem {
        bottomAnchor(.to(\.superview!.bottomAnchor))
    }
    
    func bottomAnchor(
        _ selfRelatedAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutYAxisAnchor>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.topAnchor,
                with: selfRelatedAnchor.create(from: VerticalRelativeAutoLayoutAnchor(
                    target: selfRelatedAnchor.targetPath(view)
                ))
            )
        })
    }
}
