//
//  File.swift
//  
//
//  Created by Бабаян Эрнест on 22.08.2020.
//

import UIKit


public extension UIButton {
    @discardableResult
    func text(_ text: String, for state: UIControl.State = .normal) -> Self {
        self.setTitle(text, for: state)
        
        return self
    }
    
    @discardableResult
    func attributedText(_ text: NSAttributedString?, for state: UIControl.State = .normal) -> Self {
        self.setAttributedTitle(text, for: state)
        
        return self
    }
    
    @discardableResult
    func contentEdgeInsets(_ contentEdgeInsets: UIEdgeInsets) -> Self {
        self.contentEdgeInsets = contentEdgeInsets
        
        return self
    }
    
    @discardableResult
    func titleEdgeInsets(_ titleEdgeInsets: UIEdgeInsets) -> Self {
        self.titleEdgeInsets = titleEdgeInsets
        
        return self
    }
    
    @discardableResult
    func imageEdgeInsets(_ imageEdgeInsets: UIEdgeInsets) -> Self {
        self.imageEdgeInsets = imageEdgeInsets
        
        return self
    }
    
    @discardableResult
    func imageContentMode(_ contentMode: UIView.ContentMode) -> Self {
        self.imageView?.contentMode = contentMode
        
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        self.setImage(image, for: state)
        
        return self
    }
    
    @discardableResult
    func backgroundImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        self.setBackgroundImage(image, for: state)
        
        return self
    }
    
    @discardableResult
    func adjustsImageWhenHighlighted(_ adjustsImageWhenHighlighted: Bool) -> Self {
        self.adjustsImageWhenHighlighted = adjustsImageWhenHighlighted
        return self
    }
    
    @discardableResult
    func adjustsImageWhenDisabled(_ adjustsImageWhenDisabled: Bool) -> Self {
        self.adjustsImageWhenDisabled = adjustsImageWhenDisabled
        return self
    }
    
    @discardableResult
    func showsTouchWhenHighlighted(_ showsTouchWhenHighlighted: Bool) -> Self {
        self.showsTouchWhenHighlighted = showsTouchWhenHighlighted
        return self
    }
    
    @discardableResult
    func tintColor(_ tintColor: UIColor) -> Self {
        self.tintColor = tintColor
        return self
    }
    
    @discardableResult
    func titleColor(_ color: UIColor, for state: UIControl.State = .normal) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }
    
    func titleShadowColor(_ color: UIColor, for state: UIControl.State = .normal) -> Self {
        self.setTitleShadowColor(color, for: state)
        return self
    }
    
    
}
