//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension AutoLayoutItemConvertible {
    func widthAnchor<Modificator: NSLayoutConstraintModificatorConvertible>(
        _ secondAnchor: Modificator
    ) -> AutoLayoutItem
    where Modificator.Model == ConstantDimensionAutoLayoutAnchor {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchor
                .asNSLayoutConstraintModificator()
                .build({ (secondAnchor: ConstantDimensionAutoLayoutAnchor) in
                    makeConstantDimensionConstraint(to: view.widthAnchor, with: secondAnchor)
                })
        })
    }
    
    func heightAnchor<Modificator: NSLayoutConstraintModificatorConvertible>(
        _ secondAnchor: Modificator
    ) -> AutoLayoutItem
    where Modificator.Model == ConstantDimensionAutoLayoutAnchor {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchor
                .asNSLayoutConstraintModificator()
                .build({ (secondAnchor: ConstantDimensionAutoLayoutAnchor) in
                    makeConstantDimensionConstraint(to: view.heightAnchor, with: secondAnchor)
                })
        })
    }
}
