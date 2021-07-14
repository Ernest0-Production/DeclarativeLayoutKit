//
//  File.swift
//  
//
//  Created by Ernest Babayan on 06.06.2021.
//

import UIKit


struct RelativeAutoLayoutConstant {
    var value: CGFloat
    
    enum Kind { case inset, offset }
    
    var kind: Kind
    
    static var zero: Self { Self(value: .zero, kind: .inset) }
}

extension NSLayoutConstraint {
    func setConstant(_ constant: RelativeAutoLayoutConstant) {
        self.constant = {
            var value = constant.value
            
            if constant.kind == RelativeAutoLayoutConstant.Kind.offset { value = -value }
            
            if secondAttribute.isOpposite { value = -value }
            
            return value
        }()
    }
}

private extension NSLayoutConstraint.Attribute {
    var isOpposite: Bool {
        switch self {
        case .bottom, .bottomMargin, .right, .rightMargin, .trailing, .trailingMargin, .lastBaseline:
            return true
        default:
            return false
        }
    }
}
