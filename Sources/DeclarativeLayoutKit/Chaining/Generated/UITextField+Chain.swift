// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public extension UITextField {
    @discardableResult
    func text(_ newValue: String?) -> Self {
        text = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func attributedText(_ newValue: NSAttributedString?) -> Self {
        attributedText = newValue
        return self
    }

    @discardableResult
    func textColor(_ newValue: UIColor?) -> Self {
        textColor = newValue
        return self
    }

    @discardableResult
    func font(_ newValue: UIFont?) -> Self {
        font = newValue
        return self
    }

    @discardableResult
    func textAlignment(_ newValue: NSTextAlignment) -> Self {
        textAlignment = newValue
        return self
    }

    @discardableResult
    func borderStyle(_ newValue: UITextField.BorderStyle) -> Self {
        borderStyle = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func defaultTextAttributes(_ newValue: [NSAttributedString.Key : Any]) -> Self {
        defaultTextAttributes = newValue
        return self
    }

    @discardableResult
    func placeholder(_ newValue: String?) -> Self {
        placeholder = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func attributedPlaceholder(_ newValue: NSAttributedString?) -> Self {
        attributedPlaceholder = newValue
        return self
    }

    @discardableResult
    func clearsOnBeginEditing(_ newValue: Bool) -> Self {
        clearsOnBeginEditing = newValue
        return self
    }

    @discardableResult
    func adjustsFontSizeToFitWidth(_ newValue: Bool) -> Self {
        adjustsFontSizeToFitWidth = newValue
        return self
    }

    @discardableResult
    func minimumFontSize(_ newValue: CGFloat) -> Self {
        minimumFontSize = newValue
        return self
    }

    @discardableResult
    func delegate(_ newValue: UITextFieldDelegate?) -> Self {
        delegate = newValue
        return self
    }

    @discardableResult
    func background(_ newValue: UIImage?) -> Self {
        background = newValue
        return self
    }

    @discardableResult
    func disabledBackground(_ newValue: UIImage?) -> Self {
        disabledBackground = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func allowsEditingTextAttributes(_ newValue: Bool) -> Self {
        allowsEditingTextAttributes = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func typingAttributes(_ newValue: [NSAttributedString.Key : Any]?) -> Self {
        typingAttributes = newValue
        return self
    }

    @discardableResult
    func clearButtonMode(_ newValue: UITextField.ViewMode) -> Self {
        clearButtonMode = newValue
        return self
    }

    @discardableResult
    func leftView(_ newValue: UIView?) -> Self {
        leftView = newValue
        return self
    }

    @discardableResult
    func leftViewMode(_ newValue: UITextField.ViewMode) -> Self {
        leftViewMode = newValue
        return self
    }

    @discardableResult
    func rightView(_ newValue: UIView?) -> Self {
        rightView = newValue
        return self
    }

    @discardableResult
    func rightViewMode(_ newValue: UITextField.ViewMode) -> Self {
        rightViewMode = newValue
        return self
    }

    @discardableResult
    func inputView(_ newValue: UIView?) -> Self {
        inputView = newValue
        return self
    }

    @discardableResult
    func inputAccessoryView(_ newValue: UIView?) -> Self {
        inputAccessoryView = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func clearsOnInsertion(_ newValue: Bool) -> Self {
        clearsOnInsertion = newValue
        return self
    }

}
