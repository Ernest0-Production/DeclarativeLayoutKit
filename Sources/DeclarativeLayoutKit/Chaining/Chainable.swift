//
//  Chainable.swift
//  
//
//  Created by Бабаян Эрнест on 04.12.2020.
//

import UIKit

public protocol Chainable {}

public extension Chainable {
    @inlinable
    @discardableResult
    func setting<Value>(_ keyPath: ReferenceWritableKeyPath<Self, Value>, to value: Value) -> Self {
        self[keyPath: keyPath] = value
        return self
    }

    @inlinable
    @discardableResult
    func applying(_ transform: (inout Self) -> Void) -> Self {
        var copy = self
        transform(&copy)
        return copy
    }

    func assign<T>(to variable: inout T) -> Self {
        if let casted = self as? T {
            variable = casted
        } else {
            preconditionFailure("Can't cast \(Self.self) to \(T.self)")
        }

        return self
    }
}

extension NSObject: Chainable {}
extension Optional: Chainable where Wrapped: Chainable {}
