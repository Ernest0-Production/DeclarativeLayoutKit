//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


public typealias ArrangedViewsBuilder = ArrayBuilder<UIStackViewElementConvertable>


public extension UIStackView {
    @discardableResult
    func set(@ArrangedViewsBuilder _ elements: () -> [UIStackViewElementConvertable]) -> Self {
        set(elements: elements())
        return self
    }
    
    @discardableResult
    func append(@ArrangedViewsBuilder _ elements: () -> [UIStackViewElementConvertable]) -> Self {
        append(elements: elements())
        return self
    }
}

// MARK: - Horizontal

public func HorizontalStack(_ elements: [UIStackViewElementConvertable]) -> UIStackView {
    let stack = UIStackView()
    stack.axis = NSLayoutConstraint.Axis.horizontal
    stack.append(elements: elements)
    return stack
}

public func HorizontalStack(@ArrangedViewsBuilder _ elements: () -> [UIStackViewElementConvertable]) -> UIStackView {
    HorizontalStack(elements())
}

public func TopStack(_ elements: [UIStackViewElementConvertable]) -> UIStackView {
    let stack = HorizontalStack(elements)
    stack.alignment = .top
    return stack
}

public func TopStack(@ArrangedViewsBuilder _ elements: () -> [UIStackViewElementConvertable]) -> UIStackView {
    TopStack(elements())
}

public func BottomStack(_ elements: [UIStackViewElementConvertable]) -> UIStackView {
    let stack = HorizontalStack(elements)
    stack.alignment = .bottom
    return stack
}

public func BottomStack(@ArrangedViewsBuilder _ elements: () -> [UIStackViewElementConvertable]) -> UIStackView {
    BottomStack(elements())
}

public func HorizontalCenterStack(_ elements: [UIStackViewElementConvertable]) -> UIStackView {
    let stack = HorizontalStack(elements)
    stack.alignment = .center
    return stack
}

public func HorizontalCenterStack(@ArrangedViewsBuilder _ elements: () -> [UIStackViewElementConvertable]) -> UIStackView {
    HorizontalCenterStack(elements())
}

// MARK: - Vertical

public func VerticalStack(_ elements: [UIStackViewElementConvertable]) -> UIStackView {
    let stack = UIStackView()
    stack.axis = NSLayoutConstraint.Axis.vertical
    stack.append(elements: elements)
    return stack
}

public func VerticalStack(@ArrangedViewsBuilder _ elements: () -> [UIStackViewElementConvertable]) -> UIStackView {
    VerticalStack(elements())
}

public func LeftStack(_ elements: [UIStackViewElementConvertable]) -> UIStackView {
    let stack = VerticalStack(elements)
    stack.alignment = .leading
    return stack
}

public func LeftStack(@ArrangedViewsBuilder _ elements: () -> [UIStackViewElementConvertable]) -> UIStackView {
    LeftStack(elements())
}

public func RightStack(_ elements: [UIStackViewElementConvertable]) -> UIStackView {
    let stack = VerticalStack(elements)
    stack.alignment = .trailing
    return stack
}

public func RightStack(@ArrangedViewsBuilder _ elements: () -> [UIStackViewElementConvertable]) -> UIStackView {
    RightStack(elements())
}

public func VerticalCenterStack(_ elements: [UIStackViewElementConvertable]) -> UIStackView {
    let stack = VerticalStack(elements)
    stack.alignment = .center
    return stack
}

public func VerticalCenterStack(@ArrangedViewsBuilder _ elements: () -> [UIStackViewElementConvertable]) -> UIStackView {
    VerticalCenterStack(elements())
}
