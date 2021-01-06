//
//  ViewLayoutBuilderComposer.swift
//  
//
//  Created by Ernest0N on 12.10.2020.
//

import UIKit


public protocol View {
    var ui: UIView { get }

    func didMoveToSuperView()
}

public protocol ViewComposer {
    @discardableResult
    func add(@SubviewsBuilder _ subviews: () -> [View]) -> Self
}

extension UIView: ViewComposer, View {
    public convenience init(@SubviewsBuilder _ subviews: () -> [View]) {
        self.init(frame: .zero)
        self.add(subviews)
    }

    @discardableResult
    public func add(@SubviewsBuilder _ subviews: () -> [View]) -> Self {
        for subview in subviews() {
            addSubview(subview.ui)
            subview.didMoveToSuperView()
        }

        return self
    }

    public var ui: UIView { self }

    public func didMoveToSuperView() {}
}

@_functionBuilder
public struct SubviewsBuilder {
    public static func buildBlock( _ subviews: [View]) -> [View] {
        subviews
    }

    public static func buildBlock( _ subviews: View...) -> [View] {
        subviews
    }

    public static func buildBlock( _ subview: View) -> [View] {
        [subview]
    }
}
