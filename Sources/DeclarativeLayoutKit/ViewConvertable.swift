//
//  Layout.swift
//  revitonica
//
//  Created by Danil Lahtin on 16/06/2019.
//

import Foundation
import UIKit
import SnapKit


public protocol ViewConvertable {
    func asView() -> UIView
}

extension ViewConvertable where Self: UIView {
    public func asView() -> UIView { self }
}

extension ViewConvertable {
    private var view: UIView { asView() }
}

extension UIView: ViewConvertable {}


public extension ViewConvertable {
    @discardableResult
    func backgroundColor(_ color: UIColor?) -> Self {
        view.transform({ $0.backgroundColor = color })
        
        return self
    }
    
    @discardableResult
    func tintColor(_ color: UIColor) -> Self {
        view.transform({ $0.tintColor = color })
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        view.transform({ $0.isUserInteractionEnabled = isUserInteractionEnabled })
        return self
    }
    
    @discardableResult
    func transform(_ transform: CGAffineTransform) -> Self {
        view.transform({ $0.transform = transform })
        return self
    }
    
    @discardableResult
    func clipsToBounds(_ clipsToBounds: Bool) -> Self {
        view.transform({ $0.clipsToBounds = clipsToBounds })
        return self
    }
    
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Self {
        view.transform({ $0.alpha = alpha })
        return self
    }
    
    @discardableResult
    func isOpaque(_ isOpaque: Bool) -> Self {
        view.transform({ $0.isOpaque = isOpaque })
        return self
    }
    
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        view.transform({ $0.isHidden = isHidden })
        return self
    }
    
    @discardableResult
    func contentMode(_ contentMode: UIView.ContentMode) -> Self {
        view.transform({ $0.contentMode = contentMode })
        return self
    }
    
    @discardableResult
    func mask(_ mask: UIView?) -> Self {
        view.transform({ $0.mask = mask })
        return self
    }
    
    @discardableResult
    func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode) -> Self {
        view.transform({ $0.tintAdjustmentMode = tintAdjustmentMode })
        return self
    }
    
    @discardableResult
    func hugging(x: UILayoutPriority? = nil, y: UILayoutPriority? = nil) -> Self {
        if let x = x {
            view.setContentHuggingPriority(x, for: .horizontal)
        }
        
        if let y = y {
            view.setContentHuggingPriority(y, for: .vertical)
        }
        
        return self
    }
    
    @discardableResult
    func compression(x: UILayoutPriority? = nil, y: UILayoutPriority? = nil) -> Self {
        if let x = x {
            view.setContentCompressionResistancePriority(x, for: .horizontal)
        }
        
        if let y = y {
            view.setContentCompressionResistancePriority(y, for: .vertical)
        }
        
        return self
    }
    
    @discardableResult
    func assign<Target: UIView>(to object: inout Target?) -> Self {
        object = view as? Target
        
        return self
    }
    
    // MARK: - Layer
    
    @discardableResult
    func cornerRadius(_ cornerRadius: CGFloat) -> Self {
        view.transform({ $0.layer.cornerRadius = cornerRadius })
        return self
    }
    
    @discardableResult
    func borderWidth(_ borderWidth: CGFloat) -> Self {
        view.transform({ $0.layer.borderWidth = borderWidth })
        return self
    }
    
    @discardableResult
    func borderColor(_ borderColor: UIColor?) -> Self {
        view.transform({ $0.layer.borderColor = borderColor?.cgColor })
        return self
    }
    
    @discardableResult
    func shadowColor(_ shadowColor: UIColor?) -> Self {
        view.transform({ $0.layer.shadowColor = shadowColor?.cgColor })
        return self
    }
    
    @discardableResult
    func shadowOpacity(_ shadowOpacity: Float) -> Self {
        view.transform({ $0.layer.shadowOpacity = shadowOpacity })
        return self
    }
    
    @discardableResult
    func shadowOffset(_ shadowOffset: CGSize) -> Self {
        view.transform({ $0.layer.shadowOffset = shadowOffset })
        return self
    }
    
    @discardableResult
    func shadowRadius(_ shadowRadius: CGFloat) -> Self {
        view.transform({ $0.layer.shadowRadius = shadowRadius })
        return self
    }
    
    @discardableResult
    func shadowPath(_ shadowPath: CGPath?) -> Self {
        view.transform({ $0.layer.shadowPath = shadowPath })
        return self
    }
    
    // MARK: - Layout
    
    @discardableResult
    func width(_ width: CGFloat, priority: UILayoutPriority = 999) -> Self {
        view.snp.makeConstraints { $0.width.equalTo(width).priority(priority) }
        return self
    }
    
    @discardableResult
    func minWidth(_ width: CGFloat, priority: UILayoutPriority = .init(999)) -> Self {
        view.snp.makeConstraints { $0.width.lessThanOrEqualTo(width).priority(priority) }
        return self
    }
    
    @discardableResult
    func maxWidth(_ width: CGFloat, priority: UILayoutPriority = .init(999)) -> Self {
        view.snp.makeConstraints { $0.width.greaterThanOrEqualTo(width).priority(priority) }
        return self
    }
    
    @discardableResult
    func height(_ height: CGFloat, priority: UILayoutPriority = 999) -> Self {
        view.snp.makeConstraints { $0.height.equalTo(height).priority(priority) }
        return self
    }
    
    @discardableResult
    func minHeight(_ height: CGFloat, priority: UILayoutPriority = 999) -> Self {
        view.snp.makeConstraints { $0.height.lessThanOrEqualTo(height).priority(priority) }
        return self
    }
    
    @discardableResult
    func maxHeight(_ height: CGFloat, priority: UILayoutPriority = 999) -> Self {
        view.snp.makeConstraints { $0.height.greaterThanOrEqualTo(height).priority(priority) }
        return self
    }
    
    @discardableResult
    func size(_ size: CGSize, priority: UILayoutPriority = .init(999)) -> Self {
        self.height(size.height, priority: priority)
            .width(size.width, priority: priority)
    }
}


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
}

