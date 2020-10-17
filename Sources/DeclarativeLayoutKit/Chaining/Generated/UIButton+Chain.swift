// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public extension UIButton {
    @discardableResult
    func contentEdgeInsets(_ newValue: UIEdgeInsets) -> Self {
        contentEdgeInsets = newValue
        return self
    }

    @discardableResult
    func titleEdgeInsets(_ newValue: UIEdgeInsets) -> Self {
        titleEdgeInsets = newValue
        return self
    }

    @discardableResult
    func reversesTitleShadowWhenHighlighted(_ newValue: Bool) -> Self {
        reversesTitleShadowWhenHighlighted = newValue
        return self
    }

    @discardableResult
    func imageEdgeInsets(_ newValue: UIEdgeInsets) -> Self {
        imageEdgeInsets = newValue
        return self
    }

    @discardableResult
    func adjustsImageWhenHighlighted(_ newValue: Bool) -> Self {
        adjustsImageWhenHighlighted = newValue
        return self
    }

    @discardableResult
    func adjustsImageWhenDisabled(_ newValue: Bool) -> Self {
        adjustsImageWhenDisabled = newValue
        return self
    }

    @discardableResult
    func showsTouchWhenHighlighted(_ newValue: Bool) -> Self {
        showsTouchWhenHighlighted = newValue
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func role(_ newValue: UIButton.Role) -> Self {
        role = newValue
        return self
    }

    @available(iOS 13.4, *)
    @discardableResult
    func isPointerInteractionEnabled(_ newValue: Bool) -> Self {
        isPointerInteractionEnabled = newValue
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func menu(_ newValue: UIMenu?) -> Self {
        menu = newValue
        return self
    }

}
