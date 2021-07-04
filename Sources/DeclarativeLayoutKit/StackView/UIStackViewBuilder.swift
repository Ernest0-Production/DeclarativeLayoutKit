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
        for element in elements {
            switch element.asUIStackViewElement() {
            case UIStackViewElement.space(let space):
                guard let view = arrangedSubviews.last else {
                    assertionFailure("You cannot add a space before the first arranged view")
                    continue
                }
                
                var finalSpace = space
                
                let currentSpaces = customSpacing(after: view)
                let systemSpaces = [UIStackView.spacingUseDefault, UIStackView.spacingUseSystem]
                if !systemSpaces.contains(currentSpaces) {
                    finalSpace += currentSpaces
                }
                
                setCustomSpacing(finalSpace, after: view)
                
            case UIStackViewElement.arranged(let itemBox):
                let item = itemBox.asAutoLayoutItem()
                addArrangedSubview(item.view)
                item.move(to: self)
                item.activate()
            }
        }
    }
}
