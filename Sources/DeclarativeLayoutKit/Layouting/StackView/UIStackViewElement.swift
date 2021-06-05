//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


public enum UIStackViewElement {
    case arranged(UIView)
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

public typealias UIStackViewSpace = UIStackView.Space

public extension UIStackView {
    struct Space: UIStackViewElementConvertable {
        let value: CGFloat
        
        public init(_ value: CGFloat) {
            self.value = value
        }
        
        public func asUIStackViewElement() -> UIStackViewElement {
            UIStackViewElement.space(value)
        }
    }
}
