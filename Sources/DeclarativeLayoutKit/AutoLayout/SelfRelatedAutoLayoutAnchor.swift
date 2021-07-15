//
//  File.swift
//  
//
//  Created by Ernest Babayan on 07.07.2021.
//

import UIKit


public final class SelfRelated<Value> {
    public typealias ValuePath = (UIView) -> Value
    
    private let valuePath: ValuePath
    
    init(_ targetPath: @escaping ValuePath) {
        self.valuePath = targetPath
    }
    
    public static func to(_ targetPath: @escaping ValuePath) -> Self {
        Self(targetPath)
    }
    
    func value(from view: UIView) -> Value { valuePath(view) }
}