public extension UIStackView {
    @discardableResult
    func spacing(_ value: CGFloat) -> Self {
        self.spacing = value
        return self
    }
    
    @discardableResult
    func alignment(_ alignment: UIStackView.Alignment) -> Self {
        self.alignment = alignment
        return self
    }
    
    @discardableResult
    func axis(_ axis: NSLayoutConstraint.Axis) -> Self {
        self.axis = axis
        return self
    }
    
    @discardableResult
    func distribution(_ distribution: UIStackView.Distribution) -> Self {
        self.distribution = distribution
        return self
    }
}

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
}

public extension UIButton {
    @discardableResult
    func text(_ text: String, for state: UIControl.State = .normal) -> Self {
        self.setTitle(text, for: state)
        
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
}

public extension UIScrollView {
    @discardableResult
    func contentInset(_ contentInset: Insets) -> Self {
        self.contentInset = contentInset
        
        return self
    }
    
    @discardableResult
    func showsVerticalScrollIndicator(_ value: Bool) -> Self {
        self.showsVerticalScrollIndicator = value
        
        return self
    }
    
    @discardableResult
     func showsHorizontalScrollIndicator(_ value: Bool) -> Self {
         self.showsHorizontalScrollIndicator = value
         
         return self
     }
}

public extension UITableView {
    @discardableResult
    func separatorStyle(_ separatorStyle: UITableViewCell.SeparatorStyle) -> Self {
        self.separatorStyle = separatorStyle
        
        return self
    }
}

public extension UIImageView {
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.image = image
        
        return self
    }
}


extension UILayoutPriority: ExpressibleByFloatLiteral {
    public typealias FloatLiteralType = Float
    
    public init(floatLiteral value: Float) {
        self.init(rawValue: value)
    }
}

extension UILayoutPriority: ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = Int
    
    public init(integerLiteral value: Int) {
        self.init(rawValue: Float(value))
    }
}


public extension NSLayoutConstraint {
    @discardableResult
    func priority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        
        return self
    }
}


extension CGSize: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self.init(width: value, height: value)
    }
}

extension CGSize: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(width: value, height: value)
    }
}
