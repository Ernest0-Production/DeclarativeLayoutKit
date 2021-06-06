//
//  File.swift
//  
//
//  Created by Ernest Babayan on 06.06.2021.
//


@resultBuilder
public enum ArrayBuilder<E> {
    public typealias Expression = E
    public typealias FinalResult = [E]
    
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
