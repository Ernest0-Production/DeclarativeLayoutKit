//
//  ViewLayoutBuilderComposer.swift
//  
//
//  Created by Бабаян Эрнест on 12.10.2020.
//

import Foundation
import UIKit


@_functionBuilder
public struct ViewContainerBuilder {
    public static func buildBlock(_ builder: ViewContainerSubview) -> [ViewContainerSubview]  {
        [builder]
    }

    public static func buildBlock(_ builders: ViewContainerSubview...) -> [ViewContainerSubview]  {
        builders
    }
}

public protocol ViewContainerSubview {
    var view: UIView { get }

    func didMoveToSuperView()
}

extension ViewContainerSubview where Self: UIView {
    public var view: UIView { self }

    public func didMoveToSuperView() {}
}

public protocol ViewContainer {
    func add(@ViewContainerBuilder _ subviews: () -> [ViewContainerSubview]) -> Self
}

extension UIView: ViewContainer, ViewContainerSubview {
    @discardableResult
    public func add(@ViewContainerBuilder _ subviews: () -> [ViewContainerSubview]) -> Self {
        subviews().forEach({
            addSubview($0.view)
            $0.didMoveToSuperView()
        })

        return self
    }
}
