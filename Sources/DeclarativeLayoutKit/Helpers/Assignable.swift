//
//  ArrayBuilder.swift
//  
//
//  Created by Бабаян Эрнест on 26.09.2020.
//

import Foundation

public protocol Assignable {
    func assign<T: Assignable>(to variable: inout T) -> Self
}

public extension Assignable {
    func assign<T: Assignable>(to variable: inout T) -> Self {
        if let casted = self as? T {
            variable = casted
        } else {
            preconditionFailure("Can't cast \(Self.self) to \(T.self)")
        }

        return self
    }
}

extension NSObject: Assignable {}
extension Optional: Assignable {}
