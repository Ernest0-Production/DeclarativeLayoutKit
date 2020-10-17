//
//  ViewStyleCompatible.swift
//  
//
//  Created by Ernest0N on 13.10.2020.
//


public protocol ViewStyleCompatible {}

extension ViewStyleCompatible {
    @discardableResult
    public func set(style styles: ViewStyle<Self>...) -> Self {
        styles.merge().apply(into: self)
        return self
    }
}

import UIKit

extension UIView: ViewStyleCompatible {}
