//
//  KeyPathChainable.swift
//  
//
//  Created by Бабаян Эрнест on 04.12.2020.
//

import UIKit


public protocol KeyPathChainable {}

public extension KeyPathChainable {
    @inlinable
    @discardableResult
    func setting<Value>(_ keyPath: ReferenceWritableKeyPath<Self, Value>, to value: Value) -> Self {
        self[keyPath: keyPath] = value
        return self
    }

    @inlinable
    @discardableResult
    func optionalSetting<Value>(_ keyPath: ReferenceWritableKeyPath<Self, Value>, to value: Value?) -> Self {
        if let value = value {
            self[keyPath: keyPath] = value
        }
        return self
    }
}

extension UIView: KeyPathChainable {}

