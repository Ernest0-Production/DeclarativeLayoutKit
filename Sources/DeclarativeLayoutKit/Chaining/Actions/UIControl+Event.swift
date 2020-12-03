//
//  UIControl+Event.swift
//  
//
//  Created by Бабаян Эрнест on 04.12.2020.
//

import UIKit


public extension UIControl {
    ///  **⚠️ Don't forget about ARC when use self or some parent view in action closure, to prevent retain cycle**
    @discardableResult
    func addAction(for controlEvents: UIControl.Event, overwrite: Bool = false, _ action: @escaping () -> ()) -> Self {
        if overwrite {
            removeTarget(nil, action: nil, for: .allEvents)
        }

        let action = ClosureAction(attachTo: self, closure: action)
        addTarget(action, action: ClosureAction.selector, for: controlEvents)
        return self
    }
}

public extension UIButton {
    ///  **⚠️ Don't forget about ARC when use self or some parent view in action closure, to prevent retain cycle**
    @discardableResult
    func onTap(overwrite: Bool = false, _ action: @escaping () -> ()) -> Self {
        if overwrite {
            removeTarget(nil, action: nil, for: .touchUpInside)
        }

        addAction(for: .touchUpInside, action)
        return self
    }
}

