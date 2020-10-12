// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public extension UITextView {
    @discardableResult
    func text(_ newValue: String!) -> Self {
        text = newValue
        return self
    }

    @discardableResult
    func font(_ newValue: UIFont?) -> Self {
        font = newValue
        return self
    }

    @discardableResult
    func textColor(_ newValue: UIColor?) -> Self {
        textColor = newValue
        return self
    }

    @discardableResult
    func textAlignment(_ newValue: NSTextAlignment) -> Self {
        textAlignment = newValue
        return self
    }

    @discardableResult
    func selectedRange(_ newValue: NSRange) -> Self {
        selectedRange = newValue
        return self
    }

    @discardableResult
    func isEditable(_ newValue: Bool) -> Self {
        isEditable = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func isSelectable(_ newValue: Bool) -> Self {
        isSelectable = newValue
        return self
    }

    @available(iOS 3.0, *)
    @discardableResult
    func dataDetectorTypes(_ newValue: UIDataDetectorTypes) -> Self {
        dataDetectorTypes = newValue
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
    func attributedText(_ newValue: NSAttributedString!) -> Self {
        attributedText = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func typingAttributes(_ newValue: [NSAttributedString.Key : Any]) -> Self {
        typingAttributes = newValue
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

    @available(iOS 7.0, *)
    @discardableResult
    func textContainerInset(_ newValue: UIEdgeInsets) -> Self {
        textContainerInset = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func linkTextAttributes(_ newValue: [NSAttributedString.Key : Any]!) -> Self {
        linkTextAttributes = newValue
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func usesStandardTextScaling(_ newValue: Bool) -> Self {
        usesStandardTextScaling = newValue
        return self
    }

}
