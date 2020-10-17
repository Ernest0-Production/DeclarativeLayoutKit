//
//  UILayoutPriority.swift
//  
//
//  Created by Ernest0N on 12.10.2020.
//

import UIKit


extension UILayoutPriority: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(rawValue: Float(value))
    }
}
