//
//  ArrayBuilder.swift
//  
//
//  Created by Бабаян Эрнест on 14.10.2020.
//

@_functionBuilder
public struct ArrayBuilder<Element> {
    public static func buildBlock( _ elements: Element...) -> [Element] {
        elements
    }

    public static func buildBlock( _ element: Element) -> [Element] {
        [element]
    }
}
