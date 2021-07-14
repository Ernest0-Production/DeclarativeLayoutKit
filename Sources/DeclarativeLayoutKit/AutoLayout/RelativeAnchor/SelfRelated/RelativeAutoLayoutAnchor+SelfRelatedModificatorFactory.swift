//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


/// 123.to(\.superview!.leftAnchor)
public extension AutoLayoutConstant {
    func to<Axis>(
        _ target: @escaping SelfRelatedAutoLayoutAnchor<Axis, RelativeAutoLayoutAnchor<Axis>>.TargetPath
    ) -> AfterBuildModificator<SelfRelatedAutoLayoutAnchor<Axis, RelativeAutoLayoutAnchor<Axis>>, NSLayoutConstraint> {
        AfterBuildModificator<SelfRelatedAutoLayoutAnchor<Axis, RelativeAutoLayoutAnchor<Axis>>, NSLayoutConstraint>(
            model: SelfRelatedAutoLayoutAnchor<Axis, RelativeAutoLayoutAnchor<Axis>>.to(target),
            modificator: Modificator { (constraint: NSLayoutConstraint) in
                constraint.setConstant(RelativeAutoLayoutConstant(
                    value: self.value,
                    kind: RelativeAutoLayoutConstant.Kind.inset
                ))
            }
        )
    }
    
    func from<Axis>(
        _ target: @escaping SelfRelatedAutoLayoutAnchor<Axis, RelativeAutoLayoutAnchor<Axis>>.TargetPath
    ) -> AfterBuildModificator<SelfRelatedAutoLayoutAnchor<Axis, RelativeAutoLayoutAnchor<Axis>>, NSLayoutConstraint> {
        AfterBuildModificator<SelfRelatedAutoLayoutAnchor<Axis, RelativeAutoLayoutAnchor<Axis>>, NSLayoutConstraint>(
            model: SelfRelatedAutoLayoutAnchor<Axis, RelativeAutoLayoutAnchor<Axis>>.to(target),
            modificator: Modificator { (constraint: NSLayoutConstraint) in
                constraint.setConstant(RelativeAutoLayoutConstant(
                    value: self.value,
                    kind: RelativeAutoLayoutConstant.Kind.offset
                ))
            }
        )
    }
}
