//
//  File.swift
//  
//
//  Created by Ernest Babayan on 15.07.2021.
//

import UIKit


func ex() {
//    let asd: WithCustomRelationType<SelfRelated<NSLayoutXAxisAnchor>> = SelfRelated<NSLayoutXAxisAnchor>.to(\.leftAnchor).orLess
    
    UIView().leftAnchor(.to(\.leftAnchor).orGreater.orLess)
}

/*
 
 firstView.leftAnchor(12.to(\.superview!.leftAnchor.orLess)) // AfterBuildModificator<WithCustomRelationType<SelfRelated<NSLayoutXAxisAnchor>, NSLayoutConstraint>
 */

public extension SelfRelated where Value == WithCustomRelationType<NSLayoutXAxisAnchor> {
    static func to(_ valuePath: @escaping SelfRelated<NSLayoutXAxisAnchor>.ValuePath) -> Self {
        Self { (view: UIView) in
            WithCustomRelationType(valuePath(view), RelationType.equal)
        }
    }

    var orLess: Self {
        Self({ self.value(from: $0).orLess })
    }
    
    var orGreater: Self {
        Self({ self.value(from: $0).orGreater })
    }
}

public extension AutoLayoutItemConvertible {
    func leftAnchor(_ secondAnchor: SelfRelated<WithCustomRelationType<NSLayoutXAxisAnchor>>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                firstAnchor: view.leftAnchor,
                secondAnchor: secondAnchor.value(from: view)
            )
        })
    }
    
    func rightAnchor(_ secondAnchor: SelfRelated<WithCustomRelationType<NSLayoutXAxisAnchor>>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                firstAnchor: view.rightAnchor,
                secondAnchor: secondAnchor.value(from: view)
            )
        })
    }

    func leadingAnchor(_ secondAnchor: SelfRelated<WithCustomRelationType<NSLayoutXAxisAnchor>>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                firstAnchor: view.leadingAnchor,
                secondAnchor: secondAnchor.value(from: view)
            )
        })
    }

    func trailingAnchor(_ secondAnchor: SelfRelated<WithCustomRelationType<NSLayoutXAxisAnchor>>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                firstAnchor: view.trailingAnchor,
                secondAnchor: secondAnchor.value(from: view)
            )
        })
    }

    func topAnchor(_ secondAnchor: SelfRelated<WithCustomRelationType<NSLayoutYAxisAnchor>>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                firstAnchor: view.topAnchor,
                secondAnchor: secondAnchor.value(from: view)
            )
        })
    }

    func bottomAnchor(_ secondAnchor: SelfRelated<WithCustomRelationType<NSLayoutYAxisAnchor>>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                firstAnchor: view.bottomAnchor,
                secondAnchor: secondAnchor.value(from: view)
            )
        })
    }
}
