// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public extension UIImageView {
    @discardableResult
    func image(_ newValue: UIImage?) -> Self {
        image = newValue
        return self
    }

    @available(iOS 3.0, *)
    @discardableResult
    func highlightedImage(_ newValue: UIImage?) -> Self {
        highlightedImage = newValue
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func preferredSymbolConfiguration(_ newValue: UIImage.SymbolConfiguration?) -> Self {
        preferredSymbolConfiguration = newValue
        return self
    }

    @available(iOS 3.0, *)
    @discardableResult
    func isHighlighted(_ newValue: Bool) -> Self {
        isHighlighted = newValue
        return self
    }

    @discardableResult
    func animationImages(_ newValue: [UIImage]?) -> Self {
        animationImages = newValue
        return self
    }

    @available(iOS 3.0, *)
    @discardableResult
    func highlightedAnimationImages(_ newValue: [UIImage]?) -> Self {
        highlightedAnimationImages = newValue
        return self
    }

    @discardableResult
    func animationDuration(_ newValue: TimeInterval) -> Self {
        animationDuration = newValue
        return self
    }

    @discardableResult
    func animationRepeatCount(_ newValue: Int) -> Self {
        animationRepeatCount = newValue
        return self
    }

}
