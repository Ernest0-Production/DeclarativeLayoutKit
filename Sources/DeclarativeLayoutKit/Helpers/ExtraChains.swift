//
//  ExtraChains.swift
//  
//
//  Created by Ernest0N on 26.09.2020.
//

import UIKit


extension Optional {
    func ifNotNil(_ execute: (Wrapped) -> Void) {
        flatMap(execute)
    }
}

public extension UIView {
    @discardableResult
    func hugging(x: UILayoutPriority? = nil, y: UILayoutPriority? = nil) -> Self {
        x.ifNotNil({ self.setContentHuggingPriority($0, for: .horizontal) })
        y.ifNotNil({ self.setContentHuggingPriority($0, for: .vertical) })
        return self
    }

    @discardableResult
    func compression(x: UILayoutPriority? = nil, y: UILayoutPriority? = nil) -> Self {
        x.ifNotNil({ self.setContentCompressionResistancePriority($0, for: .horizontal) })
        y.ifNotNil({ self.setContentCompressionResistancePriority($0, for: .vertical) })
        return self
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

public func HStackView(_ views: [UIView]) -> UIStackView {
    UIStackView(arrangedSubviews: views).axis(.horizontal)
}

public func VStackView(_ views: [UIView]) -> UIStackView {
    UIStackView(arrangedSubviews: views).axis(.vertical)
}
