//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public typealias SelfRelatedDimensionAutoLayoutAnchor = SelfRelatedAutoLayoutAnchor<NSLayoutDimension, DimensionAutoLayoutAnchor>

public extension AutoLayoutItemConvertible {
    func heightAnchor(
        _ selfRelatedAnchor: SelfRelatedDimensionAutoLayoutAnchor
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeDimensionConstraint(
                to: view.heightAnchor,
                with: selfRelatedAnchor.create(from: DimensionAutoLayoutAnchor(
                    target: selfRelatedAnchor.targetPath(view)
                ))
            )
        })
    }
    
    func widthAnchor(
        _ selfRelatedAnchor: SelfRelatedDimensionAutoLayoutAnchor
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeDimensionConstraint(
                to: view.widthAnchor,
                with: selfRelatedAnchor.create(from: DimensionAutoLayoutAnchor(
                    target: selfRelatedAnchor.targetPath(view)
                ))
            )
        })
    }
}
