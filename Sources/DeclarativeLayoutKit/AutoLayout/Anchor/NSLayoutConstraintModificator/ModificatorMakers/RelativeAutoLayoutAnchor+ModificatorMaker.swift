//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension AutoLayoutItemConvertible {
    func leftAnchor<Modificator: NSLayoutConstraintModificatorConvertible>(
        _ secondAnchor: Modificator
    ) -> AutoLayoutItem
    where Modificator.Model == HorizontalRelativeAutoLayoutAnchor {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchor
                .asNSLayoutConstraintModificator()
                .build({ (secondAnchor: HorizontalRelativeAutoLayoutAnchor) in
                    makeRelativeConstraint(to: view.leftAnchor, with: secondAnchor)
                })
        })
    }

    func leadingAnchor<Modificator: NSLayoutConstraintModificatorConvertible>(
        _ secondAnchor: Modificator
    ) -> AutoLayoutItem
    where Modificator.Model == HorizontalRelativeAutoLayoutAnchor {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchor
                .asNSLayoutConstraintModificator()
                .build({ (secondAnchor: HorizontalRelativeAutoLayoutAnchor) in
                    makeRelativeConstraint(to: view.leadingAnchor, with: secondAnchor)
                })
        })
    }

    func rightAnchor<Modificator: NSLayoutConstraintModificatorConvertible>(
        _ secondAnchor: Modificator
    ) -> AutoLayoutItem
    where Modificator.Model == HorizontalRelativeAutoLayoutAnchor {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchor
                .asNSLayoutConstraintModificator()
                .build({ (secondAnchor: HorizontalRelativeAutoLayoutAnchor) in
                    makeRelativeConstraint(to: view.rightAnchor, with: secondAnchor)
                })
        })
    }

    func trailingAnchor<Modificator: NSLayoutConstraintModificatorConvertible>(
        _ secondAnchor: Modificator
    ) -> AutoLayoutItem
    where Modificator.Model == HorizontalRelativeAutoLayoutAnchor {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchor
                .asNSLayoutConstraintModificator()
                .build({ (secondAnchor: HorizontalRelativeAutoLayoutAnchor) in
                    makeRelativeConstraint(to: view.trailingAnchor, with: secondAnchor)
                })
        })
    }
    
    func topAnchor<Modificator: NSLayoutConstraintModificatorConvertible>(
        _ secondAnchor: Modificator
    ) -> AutoLayoutItem
    where Modificator.Model == VerticalRelativeAutoLayoutAnchor {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchor
                .asNSLayoutConstraintModificator()
                .build({ (secondAnchor: VerticalRelativeAutoLayoutAnchor) in
                    makeRelativeConstraint(to: view.topAnchor, with: secondAnchor)
                })
        })
    }
    
    func bottomAnchor<Modificator: NSLayoutConstraintModificatorConvertible>(
        _ secondAnchor: Modificator
    ) -> AutoLayoutItem
    where Modificator.Model == VerticalRelativeAutoLayoutAnchor {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchor
                .asNSLayoutConstraintModificator()
                .build({ (secondAnchor: VerticalRelativeAutoLayoutAnchor) in
                    makeRelativeConstraint(to: view.bottomAnchor, with: secondAnchor)
                })
        })
    }
}
