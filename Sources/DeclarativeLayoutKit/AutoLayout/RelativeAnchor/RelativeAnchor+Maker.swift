//
//  File.swift
//  
//
//  Created by Ernest Babayan on 14.07.2021.
//

import UIKit

extension NSLayoutConstraint {
    @discardableResult
    func activate() -> Self {
        isActive = true
        return self
    }
}


public extension AutoLayoutItemConvertible {
    func leftAnchor(_ secondAnchor: NSLayoutXAxisAnchor) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            view.leftAnchor
                .constraint(equalTo: secondAnchor)
                .activate()
        })
    }
    
    func rightAnchor(_ secondAnchor: NSLayoutXAxisAnchor) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            view.rightAnchor
                .constraint(equalTo: secondAnchor)
                .activate()
        })
    }
    
    func leadingAnchor(_ secondAnchor: NSLayoutXAxisAnchor) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            view.leadingAnchor
                .constraint(equalTo: secondAnchor)
                .activate()
        })
    }
    
    func trailingAnchor(_ secondAnchor: NSLayoutXAxisAnchor) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            view.trailingAnchor
                .constraint(equalTo: secondAnchor)
                .activate()
        })
    }
    
    func topAnchor(_ secondAnchor: NSLayoutYAxisAnchor) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            view.topAnchor
                .constraint(equalTo: secondAnchor)
                .activate()
        })
    }
    
    func bottomAnchor(_ secondAnchor: NSLayoutYAxisAnchor) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            view.bottomAnchor
                .constraint(equalTo: secondAnchor)
                .activate()
        })
    }
}
