// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public extension UIControl {
    @discardableResult
    func isEnabled(_ newValue: Bool) -> Self {
        isEnabled = newValue
        return self
    }

    @discardableResult
    func isSelected(_ newValue: Bool) -> Self {
        isSelected = newValue
        return self
    }

    @discardableResult
    func isHighlighted(_ newValue: Bool) -> Self {
        isHighlighted = newValue
        return self
    }

    @discardableResult
    func contentVerticalAlignment(_ newValue: UIControl.ContentVerticalAlignment) -> Self {
        contentVerticalAlignment = newValue
        return self
    }

    @discardableResult
    func contentHorizontalAlignment(_ newValue: UIControl.ContentHorizontalAlignment) -> Self {
        contentHorizontalAlignment = newValue
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func isContextMenuInteractionEnabled(_ newValue: Bool) -> Self {
        isContextMenuInteractionEnabled = newValue
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func showsMenuAsPrimaryAction(_ newValue: Bool) -> Self {
        showsMenuAsPrimaryAction = newValue
        return self
    }

}
