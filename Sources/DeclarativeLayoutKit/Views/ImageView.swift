//
//  File.swift
//  
//
//  Created by Бабаян Эрнест on 22.08.2020.
//

import UIKit


public extension UIImageView {
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }
    
    @discardableResult
    func highlightedImage(_ image: UIImage?) -> Self {
        self.highlightedImage = image
        return self
    }
    
    func isHighlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }
    func animationImages(_ animationImages: [UIImage]?) -> Self {
        self.animationImages = animationImages
        return self
    }
    func highlightedAnimationImages(_ highlightedAnimationImages: [UIImage]?) -> Self {
        self.highlightedAnimationImages = highlightedAnimationImages
        return self
    }
    func animationDuration(_ animationDuration: TimeInterval) -> Self {
        self.animationDuration = animationDuration
        return self
    }
    func animationRepeatCount(_ animationRepeatCount: Int) -> Self {
        self.animationRepeatCount = animationRepeatCount
        return self
    }
    func tintColor(_ tintColor: UIColor) -> Self {
        self.tintColor = tintColor
        return self
    }
}

