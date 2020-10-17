// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public extension UISwitch {
    @available(iOS 5.0, *)
    @discardableResult
    func onTintColor(_ newValue: UIColor?) -> Self {
        onTintColor = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func thumbTintColor(_ newValue: UIColor?) -> Self {
        thumbTintColor = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func onImage(_ newValue: UIImage?) -> Self {
        onImage = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func offImage(_ newValue: UIImage?) -> Self {
        offImage = newValue
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func title(_ newValue: String?) -> Self {
        title = newValue
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func preferredStyle(_ newValue: UISwitch.Style) -> Self {
        preferredStyle = newValue
        return self
    }

    @discardableResult
    func isOn(_ newValue: Bool) -> Self {
        isOn = newValue
        return self
    }

}
