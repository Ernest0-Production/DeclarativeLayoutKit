//
//  ClosureAction.swift
//  
//
//  Created by Ernest0N on 13.10.2020.
//

import UIKit


final class ClosureAction {
    private let closure: () -> ()

    fileprivate init(attachTo: AnyObject, closure: @escaping () -> ()) {
        self.closure = closure
        objc_setAssociatedObject(attachTo, "[\(arc4random())]", self, .OBJC_ASSOCIATION_RETAIN)
    }

    @objc
    func invoke() { closure() }

    static var selector: Selector { #selector(ClosureAction.invoke) }
}

public extension UIControl {
    ///  **⚠️ Don't forget about ARC when use some parent view in action closure, to prevent retain cycle**
    @discardableResult
    func addAction(for controlEvents: UIControl.Event, _ action: @escaping () -> ()) -> Self {
        let action = ClosureAction(attachTo: self, closure: action)
        addTarget(action, action: ClosureAction.selector, for: controlEvents)
        return self
    }
}

public extension UIButton {
    ///  **⚠️ Don't forget about ARC when use some parent view in action closure, to prevent retain cycle**
    @discardableResult
    func onTap(_ action: @escaping () -> ()) -> Self {
        addAction(for: .touchUpInside, action)
        return self
    }
}

public extension UIView {
    ///  **⚠️ Don't forget about ARC when use some parent view in action closure, to prevent retain cycle**
    @discardableResult
    func onTapGesture(_ action: @escaping () -> ()) -> Self {
        let action = ClosureAction(attachTo: self, closure: action)
        addGestureRecognizer(UITapGestureRecognizer(target: action, action: ClosureAction.selector))
        return self
    }

    ///  **⚠️ Don't forget about ARC when use some parent view in action closure, to prevent retain cycle**
    @discardableResult
    func onLongTapGesture(_ action: @escaping () -> ()) -> Self {
        let action = ClosureAction(attachTo: self, closure: action)
        addGestureRecognizer(UILongPressGestureRecognizer(target: action, action: ClosureAction.selector))
        return self
    }
}
