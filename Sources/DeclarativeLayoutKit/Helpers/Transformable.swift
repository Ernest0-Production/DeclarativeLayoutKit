//
//  File.swift
//  
//
//  Created by Бабаян Эрнест on 18.07.2020.
//

import Foundation


protocol Transformable {
    typealias Transform = (inout Self) -> ()
}

extension Transformable {
    @discardableResult
    public func transform(_ transform: Transform) -> Self {
        var mutable = self
        transform(&mutable)
        
        return mutable
    }
}

extension NSObject: Transformable {}
