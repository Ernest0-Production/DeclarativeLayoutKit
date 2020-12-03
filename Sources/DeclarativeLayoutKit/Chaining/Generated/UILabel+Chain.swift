// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public extension UILabel {
    @discardableResult
    func text(_ newValue: String?) -> Self {
        text = newValue
        return self
    }

    @discardableResult
    func font(_ newValue: UIFont!) -> Self {
        font = newValue
        return self
    }

    @discardableResult
    func textColor(_ newValue: UIColor!) -> Self {
        textColor = newValue
        return self
    }

    @discardableResult
    func textAlignment(_ newValue: NSTextAlignment) -> Self {
        textAlignment = newValue
        return self
    }

    @discardableResult
    func lineBreakMode(_ newValue: NSLineBreakMode) -> Self {
        lineBreakMode = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func attributedText(_ newValue: NSAttributedString?) -> Self {
        attributedText = newValue
        return self
    }

    @discardableResult
    func highlightedTextColor(_ newValue: UIColor?) -> Self {
        highlightedTextColor = newValue
        return self
    }

    @discardableResult
    func isHighlighted(_ newValue: Bool) -> Self {
        isHighlighted = newValue
        return self
    }

    @discardableResult
    func isEnabled(_ newValue: Bool) -> Self {
        isEnabled = newValue
        return self
    }

    @discardableResult
    func numberOfLines(_ newValue: Int) -> Self {
        numberOfLines = newValue
        return self
    }

    @discardableResult
    func adjustsFontSizeToFitWidth(_ newValue: Bool) -> Self {
        adjustsFontSizeToFitWidth = newValue
        return self
    }

    @discardableResult
    func baselineAdjustment(_ newValue: UIBaselineAdjustment) -> Self {
        baselineAdjustment = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func minimumScaleFactor(_ newValue: CGFloat) -> Self {
        minimumScaleFactor = newValue
        return self
    }

    @available(iOS 9.0, *)
    @discardableResult
    func allowsDefaultTighteningForTruncation(_ newValue: Bool) -> Self {
        allowsDefaultTighteningForTruncation = newValue
        return self
    }

    @discardableResult
    func lineBreakStrategy(_ newValue: NSParagraphStyle.LineBreakStrategy) -> Self {
        lineBreakStrategy = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func preferredMaxLayoutWidth(_ newValue: CGFloat) -> Self {
        preferredMaxLayoutWidth = newValue
        return self
    }

}
