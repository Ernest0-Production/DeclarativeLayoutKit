//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension NSLayoutConstraintModificatorConvertible {
    func completion(_ listiner: @escaping (NSLayoutConstraint) -> Void) -> NSLayoutConstraintModificator<Model> {
        asNSLayoutConstraintModificator().then(listiner)
    }
    
    func identifier(_ identifier: String) -> NSLayoutConstraintModificator<Model> {
        asNSLayoutConstraintModificator().then({ $0.identifier = identifier })
    }
    
//    func priority(_ priority: UILayoutPriority) -> NSLayoutConstraintModificator<Model> {
//        asNSLayoutConstraintModificator().then({ $0.priority = priority })
//    }
    
    func deactivateAfterCreation() -> NSLayoutConstraintModificator<Model> {
        asNSLayoutConstraintModificator().then({ $0.isActive = false })
    }
}


public extension NSLayoutConstraintModificatorConvertible where Model == DimensionAutoLayoutAnchor {
    func plus(_ constant: CGFloat) -> NSLayoutConstraintModificator<Model> {
        asNSLayoutConstraintModificator().then({ $0.constant = constant })
    }
    
    func minus(_ constant: CGFloat) -> NSLayoutConstraintModificator<Model> {
        asNSLayoutConstraintModificator().then({ $0.constant = -constant })
    }
}
