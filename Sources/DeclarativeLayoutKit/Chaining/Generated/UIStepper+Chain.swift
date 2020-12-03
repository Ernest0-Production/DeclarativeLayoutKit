// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public extension UIStepper {
    @discardableResult
    func isContinuous(_ newValue: Bool) -> Self {
        isContinuous = newValue
        return self
    }

    @discardableResult
    func autorepeat(_ newValue: Bool) -> Self {
        autorepeat = newValue
        return self
    }

    @discardableResult
    func wraps(_ newValue: Bool) -> Self {
        wraps = newValue
        return self
    }

    @discardableResult
    func value(_ newValue: Double) -> Self {
        value = newValue
        return self
    }

    @discardableResult
    func minimumValue(_ newValue: Double) -> Self {
        minimumValue = newValue
        return self
    }

    @discardableResult
    func maximumValue(_ newValue: Double) -> Self {
        maximumValue = newValue
        return self
    }

    @discardableResult
    func stepValue(_ newValue: Double) -> Self {
        stepValue = newValue
        return self
    }

}
