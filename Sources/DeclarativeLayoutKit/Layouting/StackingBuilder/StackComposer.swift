//
//  StackBulder.swift
//  
//
//  Created by Ernest0N on 13.10.2020.
//

import UIKit
import SnapKit


public func HStack(@ArrayBuilder<HorizontalStackingLayoutBuilderConvertible> builderConvertibles: () -> [HorizontalStackingLayoutBuilderConvertible]) -> UIView {
    UIView().stack(builders: builderConvertibles().map({ $0.asStackingLayoutBuilder() }),
                   acrossAxis: \.centerY,
                   firstSide: \.top,
                   secondSide: \.bottom,
                   afterAnchor: \.right,
                   beforeAnchor: \.left)
}

public func VStack(@ArrayBuilder<VerticalStackingLayoutBuilderConvertible> builderConvertibles: () -> [VerticalStackingLayoutBuilderConvertible]) -> UIView {
    UIView().stack(builders: builderConvertibles().map({ $0.asStackingLayoutBuilder() }),
                   acrossAxis: \.centerX,
                   firstSide: \.left,
                   secondSide: \.right,
                   afterAnchor: \.bottom,
                   beforeAnchor: \.top)
}

private extension UIView {
    func stack<Axis>(builders: [StackingLayoutBuilder<Axis>],
                     acrossAxis: AnchorKeyPath,
                     firstSide: AnchorKeyPath,
                     secondSide: AnchorKeyPath,
                     afterAnchor: AnchorKeyPath,
                     beforeAnchor: AnchorKeyPath) -> UIView {
        var previousBuilder: StackingLayoutBuilder<Axis>?

        for (index, builder) in builders.enumerated() {
            self.add({ builder.view })

            builder.view.ui.snp.makeConstraints({ (maker: ConstraintMaker) -> Void in
                if let first = builder.alignment.first {
                    builder.view.ui.asAnchorLayoutBuilder().makeAnchor(firstSide, constraint: first).build()
                }

                if let second = builder.alignment.second {
                    builder.view.ui.asAnchorLayoutBuilder().makeAnchor(secondSide, constraint: second).build()
                }

                if [builder.alignment.first, builder.alignment.second].allSatisfy({ $0 == nil }) {
                    maker[keyPath: acrossAxis].equalToSuperview().priority(999)
                }

                let next: ConstraintMakerEditable

                next = maker[keyPath: beforeAnchor].equalTo((previousBuilder?.view.ui.snp.bottom ?? self))

                if (builders.count - 1) == index {
                    maker[keyPath: afterAnchor].equalToSuperview().inset(builder.afterSpace.value).priority(builder.afterSpace.priority)
                }

                if index == Int.zero {
                    next.inset(builder.beforeSpace.value).priority(builder.beforeSpace.priority)
                } else if let previousBuilder = previousBuilder {
                    next.inset(-[previousBuilder.afterSpace.value, builder.beforeSpace.value].reduce(0, +))
                        .priority([previousBuilder.afterSpace.priority, builder.beforeSpace.priority].max()!)
                }

                previousBuilder = builder
            })
        }

        return self
    }
}
