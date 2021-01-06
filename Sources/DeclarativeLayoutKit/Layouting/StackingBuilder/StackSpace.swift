//
//  StackSpace.swift
//  
//
//  Created by Бабаян Эрнест on 03.01.2021.
//

import UIKit


public struct StackSpace {
    let value: CGFloat
    let priority: UILayoutPriority

    public init(_ value: CGFloat, priority: UILayoutPriority = .almostRequired) {
        self.value = value
        self.priority = priority
    }
}
