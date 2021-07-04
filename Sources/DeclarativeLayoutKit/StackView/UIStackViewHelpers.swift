//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


public typealias StackViewConfigurationsComposer = ArrayBuilder<UIStackViewConfiguration>


public extension UIStackView {
    @discardableResult
    func set(@StackViewConfigurationsComposer _ elements: () -> [UIStackViewConfiguration]) -> Self {
        set(elements: elements())
        return self
    }
    
    @discardableResult
    func append(@StackViewConfigurationsComposer _ elements: () -> [UIStackViewConfiguration]) -> Self {
        append(elements: elements())
        return self
    }
}

// MARK: - Horizontal

public func HorizontalStack(_ elements: [UIStackViewConfiguration]) -> UIStackView {
    let stack = UIStackView()
    stack.axis = NSLayoutConstraint.Axis.horizontal
    stack.append(elements: elements)
    return stack
}

public func HorizontalStack(@StackViewConfigurationsComposer _ elements: () -> [UIStackViewConfiguration]) -> UIStackView {
    HorizontalStack(elements())
}

public func TopStack(_ elements: [UIStackViewConfiguration]) -> UIStackView {
    let stack = HorizontalStack(elements)
    stack.alignment = .top
    return stack
}

public func TopStack(@StackViewConfigurationsComposer _ elements: () -> [UIStackViewConfiguration]) -> UIStackView {
    TopStack(elements())
}

public func BottomStack(_ elements: [UIStackViewConfiguration]) -> UIStackView {
    let stack = HorizontalStack(elements)
    stack.alignment = .bottom
    return stack
}

public func BottomStack(@StackViewConfigurationsComposer _ elements: () -> [UIStackViewConfiguration]) -> UIStackView {
    BottomStack(elements())
}

public func HorizontalCenterStack(_ elements: [UIStackViewConfiguration]) -> UIStackView {
    let stack = HorizontalStack(elements)
    stack.alignment = .center
    return stack
}

public func HorizontalCenterStack(@StackViewConfigurationsComposer _ elements: () -> [UIStackViewConfiguration]) -> UIStackView {
    HorizontalCenterStack(elements())
}

// MARK: - Vertical

public func VerticalStack(_ elements: [UIStackViewConfiguration]) -> UIStackView {
    let stack = UIStackView()
    stack.axis = NSLayoutConstraint.Axis.vertical
    stack.append(elements: elements)
    return stack
}

public func VerticalStack(@StackViewConfigurationsComposer _ elements: () -> [UIStackViewConfiguration]) -> UIStackView {
    VerticalStack(elements())
}

public func LeftStack(_ elements: [UIStackViewConfiguration]) -> UIStackView {
    let stack = VerticalStack(elements)
    stack.alignment = .leading
    return stack
}

public func LeftStack(@StackViewConfigurationsComposer _ elements: () -> [UIStackViewConfiguration]) -> UIStackView {
    LeftStack(elements())
}

public func RightStack(_ elements: [UIStackViewConfiguration]) -> UIStackView {
    let stack = VerticalStack(elements)
    stack.alignment = .trailing
    return stack
}

public func RightStack(@StackViewConfigurationsComposer _ elements: () -> [UIStackViewConfiguration]) -> UIStackView {
    RightStack(elements())
}

public func VerticalCenterStack(_ elements: [UIStackViewConfiguration]) -> UIStackView {
    let stack = VerticalStack(elements)
    stack.alignment = .center
    return stack
}

public func VerticalCenterStack(@StackViewConfigurationsComposer _ elements: () -> [UIStackViewConfiguration]) -> UIStackView {
    VerticalCenterStack(elements())
}
