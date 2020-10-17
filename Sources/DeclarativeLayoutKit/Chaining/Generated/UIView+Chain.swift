// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public extension UIView {
    @discardableResult
    func isUserInteractionEnabled(_ newValue: Bool) -> Self {
        isUserInteractionEnabled = newValue
        return self
    }

    @discardableResult
    func tag(_ newValue: Int) -> Self {
        tag = newValue
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func focusGroupIdentifier(_ newValue: String?) -> Self {
        focusGroupIdentifier = newValue
        return self
    }

    @available(iOS 9.0, *)
    @discardableResult
    func semanticContentAttribute(_ newValue: UISemanticContentAttribute) -> Self {
        semanticContentAttribute = newValue
        return self
    }

    @discardableResult
    func frame(_ newValue: CGRect) -> Self {
        frame = newValue
        return self
    }

    @discardableResult
    func bounds(_ newValue: CGRect) -> Self {
        bounds = newValue
        return self
    }

    @discardableResult
    func center(_ newValue: CGPoint) -> Self {
        center = newValue
        return self
    }

    @discardableResult
    func transform(_ newValue: CGAffineTransform) -> Self {
        transform = newValue
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func transform3D(_ newValue: CATransform3D) -> Self {
        transform3D = newValue
        return self
    }

    @available(iOS 4.0, *)
    @discardableResult
    func contentScaleFactor(_ newValue: CGFloat) -> Self {
        contentScaleFactor = newValue
        return self
    }

    @discardableResult
    func isMultipleTouchEnabled(_ newValue: Bool) -> Self {
        isMultipleTouchEnabled = newValue
        return self
    }

    @discardableResult
    func isExclusiveTouch(_ newValue: Bool) -> Self {
        isExclusiveTouch = newValue
        return self
    }

    @discardableResult
    func autoresizesSubviews(_ newValue: Bool) -> Self {
        autoresizesSubviews = newValue
        return self
    }

    @discardableResult
    func autoresizingMask(_ newValue: UIView.AutoresizingMask) -> Self {
        autoresizingMask = newValue
        return self
    }

    @available(iOS 8.0, *)
    @discardableResult
    func layoutMargins(_ newValue: UIEdgeInsets) -> Self {
        layoutMargins = newValue
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func directionalLayoutMargins(_ newValue: NSDirectionalEdgeInsets) -> Self {
        directionalLayoutMargins = newValue
        return self
    }

    @available(iOS 8.0, *)
    @discardableResult
    func preservesSuperviewLayoutMargins(_ newValue: Bool) -> Self {
        preservesSuperviewLayoutMargins = newValue
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func insetsLayoutMarginsFromSafeArea(_ newValue: Bool) -> Self {
        insetsLayoutMarginsFromSafeArea = newValue
        return self
    }

    @discardableResult
    func clipsToBounds(_ newValue: Bool) -> Self {
        clipsToBounds = newValue
        return self
    }

    @discardableResult
    func backgroundColor(_ newValue: UIColor?) -> Self {
        backgroundColor = newValue
        return self
    }

    @discardableResult
    func alpha(_ newValue: CGFloat) -> Self {
        alpha = newValue
        return self
    }

    @discardableResult
    func isOpaque(_ newValue: Bool) -> Self {
        isOpaque = newValue
        return self
    }

    @discardableResult
    func clearsContextBeforeDrawing(_ newValue: Bool) -> Self {
        clearsContextBeforeDrawing = newValue
        return self
    }

    @discardableResult
    func isHidden(_ newValue: Bool) -> Self {
        isHidden = newValue
        return self
    }

    @discardableResult
    func contentMode(_ newValue: UIView.ContentMode) -> Self {
        contentMode = newValue
        return self
    }

    @available(iOS 8.0, *)
    @discardableResult
    func mask(_ newValue: UIView?) -> Self {
        mask = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func tintColor(_ newValue: UIColor!) -> Self {
        tintColor = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func tintAdjustmentMode(_ newValue: UIView.TintAdjustmentMode) -> Self {
        tintAdjustmentMode = newValue
        return self
    }

    @available(iOS 3.2, *)
    @discardableResult
    func gestureRecognizers(_ newValue: [UIGestureRecognizer]?) -> Self {
        gestureRecognizers = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func motionEffects(_ newValue: [UIMotionEffect]) -> Self {
        motionEffects = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func translatesAutoresizingMaskIntoConstraints(_ newValue: Bool) -> Self {
        translatesAutoresizingMaskIntoConstraints = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func restorationIdentifier(_ newValue: String?) -> Self {
        restorationIdentifier = newValue
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func overrideUserInterfaceStyle(_ newValue: UIUserInterfaceStyle) -> Self {
        overrideUserInterfaceStyle = newValue
        return self
    }
}
