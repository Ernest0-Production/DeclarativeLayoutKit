//
//  UIStackViewBuilder.swift
//  
//
//  Created by Бабаян Эрнест on 03.01.2021.
//

import UIKit


public extension UIStackView {
    /// Reset arrangedSubiews
    func set(elements: [UIStackViewConfiguration]) {
        for subview in arrangedSubviews {
            removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
        
        append(elements: elements)
    }

    func append(elements: [UIStackViewConfiguration]) {
        for element in elements {
            element.configure(stackView: self)
        }
    }
}
