//
//  File.swift
//  
//
//  Created by Ernest Babayan on 14.07.2021.
//

import UIKit


public extension AutoLayoutConstant {
    func to<Anchor>(_ secondAnchor: Anchor) -> AfterBuildModificator<Anchor, NSLayoutConstraint> {
        AfterBuildModificator(
            model: secondAnchor,
            modificator: Modificator { (constraint: NSLayoutConstraint) in
                constraint.setConstant(RelativeAutoLayoutConstant(
                    value: self.value,
                    kind: RelativeAutoLayoutConstant.Kind.inset
                ))
            }
        )
    }
    
    func from<Anchor>(_ secondAnchor: Anchor) -> AfterBuildModificator<Anchor, NSLayoutConstraint> {
        AfterBuildModificator(
            model: secondAnchor,
            modificator: Modificator { (constraint: NSLayoutConstraint) in
                constraint.setConstant(RelativeAutoLayoutConstant(
                    value: self.value,
                    kind: RelativeAutoLayoutConstant.Kind.offset
                ))
            }
        )
    }
}

public extension AutoLayoutItemConvertible {
    func leftAnchor(_ secondAnchorModificator: AfterBuildModificator<NSLayoutXAxisAnchor, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAcnhor: NSLayoutXAxisAnchor) in
                view.leftAnchor.constraint(equalTo: secondAcnhor).activate()
            })
        })
    }
    
    func rightAnchor(_ secondAnchorModificator: AfterBuildModificator<NSLayoutXAxisAnchor, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAcnhor: NSLayoutXAxisAnchor) in
                view.rightAnchor.constraint(equalTo: secondAcnhor).activate()
            })
        })
    }

    func leadingAnchor(_ secondAnchorModificator: AfterBuildModificator<NSLayoutXAxisAnchor, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAcnhor: NSLayoutXAxisAnchor) in
                view.leadingAnchor.constraint(equalTo: secondAcnhor).activate()
            })
        })
    }

    func trailingAnchor(_ secondAnchorModificator: AfterBuildModificator<NSLayoutXAxisAnchor, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAcnhor: NSLayoutXAxisAnchor) in
                view.trailingAnchor.constraint(equalTo: secondAcnhor).activate()
            })
        })
    }

    func topAnchor(_ secondAnchorModificator: AfterBuildModificator<NSLayoutYAxisAnchor, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAcnhor: NSLayoutYAxisAnchor) in
                view.topAnchor.constraint(equalTo: secondAcnhor).activate()
            })
        })
    }

    func bottomAnchor(_ secondAnchorModificator: AfterBuildModificator<NSLayoutYAxisAnchor, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAcnhor: NSLayoutYAxisAnchor) in
                view.bottomAnchor.constraint(equalTo: secondAcnhor).activate()
            })
        })
    }
}
