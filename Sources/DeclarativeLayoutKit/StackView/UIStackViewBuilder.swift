//
//  UIStackViewBuilder.swift
//  
//
//  Created by Бабаян Эрнест on 03.01.2021.
//

import UIKit


public extension UIStackView {
    /// Reset arrangedSubiews
    func set(elements: [UIStackViewElementConvertable]) {
        for subview in arrangedSubviews {
            removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
        
        append(elements: elements)
    }

    func append(elements: [UIStackViewElementConvertable]) {
        var lastAppendedItem: AutoLayoutItem?

        for element in elements {
            switch element.asUIStackViewElement() {
            case UIStackViewElement.space(let space):
                if let view = lastAppendedItem?.view {
                    setCustomSpacing(space, after: view)
                }
                lastAppendedItem = nil
                
            case UIStackViewElement.arranged(let itemBox):
                lastAppendedItem = itemBox.asAutoLayoutItem()
                addArrangedSubview(lastAppendedItem!.view)
                lastAppendedItem?.move(to: self)
                lastAppendedItem?.activate()
            }
        }
    }
}
