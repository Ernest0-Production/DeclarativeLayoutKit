//
//  File.swift
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

    ///  **⚠️ Don't forget about ARC when use self or some parent view in action closure, to prevent retain cycle**
    @discardableResult
    func onPanGesture(overwrite: Bool = false, _ action: @escaping () -> ()) -> Self {
        if overwrite {
            gestureRecognizers?.removeAll(where: { (gesture: UIGestureRecognizer) in gesture is UIPanGestureRecognizer })
        }

        let action = ClosureAction(attachTo: self, closure: action)
        addGestureRecognizer(UIPanGestureRecognizer(target: action, action: ClosureAction.selector))
        return self
    }

    ///  **⚠️ Don't forget about ARC when use self or some parent view in action closure, to prevent retain cycle**
    @discardableResult
    func onSwipeGesture(overwrite: Bool = false, _ action: @escaping () -> ()) -> Self {
        if overwrite {
            gestureRecognizers?.removeAll(where: { (gesture: UIGestureRecognizer) in gesture is UISwipeGestureRecognizer })
        }

        let action = ClosureAction(attachTo: self, closure: action)
        addGestureRecognizer(UISwipeGestureRecognizer(target: action, action: ClosureAction.selector))
        return self
    }

    ///  **⚠️ Don't forget about ARC when use self or some parent view in action closure, to prevent retain cycle**
    @discardableResult
    func onPinchGesture(overwrite: Bool = false, _ action: @escaping () -> ()) -> Self {
        if overwrite {
            gestureRecognizers?.removeAll(where: { (gesture: UIGestureRecognizer) in gesture is UIPinchGestureRecognizer })
        }

        let action = ClosureAction(attachTo: self, closure: action)
        addGestureRecognizer(UIPinchGestureRecognizer(target: action, action: ClosureAction.selector))
        return self
    }

    ///  **⚠️ Don't forget about ARC when use self or some parent view in action closure, to prevent retain cycle**
    @discardableResult
    func onRotateGesture(overwrite: Bool = false, _ action: @escaping () -> ()) -> Self {
        if overwrite {
            gestureRecognizers?.removeAll(where: { (gesture: UIGestureRecognizer) in gesture is UIRotationGestureRecognizer })
        }

        let action = ClosureAction(attachTo: self, closure: action)
        addGestureRecognizer(UIRotationGestureRecognizer(target: action, action: ClosureAction.selector))
        return self
    }

    ///  **⚠️ Don't forget about ARC when use self or some parent view in action closure, to prevent retain cycle**
    @available(iOS 13.0, *)
    @discardableResult
    func onHoverGesture(overwrite: Bool = false, _ action: @escaping () -> ()) -> Self {
        if overwrite {
            gestureRecognizers?.removeAll(where: { (gesture: UIGestureRecognizer) in gesture is UIHoverGestureRecognizer })
        }

        let action = ClosureAction(attachTo: self, closure: action)
        addGestureRecognizer(UIHoverGestureRecognizer(target: action, action: ClosureAction.selector))
        return self
    }

    ///  **⚠️ Don't forget about ARC when use self or some parent view in action closure, to prevent retain cycle**
    @discardableResult
    func onScreenEdgePanGesture(overwrite: Bool = false, _ action: @escaping () -> ()) -> Self {
        if overwrite {
            gestureRecognizers?.removeAll(where: { (gesture: UIGestureRecognizer) in gesture is UIScreenEdgePanGestureRecognizer })
        }

        let action = ClosureAction(attachTo: self, closure: action)
        addGestureRecognizer(UIScreenEdgePanGestureRecognizer(target: action, action: ClosureAction.selector))
        return self
    }
}
