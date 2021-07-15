//
//  File.swift
//  
//
//  Created by Ernest Babayan on 14.07.2021.
//

import UIKit


public extension AutoLayoutConstant {
    func to<Anchor>(
        _ targetPath: @escaping SelfRelated<Anchor>.ValuePath
    ) -> AfterBuildModificator<SelfRelated<Anchor>, NSLayoutConstraint> {
        AfterBuildModificator(
            model: SelfRelated(targetPath),
            modificator: Modificator { (constraint: NSLayoutConstraint) in
                constraint.setConstant(RelativeAutoLayoutConstant(
                    value: self.value,
                    kind: RelativeAutoLayoutConstant.Kind.inset
                ))
            }
        )
    }
    
    func from<Anchor>(
        _ targetPath: @escaping SelfRelated<Anchor>.ValuePath
    ) -> AfterBuildModificator<SelfRelated<Anchor>, NSLayoutConstraint> {
        AfterBuildModificator(
            model: SelfRelated(targetPath),
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
    func leftAnchor(_ secondAnchorModificator: AfterBuildModificator<SelfRelated<NSLayoutXAxisAnchor>, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAnchor: SelfRelated<NSLayoutXAxisAnchor>) in
                view.leftAnchor
                    .constraint(equalTo: secondAnchor.value(from: view))
                    .activate()
            })
        })
    }

    func rightAnchor(_ secondAnchorModificator: AfterBuildModificator<SelfRelated<NSLayoutXAxisAnchor>, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAnchor: SelfRelated<NSLayoutXAxisAnchor>) in
                view.rightAnchor
                    .constraint(equalTo: secondAnchor.value(from: view))
                    .activate()
            })
        })
    }

    func leadingAnchor(_ secondAnchorModificator: AfterBuildModificator<SelfRelated<NSLayoutXAxisAnchor>, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAnchor: SelfRelated<NSLayoutXAxisAnchor>) in
                view.leadingAnchor
                    .constraint(equalTo: secondAnchor.value(from: view))
                    .activate()
            })
        })
    }

    func trailingAnchor(_ secondAnchorModificator: AfterBuildModificator<SelfRelated<NSLayoutXAxisAnchor>, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAnchor: SelfRelated<NSLayoutXAxisAnchor>) in
                view.trailingAnchor
                    .constraint(equalTo: secondAnchor.value(from: view))
                    .activate()
            })
        })
    }

    func topAnchor(_ secondAnchorModificator: AfterBuildModificator<SelfRelated<NSLayoutYAxisAnchor>, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAnchor: SelfRelated<NSLayoutYAxisAnchor>) in
                view.topAnchor
                    .constraint(equalTo: secondAnchor.value(from: view))
                    .activate()
            })
        })
    }

    func bottomAnchor(_ secondAnchorModificator: AfterBuildModificator<SelfRelated<NSLayoutYAxisAnchor>, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAnchor: SelfRelated<NSLayoutYAxisAnchor>) in
                view.bottomAnchor
                    .constraint(equalTo: secondAnchor.value(from: view))
                    .activate()
            })
        })
    }
}
