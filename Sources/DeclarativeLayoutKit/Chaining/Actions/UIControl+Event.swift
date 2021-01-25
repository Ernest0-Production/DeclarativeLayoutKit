//
//  UIControl+Event.swift
//  
//
//  Created by Бабаян Эрнест on 04.12.2020.
//

import UIKit


public extension UIControl {
    /// **⚠️ Don't forget about ARC when use self or some parent view in action closure, to prevent retain cycle**
    /// - Parameters:
    ///   - overwrite: if true - remove previous targets for current event.
    @discardableResult
    func addAction(for controlEvents: UIControl.Event, overwrite: Bool = false, _ action: @escaping () -> Void) -> Self {
        if overwrite {
            removeTarget(nil, action: nil, for: controlEvents)
        }

        let action = ClosureAction(attachTo: self, closure: action)
        addTarget(action, action: ClosureAction.selector, for: controlEvents)
        return self
    }
}

public extension UIButton {
    /// **⚠️ Don't forget about ARC when use self or some parent view in action closure, to prevent retain cycle**
    /// - Parameters:
    ///   - overwrite: if true - remove previous targets for current event.
    @discardableResult
    func onTap(overwrite: Bool = false, _ action: @escaping () -> Void) -> Self {
        addAction(for: UIControl.Event.touchUpInside, overwrite: overwrite, action)
        return self
    }
}

public extension UISwitch {
    /// **⚠️ Don't forget about ARC when use self or some parent view in action closure, to prevent retain cycle**
    /// - Parameters:
    ///   - overwrite: if true - remove previous targets for current event.
    @discardableResult
    func onSwitch(overwrite: Bool = false, _ action: @escaping (Bool) -> Void) -> Self {
        addAction(
            for: UIControl.Event.valueChanged,
            overwrite: overwrite,
            { [unowned self] in action(isOn) }
        )
        return self
    }
}

public extension UISlider {
    /// **⚠️ Don't forget about ARC when use self or some parent view in action closure, to prevent retain cycle**
    /// - Parameters:
    ///   - overwrite: if true - remove previous targets for current event.
    @discardableResult
    func onChange(overwrite: Bool = false, _ action: @escaping (Float) -> Void) -> Self {
        addAction(
            for: UIControl.Event.valueChanged,
            overwrite: overwrite,
            { [unowned self] in action(value) }
        )
        return self
    }
}

public extension UITextField {
    /// **⚠️ Don't forget about ARC when use self or some parent view in action closure, to prevent retain cycle**
    /// - Parameters:
    ///   - overwrite: if true - remove previous targets for current event.
    @discardableResult
    func onTextChanged(overwrite: Bool = false, _ action: @escaping (String?) -> Void) -> Self {
        addAction(
            for: UIControl.Event.editingChanged,
            overwrite: overwrite,
            { [unowned self] in  action(text) }
        )
        return self
    }
}
