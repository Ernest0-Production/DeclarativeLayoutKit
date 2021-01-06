//
//  UIStackViewBuilder.swift
//  
//
//  Created by Бабаян Эрнест on 03.01.2021.
//

import UIKit


public func HStackView(_ elements: [UIStackViewElementConvertable]) -> UIStackView {
    let stack = UIStackView()
    stack.axis = NSLayoutConstraint.Axis.horizontal
    stack.add(elements: elements)
    return stack
}

public func VStackView(_ elements: [UIStackViewElementConvertable]) -> UIStackView {
    let stack = UIStackView()
    stack.axis = NSLayoutConstraint.Axis.vertical
    stack.add(elements: elements)
    return stack
}

public extension UIStackView {
    /// Rewrite arrangedSubiews
    func set(elements: [UIStackViewElementConvertable]) {
        for subview in arrangedSubviews {
            removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }

        add(elements: elements)
    }

    func add(elements: [UIStackViewElementConvertable]) {
        var lastAddedView: UIView?

        for element in elements {
            switch element.asUIStackViewElement() {
            case UIStackViewElement.space(let space):
                if #available(iOS 11.0, *), let view = lastAddedView {
                    setCustomSpacing(space, after: view)
                }
                lastAddedView = nil
            case UIStackViewElement.arranged(let view):
                addArrangedSubview(view)
                lastAddedView = view
            }
        }
    }
}

public enum UIStackViewElement {
    case arranged(UIView)
    @available(iOS 11.0, *)
    case space(CGFloat)
}

public protocol UIStackViewElementConvertable {
    func asUIStackViewElement() -> UIStackViewElement
}

extension UIView: UIStackViewElementConvertable {
    public func asUIStackViewElement() -> UIStackViewElement {
        UIStackViewElement.arranged(self)
    }
}

@available(iOS 11.0, *)
public struct UIStackViewSpace: UIStackViewElementConvertable {
    let value: CGFloat

    public init(_ value: CGFloat) {
        self.value = value
    }

    public func asUIStackViewElement() -> UIStackViewElement {
        UIStackViewElement.space(value)
    }
}
