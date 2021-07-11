//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension AutoLayoutItemConvertible {
    func heightAnchor<Modificator: NSLayoutConstraintModificatorConvertible>(
        _ secondAnchor: Modificator
    ) -> AutoLayoutItem
    where Modificator.Model == DimensionAutoLayoutAnchor {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchor
                .asNSLayoutConstraintModificator()
                .build({ (secondAnchor: DimensionAutoLayoutAnchor) in
                    makeDimensionConstraint(to: view.heightAnchor, with: secondAnchor)
                })
        })
    }
    
    func widthAnchor<Modificator: NSLayoutConstraintModificatorConvertible>(
        _ secondAnchor: Modificator
    ) -> AutoLayoutItem
    where Modificator.Model == DimensionAutoLayoutAnchor {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchor
                .asNSLayoutConstraintModificator()
                .build({ (secondAnchor: DimensionAutoLayoutAnchor) in
                    makeDimensionConstraint(to: view.widthAnchor, with: secondAnchor)
                })
        })
    }
}
