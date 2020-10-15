//
//  AnchorLayoutBuilder.swift
//  
//
//  Created by Ernest0N on 26.09.2020.
//

import Foundation
import UIKit
import SnapKit


public final class AnchorLayoutBuilder {
    public typealias DeferredConstraintMaker = (ConstraintMaker) -> Void
    public let view: UIView
    private var constraintMakers: [DeferredConstraintMaker]

    init(view: UIView, constraintMakers: [DeferredConstraintMaker] = []) {
        self.view = view
        self.constraintMakers = constraintMakers
    }

    public func build() {
        view.snp.makeConstraints { maker in
            constraintMakers.forEach({ $0(maker) })
        }
    }

    @discardableResult
    func addConstraint(_ build: @escaping DeferredConstraintMaker) -> Self {
        constraintMakers.append(build)
        return self
    }
}

extension AnchorLayoutBuilder: AnchorLayoutBuilderConvertible {
    public func asAnchorLayoutBuilder() -> AnchorLayoutBuilder { self }
}

extension AnchorLayoutBuilder: ViewContainer, ViewContainerSubview {
    public func add(@ViewContainerBuilder _ subviews: () -> [ViewContainerSubview]) -> Self {
        view.add(subviews)
        return self
    }

    public var ui: UIView { view }

    public func didMoveToSuperView() { build() }
}

extension AnchorLayoutBuilder: StackingLayoutBuilderConvertible {
    public func asStackingLayoutBuilder() -> StackingLayoutBuilder<VerticalStackAxis> {
        StackingLayoutBuilder(view: self)
    }

    public func asStackingLayoutBuilder() -> StackingLayoutBuilder<HorizontalStackAxis> {
        StackingLayoutBuilder(view: self)
    }
}
