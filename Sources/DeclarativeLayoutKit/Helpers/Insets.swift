//
//  File.swift
//  
//
//  Created by Бабаян Эрнест on 18.07.2020.
//

import UIKit

extension UIEdgeInsets: Transformable {}

extension UIEdgeInsets {
    static let contentInsets: UIEdgeInsets = .side(16)
    
    init(inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    static func top(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: value, left: 0, bottom: 0, right: 0)
    }
    
    static func left(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: value, bottom: 0, right: 0)
    }
    
    static func bottom(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: value, right: 0)
    }
    
    static func right(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: value)
    }
    
    static func side(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: value, bottom: 0, right: value)
    }
    
    static func horizontal(_ value: CGFloat) -> UIEdgeInsets {
        return side(value)
    }
    
    static func vertical(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: value, left: 0, bottom: value, right: 0)
    }
    
    static func + (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
        return lhs.transform({
            $0.top += rhs.top
            $0.bottom += rhs.bottom
            $0.left += rhs.left
            $0.right += rhs.right
        })
    }
}


extension UIEdgeInsets: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(inset: CGFloat(value))
    }
}


extension UIEdgeInsets: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Float) {
        self.init(inset: CGFloat(value))
    }
}
