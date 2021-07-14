//
//  File.swift
//  
//
//  Created by Ernest Babayan on 13.07.2021.
//

import UIKit


// 123.to(view.leftAnchor)
public extension AutoLayoutConstant {
    func to<Axis>(_ secondAnchor: NSLayoutAnchor<Axis>) -> AfterBuildModificator<RelativeAutoLayoutAnchor<Axis>, NSLayoutConstraint> {
        AfterBuildModificator(
            model: RelativeAutoLayoutAnchor<Axis>(target: secondAnchor),
            modificator: Modificator { (constraint: NSLayoutConstraint) in
                constraint.setConstant(RelativeAutoLayoutConstant(
                    value: self.value,
                    kind: RelativeAutoLayoutConstant.Kind.inset
                ))
            }
        )
    }
    
    func from<Axis>(_ secondAnchor: NSLayoutAnchor<Axis>) -> AfterBuildModificator<RelativeAutoLayoutAnchor<Axis>, NSLayoutConstraint> {
        AfterBuildModificator(
            model: RelativeAutoLayoutAnchor<Axis>(target: secondAnchor),
            modificator: Modificator { (constraint: NSLayoutConstraint) in
                constraint.setConstant(RelativeAutoLayoutConstant(
                    value: self.value,
                    kind: RelativeAutoLayoutConstant.Kind.offset
                ))
            }
        )
    }
}
