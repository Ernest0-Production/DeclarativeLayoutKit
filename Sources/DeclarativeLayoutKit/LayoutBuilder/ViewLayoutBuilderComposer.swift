//
//  ViewLayoutBuilderComposer.swift
//  
//
//  Created by Бабаян Эрнест on 12.10.2020.
//

import Foundation

@_functionBuilder
public struct ViewLayoutBuilderComposer {
    public static func buildBlock(_ builder: ViewLayoutBuilderConvertible) -> [ViewLayoutBuilderConvertible]  {
        [builder]
    }

    public static func buildBlock(_ builders: ViewLayoutBuilderConvertible...) -> [ViewLayoutBuilderConvertible]  {
        builders
    }
}

import UIKit

public protocol ViewConvertible {
    func asUIView() -> UIView
}

public extension ViewConvertible {
    func subviews(@ViewLayoutBuilderComposer _ builders: @escaping () -> [ViewLayoutBuilderConvertible]) -> Self {
        for item in builders().map({ $0.asViewLayoutBuilder() }) {
            asUIView().addSubview(item.view)
            item.build()
        }

        return self
    }
}
