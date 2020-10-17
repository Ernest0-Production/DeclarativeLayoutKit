// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public extension UISlider {
    @discardableResult
    func value(_ newValue: Float) -> Self {
        value = newValue
        return self
    }

    @discardableResult
    func minimumValue(_ newValue: Float) -> Self {
        minimumValue = newValue
        return self
    }

    @discardableResult
    func maximumValue(_ newValue: Float) -> Self {
        maximumValue = newValue
        return self
    }

    @discardableResult
    func minimumValueImage(_ newValue: UIImage?) -> Self {
        minimumValueImage = newValue
        return self
    }

    @discardableResult
    func maximumValueImage(_ newValue: UIImage?) -> Self {
        maximumValueImage = newValue
        return self
    }

    @discardableResult
    func isContinuous(_ newValue: Bool) -> Self {
        isContinuous = newValue
        return self
    }

    @available(iOS 5.0, *)
    @discardableResult
    func minimumTrackTintColor(_ newValue: UIColor?) -> Self {
        minimumTrackTintColor = newValue
        return self
    }

    @available(iOS 5.0, *)
    @discardableResult
    func maximumTrackTintColor(_ newValue: UIColor?) -> Self {
        maximumTrackTintColor = newValue
        return self
    }

    @available(iOS 5.0, *)
    @discardableResult
    func thumbTintColor(_ newValue: UIColor?) -> Self {
        thumbTintColor = newValue
        return self
    }

}
