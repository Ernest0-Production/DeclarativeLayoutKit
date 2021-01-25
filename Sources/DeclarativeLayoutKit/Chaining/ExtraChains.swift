//
//  ExtraChains.swift
//  
//
//  Created by Ernest0N on 26.09.2020.
//

import UIKit


public extension UIView {
    // MARK: - Hugging and Compression priority

    @discardableResult
    func hugging(x: UILayoutPriority) -> Self {
        self.setContentHuggingPriority(x, for: .horizontal)
        return self
    }

    @discardableResult
    func hugging(y: UILayoutPriority) -> Self {
        self.setContentHuggingPriority(y, for: .vertical)
        return self
    }

    @discardableResult
    func hugging(_ both: UILayoutPriority) -> Self {
        return hugging(x: both, y: both)
    }

    @discardableResult
    func hugging(x: UILayoutPriority, y: UILayoutPriority) -> Self {
        hugging(x: x).hugging(y: y)
    }

    @discardableResult
    func compression(x: UILayoutPriority) -> Self {
        self.setContentCompressionResistancePriority(x, for: .horizontal)
        return self
    }

    @discardableResult
    func compression(y: UILayoutPriority) -> Self {
        self.setContentCompressionResistancePriority(y, for: .vertical)
        return self
    }

    @discardableResult
    func compression(_ both: UILayoutPriority) -> Self {
        compression(x: both, y: both)
    }

    @discardableResult
    func compression(x: UILayoutPriority, y: UILayoutPriority) -> Self {
        compression(x: x).hugging(y: y)
    }

    // MARK: - Layer

    @discardableResult
    func cornerRadius(_ cornerRadius: CGFloat) -> Self {
        self.layer.cornerRadius = cornerRadius
        return self
    }

    @discardableResult
    func borderWidth(_ borderWidth: CGFloat) -> Self {
        self.layer.borderWidth = borderWidth
        return self
    }

    @discardableResult
    func borderColor(_ borderColor: UIColor?) -> Self {
        self.layer.borderColor = borderColor?.cgColor
        return self
    }

    @discardableResult
    func shadowOpacity(_ shadowOpacity: Float) -> Self {
        self.layer.shadowOpacity = shadowOpacity
        return self
    }

    @discardableResult
    func shadowRadius(_ shadowRadius: CGFloat) -> Self {
        self.layer.shadowRadius = shadowRadius
        return self
    }

    @discardableResult
    func shadowPath(_ shadowPath: CGPath?) -> Self {
        self.layer.shadowPath = shadowPath
        return self
    }

    @discardableResult
    func shadowColor(_ shadowColor: UIColor?) -> Self {
        self.layer.shadowColor = shadowColor?.cgColor
        return self
    }

    @discardableResult
    func shadowOffset(_ newValue: CGSize) -> Self {
        self.layer.shadowOffset = newValue
        return self
    }

    // MARK: - Frame

    @discardableResult
    func frameSize(_ newValue: CGSize) -> Self {
        self.frame.size = newValue
        return self
    }

    @discardableResult
    func frameWidth(_ newValue: CGFloat) -> Self {
        self.frame.size.width = newValue
        return self
    }

    @discardableResult
    func frameHeight(_ newValue: CGFloat) -> Self {
        self.frame.size.height = newValue
        return self
    }

    @discardableResult
    func frameOrigin(_ newValue: CGPoint) -> Self {
        self.frame.origin = newValue
        return self
    }

    @discardableResult
    func boundsSize(_ newValue: CGSize) -> Self {
        self.bounds.size = newValue
        return self
    }

    @discardableResult
    func boundsWidth(_ newValue: CGFloat) -> Self {
        self.bounds.size.width = newValue
        return self
    }

    @discardableResult
    func boundsHeight(_ newValue: CGFloat) -> Self {
        self.bounds.size.height = newValue
        return self
    }

    @discardableResult
    func boundsOrigin(_ newValue: CGPoint) -> Self {
        self.bounds.origin = newValue
        return self
    }
}

public extension UILabel {
    @discardableResult
    func textShadowOffset(_ offset: CGSize) -> Self {
        self.shadowOffset = offset
        return self
    }

    @discardableResult
    func textShadowColor(_ color: UIColor) -> Self {
        self.shadowColor = color
        return self
    }
}

public extension UIControl {
    @discardableResult
    func target(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) -> Self {
        self.addTarget(target, action: action, for: controlEvents)
        return self
    }
}

public extension UIButton {
    @discardableResult
    func title(_ value: String, for state: UIControl.State = .normal) -> Self {
        self.setTitle(value, for: state)
        return self
    }

    @discardableResult
    func attributedTitle(_ value: NSAttributedString?, for state: UIControl.State = .normal) -> Self {
        self.setAttributedTitle(value, for: state)
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
    func titleColor(_ color: UIColor, for state: UIControl.State = .normal) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }

    func titleShadowColor(_ color: UIColor, for state: UIControl.State = .normal) -> Self {
        self.setTitleShadowColor(color, for: state)
        return self
    }
}
