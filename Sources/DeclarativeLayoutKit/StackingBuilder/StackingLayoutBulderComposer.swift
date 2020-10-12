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
    static func buildBlock( _ builders: StackingLayoutBuilderConvertible...) -> [StackingLayoutBuilderConvertible] {
        builders
    }

    static func buildBlock( _ builder: StackingLayoutBuilderConvertible) -> [StackingLayoutBuilderConvertible] {
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
        guard builderConvertables.count > 0 else {
            return self
        }

        let builders = builderConvertables.map({ $0.asStackingLayoutBuilder() })
        builders.forEach({ self.addSubview($0.view) })

        guard builders.count > 0 else {
            return self
        }

        var currentIndex = 0
        while builders.count - 1 < currentIndex {
            let currentBuilder = builders[currentIndex]

            currentBuilder.view.snp.makeConstraints {
                $0.side(builder: currentBuilder, axis: axis)

                switch axis {
                case .vertical:
                    currentBuilder.height.ifNotNil($0.height.set(constraint:))
                case .horizontal:
                    currentBuilder.height.ifNotNil($0.width.set(constraint:))
                }

                if currentIndex == 0 {
                    let startConstraint: ConstraintMakerEditable
                    switch axis {
                    case .vertical:
                        startConstraint = $0.top.equalToSuperview()
                    case .horizontal:
                        startConstraint = $0.left.equalToSuperview()
                    }

                    startConstraint.inset(currentBuilder.beforeSpace.value).priority(currentBuilder.beforeSpace.priority)
                }

                else if builders.count - 1 == currentIndex {
                    let endConstraint: ConstraintMakerEditable
                    switch axis {
                    case .vertical:
                        endConstraint = $0.bottom.equalToSuperview()
                    case .horizontal:
                        endConstraint = $0.right.equalToSuperview()
                    }

                    endConstraint.inset(currentBuilder.afterSpace.value).priority(currentBuilder.afterSpace.priority)
                }

                else {
                    let previousBuilder = builders[currentIndex - 1]
                    let next: ConstraintMakerEditable

                    switch axis {
                    case .vertical:
                        next = $0.top.equalTo(previousBuilder.view.snp.bottom)
                    case .horizontal:
                        next = $0.left.equalTo(previousBuilder.view.snp.right)
                    }

                    next.inset(-[previousBuilder.afterSpace.value, currentBuilder.beforeSpace.value].compactMap({ $0 }).reduce(0, +))
                        .priority([previousBuilder.afterSpace.priority, currentBuilder.beforeSpace.priority].max()!)
                }
            }

            currentIndex += 1
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
