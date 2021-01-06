//
//  UIView_Gesture.swift
//  
//
//  Created by Бабаян Эрнест on 04.12.2020.
//

import UIKit


public extension UIView {
    ///  **⚠️ Don't forget about ARC when use self or some parent view in action closure, to prevent retain cycle**
    @discardableResult
    func onTapGesture(overwrite: Bool = false, _ action: @escaping () -> ()) -> Self {
        if overwrite {
            gestureRecognizers?.removeAll(where: { (gesture: UIGestureRecognizer) in gesture is UITapGestureRecognizer })
        }

        let action = ClosureAction(attachTo: self, closure: action)
        addGestureRecognizer(UITapGestureRecognizer(target: action, action: ClosureAction.selector))
        return self
    }

    ///  **⚠️ Don't forget about ARC when use self or some parent view in action closure, to prevent retain cycle**
    @discardableResult
    func onLongTapGesture(overwrite: Bool = false, _ action: @escaping () -> ()) -> Self {
        if overwrite {
            gestureRecognizers?.removeAll(where: { (gesture: UIGestureRecognizer) in gesture is UILongPressGestureRecognizer })
        }

        let action = ClosureAction(attachTo: self, closure: action)
        addGestureRecognizer(UILongPressGestureRecognizer(target: action, action: ClosureAction.selector))
        return self
    }
}
