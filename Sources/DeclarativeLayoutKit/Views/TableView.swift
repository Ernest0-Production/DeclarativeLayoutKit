//
//  File.swift
//  
//
//  Created by Бабаян Эрнест on 22.08.2020.
//

import UIKit


public extension UITableView {
    @discardableResult
    func separatorStyle(_ separatorStyle: UITableViewCell.SeparatorStyle) -> Self {
        self.separatorStyle = separatorStyle
        
        return self
    }
    
    @discardableResult
    func rowHeight(_ rowHeight: CGFloat) -> Self {
        self.rowHeight = rowHeight
        return self
    }
    
    @discardableResult
    func sectionHeaderHeight(_ sectionHeaderHeight: CGFloat) -> Self {
        self.sectionHeaderHeight = sectionHeaderHeight
        return self
    }
    
    @discardableResult
    func sectionFooterHeight(_ sectionFooterHeight: CGFloat) -> Self {
        self.sectionFooterHeight = sectionFooterHeight
        return self
    }
    
    @discardableResult
    func estimatedRowHeight(_ estimatedRowHeight: CGFloat) -> Self {
        self.estimatedRowHeight = estimatedRowHeight
        return self
    }
    
    @discardableResult
    func estimatedSectionHeaderHeight(_ estimatedSectionHeaderHeight: CGFloat) -> Self {
        self.estimatedSectionHeaderHeight = estimatedSectionHeaderHeight
        return self
    }
    
    @discardableResult
    func estimatedSectionFooterHeight(_ estimatedSectionFooterHeight: CGFloat) -> Self {
        self.estimatedSectionFooterHeight = estimatedSectionFooterHeight
        return self
    }
    
    @discardableResult
    func separatorInset(_ separatorInset: UIEdgeInsets) -> Self {
        self.separatorInset = separatorInset
        return self
    }
    
    @discardableResult
    func backgroundView(_ backgroundView: UIView?) -> Self {
        self.backgroundView = backgroundView
        return self
    }
    
    @discardableResult
    func sectionIndexMinimumDisplayRowCount(_ sectionIndexMinimumDisplayRowCount: Int) -> Self {
        self.sectionIndexMinimumDisplayRowCount = sectionIndexMinimumDisplayRowCount
        return self
    }
    
    @discardableResult
    func sectionIndexColor(_ sectionIndexColor: UIColor?) -> Self {
        self.sectionIndexColor = sectionIndexColor
        return self
    }
    
    @discardableResult
    func sectionIndexBackgroundColor(_ sectionIndexBackgroundColor: UIColor?) -> Self {
        self.sectionIndexBackgroundColor = sectionIndexBackgroundColor
        return self
    }
    
    @discardableResult
    func sectionIndexTrackingBackgroundColor(_ sectionIndexTrackingBackgroundColor: UIColor?) -> Self {
        self.sectionIndexTrackingBackgroundColor = sectionIndexTrackingBackgroundColor
        return self
    }
    
    @discardableResult
    func separatorColor(_ separatorColor: UIColor?) -> Self {
        self.separatorColor = separatorColor
        return self
    }
    
    @discardableResult
    func separatorEffect(_ separatorEffect: UIVisualEffect?) -> Self {
        self.separatorEffect = separatorEffect
        return self
    }
    
    @discardableResult
    func cellLayoutMarginsFollowReadableWidth(_ cellLayoutMarginsFollowReadableWidth: Bool) -> Self {
        self.cellLayoutMarginsFollowReadableWidth = cellLayoutMarginsFollowReadableWidth
        return self
    }
    
    @discardableResult
    func tableHeaderView(_ tableHeaderView: UIView?) -> Self {
        self.tableHeaderView = tableHeaderView
        return self
    }
    
    @discardableResult
    func tableFooterView(_ tableFooterView: UIView?) -> Self {
        self.tableFooterView = tableFooterView
        return self
    }
    
    @discardableResult
    func remembersLastFocusedIndexPath(_ remembersLastFocusedIndexPath: Bool) -> Self {
        self.remembersLastFocusedIndexPath = remembersLastFocusedIndexPath
        return self
    }
}
