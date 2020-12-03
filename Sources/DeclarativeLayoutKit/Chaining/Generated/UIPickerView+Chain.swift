// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public extension UIPickerView {
    @discardableResult
    func dataSource(_ newValue: UIPickerViewDataSource?) -> Self {
        dataSource = newValue
        return self
    }

    @discardableResult
    func delegate(_ newValue: UIPickerViewDelegate?) -> Self {
        delegate = newValue
        return self
    }

    @discardableResult
    func showsSelectionIndicator(_ newValue: Bool) -> Self {
        showsSelectionIndicator = newValue
        return self
    }

}
