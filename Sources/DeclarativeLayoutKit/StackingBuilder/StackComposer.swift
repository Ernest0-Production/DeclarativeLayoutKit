//
//  StackBulder.swift
//  
//
//  Created by Бабаян Эрнест on 13.10.2020.
//

import UIKit
import SnapKit


public func HStack(@ArrayBuilder<HorizontalStackingLayoutBuilderConvertible> builderConvertibles: () -> [HorizontalStackingLayoutBuilderConvertible]) -> UIView {
    UIView().stack(builders: builderConvertibles().map({ $0.asStackingLayoutBuilder() }),
                   centerAxis: \.centerX,
                   firstSide: \.top,
                   secondSide: \.bottom,
                   afterAnchor: \.right,
                   beforeAnchor: \.left)
}

public func VStack(@ArrayBuilder<VerticalStackingLayoutBuilderConvertible> builderConvertibles: () -> [VerticalStackingLayoutBuilderConvertible]) -> UIView {
    UIView().stack(builders: builderConvertibles().map({ $0.asStackingLayoutBuilder() }),
                   centerAxis: \.centerY,
                   firstSide: \.left,
                   secondSide: \.right,
                   afterAnchor: \.bottom,
                   beforeAnchor: \.top)
}

private extension StackingLayoutBuilder.Alignment {
    var isEmpty: Bool {
        [first, second].allSatisfy({ $0 == nil })
    }
}

private extension UIView {
    typealias AnchorKeyPath = KeyPath<ConstraintMaker, ConstraintMakerExtendable>

    func stack<Axis>(builders: [StackingLayoutBuilder<Axis>],
                     centerAxis: AnchorKeyPath,
                     firstSide: AnchorKeyPath,
                     secondSide: AnchorKeyPath,
                     afterAnchor: AnchorKeyPath,
                     beforeAnchor: AnchorKeyPath) -> UIView {

        var previousBuilder: StackingLayoutBuilder<Axis>?

        for (index, builder) in builders.enumerated() {
            self.add({ builder.view })

            builder.view.ui.snp.makeConstraints {
                guard builder.alignment.isEmpty else {
                    $0[keyPath: centerAxis].equalToSuperview().priority(999)
                    return
                }

                if let first = builder.alignment.first {
                    builder.view.ui.asAnchorLayoutBuilder().makeAnchor(firstSide, constraint: first).build()
                }
                if let second = builder.alignment.second {
                    builder.view.ui.asAnchorLayoutBuilder().makeAnchor(secondSide, constraint: second).build()
                }

                let next: ConstraintMakerEditable

                next = $0[keyPath: beforeAnchor].equalTo((previousBuilder?.view.ui.snp.bottom ?? self))
                if builders.count - 1 == index {
                    $0[keyPath: afterAnchor].equalToSuperview().inset(builder.afterSpace.value).priority(builder.afterSpace.priority)
                }

                if index == 0 {
                    next.inset(builder.beforeSpace.value).priority(builder.beforeSpace.priority)
                } else if let previousBuilder = previousBuilder {
                    next.inset(-[previousBuilder.afterSpace.value, builder.beforeSpace.value].reduce(0, +))
                        .priority([previousBuilder.afterSpace.priority, builder.beforeSpace.priority].max()!)
                }

                previousBuilder = builder
            }
        }

        return self
    }
}
