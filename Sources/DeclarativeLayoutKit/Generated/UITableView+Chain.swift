// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public extension UITableView {
    @discardableResult
    func dataSource(_ newValue: UITableViewDataSource?) -> Self {
        dataSource = newValue
        return self
    }

    @available(iOS 10.0, *)
    @discardableResult
    func prefetchDataSource(_ newValue: UITableViewDataSourcePrefetching?) -> Self {
        prefetchDataSource = newValue
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func dragDelegate(_ newValue: UITableViewDragDelegate?) -> Self {
        dragDelegate = newValue
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func dropDelegate(_ newValue: UITableViewDropDelegate?) -> Self {
        dropDelegate = newValue
        return self
    }

    @discardableResult
    func rowHeight(_ newValue: CGFloat) -> Self {
        rowHeight = newValue
        return self
    }

    @discardableResult
    func sectionHeaderHeight(_ newValue: CGFloat) -> Self {
        sectionHeaderHeight = newValue
        return self
    }

    @discardableResult
    func sectionFooterHeight(_ newValue: CGFloat) -> Self {
        sectionFooterHeight = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func estimatedRowHeight(_ newValue: CGFloat) -> Self {
        estimatedRowHeight = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func estimatedSectionHeaderHeight(_ newValue: CGFloat) -> Self {
        estimatedSectionHeaderHeight = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func estimatedSectionFooterHeight(_ newValue: CGFloat) -> Self {
        estimatedSectionFooterHeight = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func separatorInset(_ newValue: UIEdgeInsets) -> Self {
        separatorInset = newValue
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func separatorInsetReference(_ newValue: UITableView.SeparatorInsetReference) -> Self {
        separatorInsetReference = newValue
        return self
    }

    @available(iOS 3.2, *)
    @discardableResult
    func backgroundView(_ newValue: UIView?) -> Self {
        backgroundView = newValue
        return self
    }

    @discardableResult
    func isEditing(_ newValue: Bool) -> Self {
        isEditing = newValue
        return self
    }

    @available(iOS 3.0, *)
    @discardableResult
    func allowsSelection(_ newValue: Bool) -> Self {
        allowsSelection = newValue
        return self
    }

    @discardableResult
    func allowsSelectionDuringEditing(_ newValue: Bool) -> Self {
        allowsSelectionDuringEditing = newValue
        return self
    }

    @available(iOS 5.0, *)
    @discardableResult
    func allowsMultipleSelection(_ newValue: Bool) -> Self {
        allowsMultipleSelection = newValue
        return self
    }

    @available(iOS 5.0, *)
    @discardableResult
    func allowsMultipleSelectionDuringEditing(_ newValue: Bool) -> Self {
        allowsMultipleSelectionDuringEditing = newValue
        return self
    }

    @discardableResult
    func sectionIndexMinimumDisplayRowCount(_ newValue: Int) -> Self {
        sectionIndexMinimumDisplayRowCount = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func sectionIndexColor(_ newValue: UIColor?) -> Self {
        sectionIndexColor = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func sectionIndexBackgroundColor(_ newValue: UIColor?) -> Self {
        sectionIndexBackgroundColor = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func sectionIndexTrackingBackgroundColor(_ newValue: UIColor?) -> Self {
        sectionIndexTrackingBackgroundColor = newValue
        return self
    }

    @discardableResult
    func separatorStyle(_ newValue: UITableViewCell.SeparatorStyle) -> Self {
        separatorStyle = newValue
        return self
    }

    @discardableResult
    func separatorColor(_ newValue: UIColor?) -> Self {
        separatorColor = newValue
        return self
    }

    @available(iOS 8.0, *)
    @discardableResult
    func separatorEffect(_ newValue: UIVisualEffect?) -> Self {
        separatorEffect = newValue
        return self
    }

    @available(iOS 9.0, *)
    @discardableResult
    func cellLayoutMarginsFollowReadableWidth(_ newValue: Bool) -> Self {
        cellLayoutMarginsFollowReadableWidth = newValue
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func insetsContentViewsToSafeArea(_ newValue: Bool) -> Self {
        insetsContentViewsToSafeArea = newValue
        return self
    }

    @discardableResult
    func tableHeaderView(_ newValue: UIView?) -> Self {
        tableHeaderView = newValue
        return self
    }

    @discardableResult
    func tableFooterView(_ newValue: UIView?) -> Self {
        tableFooterView = newValue
        return self
    }

    @available(iOS 9.0, *)
    @discardableResult
    func remembersLastFocusedIndexPath(_ newValue: Bool) -> Self {
        remembersLastFocusedIndexPath = newValue
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func selectionFollowsFocus(_ newValue: Bool) -> Self {
        selectionFollowsFocus = newValue
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func dragInteractionEnabled(_ newValue: Bool) -> Self {
        dragInteractionEnabled = newValue
        return self
    }

}
