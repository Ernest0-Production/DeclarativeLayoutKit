//
//  File.swift
//  
//
//  Created by Бабаян Эрнест on 18.07.2020.
//

import UIKit

public func HStack(_ subviews: [UIView]) -> UIStackView {
    let stack = UIStackView(arrangedSubviews: subviews)
    stack.axis = .horizontal
    
    return stack
}


public func VStack(_ subviews: [UIView]) -> UIStackView {
    let stack = UIStackView(arrangedSubviews: subviews)
    stack.axis = .vertical
    
    return stack
}
