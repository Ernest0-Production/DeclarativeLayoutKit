//
//  File.swift
//  
//
//  Created by Бабаян Эрнест on 13.10.2020.
//

import UIKit
import SnapKit


@_functionBuilder
public struct StackingLayoutBulderComposer {
    public static func buildBlock( _ builders: StackingLayoutBuilderConvertible...) -> [StackingLayoutBuilderConvertible] {
        builders
    }

    public static func buildBlock( _ builder: StackingLayoutBuilderConvertible) -> [StackingLayoutBuilderConvertible] {
        [builder]
    }
}

public func HStack(@StackingLayoutBulderComposer builder: () -> [StackingLayoutBuilderConvertible]) -> UIView {
    UIView().add(axis: .horizontal, builder())
}

public func VStack(@StackingLayoutBulderComposer builder: () -> [StackingLayoutBuilderConvertible]) -> UIView {
    UIView().add(axis: .vertical, builder())
}

private extension UIView {
    func add(axis: StackingLayoutBuilder.Axis = .vertical, _ builderConvertables: [StackingLayoutBuilderConvertible]) -> Self {
        var previousBuilder: StackingLayoutBuilder?

        for (index, builderConvertable) in builderConvertables.enumerated() {
            let builder = builderConvertable.asStackingLayoutBuilder()
            self.addSubview(builder.view)
            builder.didMoveToSuperview()

            builder.view.snp.makeConstraints {
                $0.side(builder: builder, axis: axis)

                if index == 0 {
                    let startConstraint: ConstraintMakerEditable
                    switch axis {
                    case .vertical:
                        startConstraint = $0.top.equalToSuperview()
                    case .horizontal:
                        startConstraint = $0.left.equalToSuperview()
                    }

                    startConstraint.inset(builder.beforeSpace.value).priority(builder.beforeSpace.priority)
                }

                else if builderConvertables.count - 1 == index {
                    let endConstraint: ConstraintMakerEditable
                    switch axis {
                    case .vertical:
                        endConstraint = $0.bottom.equalToSuperview()
                    case .horizontal:
                        endConstraint = $0.right.equalToSuperview()
                    }

                    endConstraint.inset(builder.afterSpace.value).priority(builder.afterSpace.priority)
                }

                else if let previousBuilder = previousBuilder {
                    let next: ConstraintMakerEditable

                    switch axis {
                    case .vertical:
                        next = $0.top.equalTo(previousBuilder.view.snp.bottom)
                    case .horizontal:
                        next = $0.left.equalTo(previousBuilder.view.snp.right)
                    }

                    next.inset(-[previousBuilder.afterSpace.value, builder.beforeSpace.value].compactMap({ $0 }).reduce(0, +))
                        .priority([previousBuilder.afterSpace.priority, builder.beforeSpace.priority].max()!)
                }

                previousBuilder = builder
            }
        }

        return self
    }
}

private extension ConstraintMaker {
    func side(builder: StackingLayoutBuilder, axis: StackingLayoutBuilder.Axis) {
        switch axis {
        case .vertical:
            if builder.centerAlign {
                centerX.equalToSuperview().priority(999)
            } else {
                left.right.equalToSuperview().inset(builder.sideInset.value).priority(builder.sideInset.priority)
            }

        case .horizontal:
            if builder.centerAlign {
                centerY.equalToSuperview().priority(999)
            } else {
                top.bottom.equalToSuperview().inset(builder.sideInset.value).priority(builder.sideInset.priority)
            }
        }
    }
}

/*
 HStack {
UIView()
 .height() -> ViewLayoutBuilder
 .afterSpace() -> StackingLayoutBuilder: ViewLayoutBuilder.build()

}


 */
