//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit

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

public func TopAlignmentStack(_ elements: [UIStackViewElementConvertable]) -> UIStackView {
    let stack = VerticalStack(elements)
    stack.alignment = .top
    return stack
}

public func TopAlignmentStack(@ArrangedViewsBuilder _ elements: () -> [UIStackViewElementConvertable]) -> UIStackView {
    TopAlignmentStack(elements())
}

public func BottomAlignmentStack(_ elements: [UIStackViewElementConvertable]) -> UIStackView {
    let stack = VerticalStack(elements)
    stack.alignment = .bottom
    return stack
}

public func BottomAlignmentStack(@ArrangedViewsBuilder _ elements: () -> [UIStackViewElementConvertable]) -> UIStackView {
    BottomAlignmentStack(elements())
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

public func LeftAlignmentStack(_ elements: [UIStackViewElementConvertable]) -> UIStackView {
    let stack = HorizontalStack(elements)
    stack.alignment = .leading
    return stack
}

public func LeftAlignmentStack(@ArrangedViewsBuilder _ elements: () -> [UIStackViewElementConvertable]) -> UIStackView {
    LeftAlignmentStack(elements())
}

public func RightAlignmentStack(_ elements: [UIStackViewElementConvertable]) -> UIStackView {
    let stack = HorizontalStack(elements)
    stack.alignment = .trailing
    return stack
}

public func RightAlignmentStack(@ArrangedViewsBuilder _ elements: () -> [UIStackViewElementConvertable]) -> UIStackView {
    RightAlignmentStack(elements())
}

public func VerticalCenterStack(_ elements: [UIStackViewElementConvertable]) -> UIStackView {
    let stack = VerticalStack(elements)
    stack.alignment = .center
    return stack
}

public func VerticalCenterStack(@ArrangedViewsBuilder _ elements: () -> [UIStackViewElementConvertable]) -> UIStackView {
    VerticalCenterStack(elements())
}
