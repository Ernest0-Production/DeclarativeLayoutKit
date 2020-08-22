//
//  File.swift
//  
//
//  Created by Бабаян Эрнест on 22.08.2020.
//

import UIKit


public extension UILabel {
    @discardableResult
    func numberOfLines(_ count: Int) -> Self {
        self.numberOfLines = count
        
        return self
    }
    
    @discardableResult
    func text(_ text: String) -> Self {
        self.text = text
        
        return self
    }
    
    @discardableResult
    func attributedText(_ text: NSAttributedString) -> Self {
        self.attributedText = text
        
        return self
    }
    
    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        
        return self
    }
    
    @discardableResult
    func font(_ font: UIFont!) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    func textColor(_ textColor: UIColor!) -> Self {
        self.textColor = textColor
        return self
    }
    
    @discardableResult
    func shadowColor(_ shadowColor: UIColor?) -> Self {
        self.shadowColor = shadowColor
        return self
    }
    
    @discardableResult
    func shadowOffset(_ shadowOffset: CGSize) -> Self {
        self.shadowOffset = shadowOffset
        return self
    }
    
    @discardableResult
    func lineBreakMode(lineBreakMode: NSLineBreakMode) -> Self {
        self.lineBreakMode = lineBreakMode
        return self
    }
    
    @discardableResult
    func highlightedTextColor(_ highlightedTextColor: UIColor?) -> Self {
        self.highlightedTextColor = highlightedTextColor
        return self
    }
    
    @discardableResult
    func isHighlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    @discardableResult
    func isEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }
    
    @discardableResult
    func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }
    
    @discardableResult
    func baselineAdjustment(_ baselineAdjustment: UIBaselineAdjustment) -> Self {
        self.baselineAdjustment = baselineAdjustment
        return self
    }
    
    @discardableResult
    func minimumScaleFactor(_ minimumScaleFactor: CGFloat) -> Self {
        self.minimumScaleFactor = minimumScaleFactor
        return self
    }
    
    @discardableResult
    func allowsDefaultTighteningForTruncation(_ allowsDefaultTighteningForTruncation: Bool) -> Self {
        self.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation
        return self
    }
    
    @discardableResult
    func preferredMaxLayoutWidth(_ preferredMaxLayoutWidth: CGFloat) -> Self {
        self.preferredMaxLayoutWidth = preferredMaxLayoutWidth
        return self
    }
}
