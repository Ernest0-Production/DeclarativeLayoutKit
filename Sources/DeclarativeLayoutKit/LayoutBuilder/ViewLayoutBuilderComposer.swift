//
//  ViewLayoutBuilderComposer.swift
//  
//
//  Created by Бабаян Эрнест on 12.10.2020.
//

import Foundation
import UIKit


@_functionBuilder
public struct ViewLayoutBuilderComposer {
    public static func buildBlock(_ builder: ViewLayoutBuilderConvertible) -> [ViewLayoutBuilderConvertible]  {
        [builder]
    }

    public static func buildBlock(_ builders: ViewLayoutBuilderConvertible...) -> [ViewLayoutBuilderConvertible]  {
        builders
    }
}

public protocol ViewConvertible {
    func asUIView() -> UIView
}

public extension ViewConvertible {
    func subviews(@ViewLayoutBuilderComposer _ builders: @escaping () -> [ViewLayoutBuilderConvertible]) -> Self {
        for builder in builders().map({ $0.asViewLayoutBuilder() }) {
            asUIView().addSubview(builder.view)
            builder.build()
        }

        return self
    }
}
