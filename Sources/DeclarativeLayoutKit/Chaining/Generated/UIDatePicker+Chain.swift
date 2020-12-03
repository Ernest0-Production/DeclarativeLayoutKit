// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public extension UIDatePicker {
    @discardableResult
    func datePickerMode(_ newValue: UIDatePicker.Mode) -> Self {
        datePickerMode = newValue
        return self
    }

    @discardableResult
    func locale(_ newValue: Locale?) -> Self {
        locale = newValue
        return self
    }

    @discardableResult
    func calendar(_ newValue: Calendar!) -> Self {
        calendar = newValue
        return self
    }

    @discardableResult
    func timeZone(_ newValue: TimeZone?) -> Self {
        timeZone = newValue
        return self
    }

    @discardableResult
    func date(_ newValue: Date) -> Self {
        date = newValue
        return self
    }

    @discardableResult
    func minimumDate(_ newValue: Date?) -> Self {
        minimumDate = newValue
        return self
    }

    @discardableResult
    func maximumDate(_ newValue: Date?) -> Self {
        maximumDate = newValue
        return self
    }

    @discardableResult
    func countDownDuration(_ newValue: TimeInterval) -> Self {
        countDownDuration = newValue
        return self
    }

    @discardableResult
    func minuteInterval(_ newValue: Int) -> Self {
        minuteInterval = newValue
        return self
    }

    @available(iOS 13.4, *)
    @discardableResult
    func preferredDatePickerStyle(_ newValue: UIDatePickerStyle) -> Self {
        preferredDatePickerStyle = newValue
        return self
    }

}
