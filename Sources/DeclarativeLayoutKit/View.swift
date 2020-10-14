//
//  ViewLayoutBuilderComposer.swift
//  
//
//  Created by Бабаян Эрнест on 12.10.2020.
//

import Foundation
import UIKit


typealias View = ViewContainer & ViewContainerSubview

public protocol ViewContainer {
    func add(@ViewContainerBuilder _ subviews: () -> [ViewContainerSubview]) -> Self
}

public protocol ViewContainerSubview {
    var ui: UIView { get }

    func didMoveToSuperView()
}

typealias ViewContainerBuilder = ArrayBuilder<ViewContainerSubview>

extension UIView: ViewContainer, ViewContainerSubview {
    public convenience init(@ViewContainerBuilder _ subviews: () -> [ViewContainerSubview]) {
        self.init(frame: .zero)
        self.add(subviews)
    }

    @discardableResult
    public func add(@ViewContainerBuilder _ subviews: () -> [ViewContainerSubview]) -> Self {
        subviews().forEach({
            addSubview($0.ui)
            $0.didMoveToSuperView()
        })

        return self
    }

    public var ui: UIView { self }

    public func didMoveToSuperView() {}
}
