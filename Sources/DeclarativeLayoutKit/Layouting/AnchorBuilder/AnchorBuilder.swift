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
    private let view: UIView
    private var constraintMakers: [DeferredConstraintMaker]

    var afterBuild: () -> Void = {}

    init(view: UIView, constraintMakers: [DeferredConstraintMaker] = []) {
        self.view = view
        self.constraintMakers = constraintMakers
    }

    @discardableResult
    public func build() -> UIView {
        view.snp.makeConstraints({ (maker: ConstraintMaker) in
            for deferredMaker in constraintMakers {
                deferredMaker(maker)
            }
        })

        afterBuild()

        // For prevent previous constraints duplicating
        constraintMakers.removeAll()
        afterBuild = {}

        return view
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

extension AnchorLayoutBuilder: ViewComposer, View {
    public func add(@SubviewsBuilder _ subviews: () -> [View]) -> Self {
        let views = subviews()
        afterBuild = { [unowned view] in view.add({ views }) }
        return self
    }

    public var ui: UIView { view }

    public func didMoveToSuperView() {
        build()
        view.didMoveToSuperView()
    }
}

extension AnchorLayoutBuilder: HorizontalStackItemConvertable, VerticalStackItemConvertable {
    public func asStackItem() -> StackItemView<HorizontalStackAxis> {
        StackItemView<HorizontalStackAxis>(self)
    }

    public func asStackItem() -> StackItemView<VerticalStackAxis> {
        StackItemView<VerticalStackAxis>(self)
    }
}
