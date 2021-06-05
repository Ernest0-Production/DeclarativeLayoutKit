//
//  UIStackViewBuilder.swift
//  
//
//  Created by Бабаян Эрнест on 03.01.2021.
//

import UIKit


public extension UIStackView {
    /// Reset arrangedSubiews
    func set(elements: [UIStackViewElementConvertable]) {
        for subview in arrangedSubviews {
            removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
        
        append(elements: elements)
    }

    func append(elements: [UIStackViewElementConvertable]) {
        var lastAppendedView: UIView?

        for element in elements {
            switch element.asUIStackViewElement() {
            case UIStackViewElement.space(let space):
                if let view = lastAppendedView {
                    setCustomSpacing(space, after: view)
                }
                lastAppendedView = nil
                
            case UIStackViewElement.arranged(let view):
                addArrangedSubview(view)
                lastAppendedView = view
            }
        }
    }
}


@resultBuilder
public enum ArrangedViewsBuilder {
    public typealias Expression = UIStackViewElementConvertable
    public typealias FinalResult = [Expression]
    
    public indirect enum Component {
        case expression(Expression)
        case block([Component])
        
        static func optional(_ component: Component?) -> Component {
            if let component = component { return .block([component]) }
            else { return .block([]) }
        }
    }
    
    public static func buildExpression(_ expression: Expression) -> Component { .expression(expression) }

    // composing
    public static func buildBlock(_ components: Component...) -> Component { .block(components) }
    
    // if let
    public static func buildOptional(_ component: Component?) -> Component { .optional(component) }
    
    // if
    public static func buildEither(first component: Component) -> Component { component }

    // else
    public static func buildEither(second component: Component) -> Component { component }
    
    // for .. in ..
    public static func buildArray(_ components: [Component]) -> Component { .block(components) }

    // if #available
    public static func buildLimitedAvailability(_ component: Component) -> Component { component }
    
    public static func buildFinalResult(_ component: Component) -> FinalResult {
        switch component {
        case .expression(let e): return [e]
        case .block(let children): return children.flatMap(buildFinalResult)
        }
    }
}
