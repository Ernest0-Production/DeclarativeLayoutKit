//
//  File.swift
//  
//
//  Created by Ernest Babayan on 14.07.2021.
//

import UIKit


public struct WithCustomRelationType<Object> {
    init(_ object: Object, _ relationType: RelationType) {
        self.object = object
        self.relationType = relationType
    }
    
    let object: Object
    let relationType: RelationType
    
    func map<T>(_ transform: (Object) -> T) -> WithCustomRelationType<T> {
        WithCustomRelationType<T>(transform(object), relationType)
    }
    
    var orLess: Self {
        Self(object, RelationType.less)
    }
    
    var orGreater: Self {
        Self(object, RelationType.greater)
    }
}

@discardableResult
func makeRelativeConstraint(
    firstAnchor: NSLayoutXAxisAnchor,
    secondAnchor: WithCustomRelationType<NSLayoutXAxisAnchor>
) -> NSLayoutConstraint {
    let constraint: NSLayoutConstraint

    switch secondAnchor.relationType {
    case .equal:
        constraint = firstAnchor.constraint(equalTo: secondAnchor.object)
    case .greater:
        constraint = firstAnchor.constraint(greaterThanOrEqualTo: secondAnchor.object)
    case .less:
        constraint = firstAnchor.constraint(lessThanOrEqualTo: secondAnchor.object)
    }

    constraint.isActive = true

    return constraint
}

@discardableResult
func makeRelativeConstraint(
    firstAnchor: NSLayoutYAxisAnchor,
    secondAnchor: WithCustomRelationType<NSLayoutYAxisAnchor>
) -> NSLayoutConstraint {
    let constraint: NSLayoutConstraint

    switch secondAnchor.relationType {
    case .equal:
        constraint = firstAnchor.constraint(equalTo: secondAnchor.object)
    case .greater:
        constraint = firstAnchor.constraint(greaterThanOrEqualTo: secondAnchor.object)
    case .less:
        constraint = firstAnchor.constraint(lessThanOrEqualTo: secondAnchor.object)
    }

    constraint.isActive = true

    return constraint
}


public extension NSLayoutXAxisAnchor {
    var orLess: WithCustomRelationType<NSLayoutXAxisAnchor> {
        WithCustomRelationType(self, RelationType.less)
    }
    
    var orGreater: WithCustomRelationType<NSLayoutXAxisAnchor> {
        WithCustomRelationType(self, RelationType.greater)
    }
}


public extension NSLayoutYAxisAnchor {
    var orLess: WithCustomRelationType<NSLayoutYAxisAnchor> {
        WithCustomRelationType(self, RelationType.less)
    }
    
    var orGreater: WithCustomRelationType<NSLayoutYAxisAnchor> {
        WithCustomRelationType(self, RelationType.greater)
    }
}

public extension AutoLayoutItemConvertible {
    func leftAnchor(_ secondAnchor: WithCustomRelationType<NSLayoutXAxisAnchor>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(firstAnchor: view.leftAnchor, secondAnchor: secondAnchor)
        })
    }
    
    func rightAnchor(_ secondAnchor: WithCustomRelationType<NSLayoutXAxisAnchor>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(firstAnchor: view.rightAnchor, secondAnchor: secondAnchor)
        })
    }
    
    func leadingAnchor(_ secondAnchor: WithCustomRelationType<NSLayoutXAxisAnchor>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(firstAnchor: view.leadingAnchor, secondAnchor: secondAnchor)
        })
    }
    
    func trailingAnchor(_ secondAnchor: WithCustomRelationType<NSLayoutXAxisAnchor>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(firstAnchor: view.trailingAnchor, secondAnchor: secondAnchor)
        })
    }
    
    func topAnchor(_ secondAnchor: WithCustomRelationType<NSLayoutYAxisAnchor>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(firstAnchor: view.topAnchor, secondAnchor: secondAnchor)
        })
    }
    
    func bottomAnchor(_ secondAnchor: WithCustomRelationType<NSLayoutYAxisAnchor>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(firstAnchor: view.bottomAnchor, secondAnchor: secondAnchor)
        })
    }
}
