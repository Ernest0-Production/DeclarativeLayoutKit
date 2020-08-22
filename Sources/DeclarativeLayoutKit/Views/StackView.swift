//
//  File.swift
//  
//
//  Created by Бабаян Эрнест on 22.08.2020.
//

import UIKit


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
    
    @discardableResult
    func isBaselineRelativeArrangement(_ isBaselineRelativeArrangement: Bool) -> Self {
        self.isBaselineRelativeArrangement = isBaselineRelativeArrangement
        return self
    }
    @discardableResult
    func isLayoutMarginsRelativeArrangement(_ isLayoutMarginsRelativeArrangement: Bool) -> Self {
        self.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
        return self
    }
    
}
