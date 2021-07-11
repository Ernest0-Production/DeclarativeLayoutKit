//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension AutoLayoutItemConvertible {
    func heightAnchor(
        _ selfRelatedAnchor: NSLayoutConstraintModificator<SelfRelatedDimensionAutoLayoutAnchor>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            selfRelatedAnchor
                .build({ (secondAnchor: SelfRelatedDimensionAutoLayoutAnchor) in
                    makeDimensionConstraint(
                        to: view.heightAnchor,
                        with: secondAnchor.create(from: DimensionAutoLayoutAnchor(
                            target: secondAnchor.targetPath(view)
                        ))
                    )
                })
        })
    }
    
    func widthAnchor(
        _ selfRelatedAnchor: NSLayoutConstraintModificator<SelfRelatedDimensionAutoLayoutAnchor>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            selfRelatedAnchor
                .build({ (secondAnchor: SelfRelatedDimensionAutoLayoutAnchor) in
                    makeDimensionConstraint(
                        to: view.widthAnchor,
                        with: secondAnchor.create(from: DimensionAutoLayoutAnchor(
                            target: secondAnchor.targetPath(view)
                        ))
                    )
                })
        })
    }
}
