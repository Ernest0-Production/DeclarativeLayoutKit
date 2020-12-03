// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public extension UIToolbar {
    @discardableResult
    func barStyle(_ newValue: UIBarStyle) -> Self {
        barStyle = newValue
        return self
    }

    @discardableResult
    func items(_ newValue: [UIBarButtonItem]?) -> Self {
        items = newValue
        return self
    }

    @available(iOS 3.0, *)
    @discardableResult
    func isTranslucent(_ newValue: Bool) -> Self {
        isTranslucent = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func barTintColor(_ newValue: UIColor?) -> Self {
        barTintColor = newValue
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func standardAppearance(_ newValue: UIToolbarAppearance) -> Self {
        standardAppearance = newValue
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func compactAppearance(_ newValue: UIToolbarAppearance?) -> Self {
        compactAppearance = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func delegate(_ newValue: UIToolbarDelegate?) -> Self {
        delegate = newValue
        return self
    }

}
