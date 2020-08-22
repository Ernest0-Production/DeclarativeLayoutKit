//
//  File.swift
//  
//
//  Created by Бабаян Эрнест on 22.08.2020.
//

import UIKit


public extension UIControl {
    @discardableResult
    func target(_ target: Any?, action: Selector, for controlEvents: UIControl.Event = .touchUpInside) -> Self {
        self.addTarget(target, action: action, for: controlEvents)
        
        return self
    }
    
    
    @discardableResult
    func contentHorizontalAlignment(_ contentHorizontalAlignment: UIControl.ContentHorizontalAlignment) -> Self {
        self.contentHorizontalAlignment = contentHorizontalAlignment
        
        return self
    }
    
    func isEnabled(isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }
    
    func isSelected(isSelected: Bool) -> Self {
        self.isSelected = isSelected
        return self
    }
    
    func isHighlighted(isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }
    
    func contentVerticalAlignment(contentVerticalAlignment: UIControl.ContentVerticalAlignment) -> Self {
        self.contentVerticalAlignment = contentVerticalAlignment
        return self
    }

    
    func contentHorizontalAlignment(contentHorizontalAlignment: UIControl.ContentHorizontalAlignment) -> Self {
        self.contentHorizontalAlignment = contentHorizontalAlignment
        return self
    }
}
