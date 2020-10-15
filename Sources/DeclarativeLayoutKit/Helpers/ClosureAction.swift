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
    func invoke() {
        closure()
    }
}

public extension UIControl {
    @discardableResult
    func addAction(for controlEvents: UIControl.Event, action: @escaping () -> ()) -> Self {
        let action = ClosureAction(attachTo: self, closure: action)
        addTarget(action, action: #selector(ClosureAction.invoke), for: controlEvents)
        return self
    }
}

public extension UIButton {
    @discardableResult
    func addAction(_ action: @escaping () -> ()) -> Self {
        addAction(for: .touchUpInside, action: action)
        return self
    }

    @discardableResult
    func onTap(_ action: @escaping () -> ()) -> Self {
        removeTarget(nil, action: nil, for: .allEvents)
        addAction(action)
        return self
    }
}
