//
//  StackBulder.swift
//  
//
//  Created by Ernest0N on 13.10.2020.
//

import UIKit
import SnapKit

@_functionBuilder
public struct StackBuilder<Axis: StackAxis> {
    public typealias Element = StackBuilderElement<Axis>

    public static func buildBlock( _ elements: [Element]) -> [Element] { elements }

    public static func buildBlock( _ elements: Element...) -> [Element] { elements }

    public static func buildBlock( _ element: Element) -> [Element] { [element] }

    public static func buildExpression(_ convertible: HorizontalStackBuilderItemConvertable) -> StackBuilderElement<HorizontalStackAxis> {
        StackBuilderElement<HorizontalStackAxis>.item(convertible.asStackBuilderItem())
    }

    public static func buildExpression(_ convertible: VerticalStackBuilderItemConvertable) -> StackBuilderElement<VerticalStackAxis> {
        StackBuilderElement<VerticalStackAxis>.item(convertible.asStackBuilderItem())
    }

    public static func buildExpression(_ space: StackSpace) -> StackBuilderElement<Axis> {
        StackBuilderElement<Axis>.space(space)
    }
}

public func HStack(@StackBuilder<HorizontalStackAxis> _ builderConvertibles: () -> [StackBuilderElement<HorizontalStackAxis>]) -> UIView {
    UIView().stack(builders: builderConvertibles(),
                   acrossAxis: \.centerY,
                   firstSide: \.top,
                   secondSide: \.bottom,
                   afterAnchor: \.right,
                   beforeAnchor: \.left)
}

public func VStack(@StackBuilder<VerticalStackAxis> _ builderConvertibles: () -> [StackBuilderElement<VerticalStackAxis>]) -> UIView {
    UIView().stack(builders: builderConvertibles(),
                   acrossAxis: \.centerX,
                   firstSide: \.left,
                   secondSide: \.right,
                   afterAnchor: \.bottom,
                   beforeAnchor: \.top)
}

private extension UIView {
    func stack<Axis: StackAxis>(builders: [StackBuilderElement<Axis>],
                                acrossAxis: AnchorKeyPath,
                                firstSide: AnchorKeyPath,
                                secondSide: AnchorKeyPath,
                                afterAnchor: AnchorKeyPath,
                                beforeAnchor: AnchorKeyPath) -> UIView {
        var previousItem: StackBuilderItemView<Axis>?
        var nextSpace: StackSpace?
        var lastSpace: StackSpace?

        mainLoop: for element in builders {
            var item: StackBuilderItemView<Axis>!

            switch element {
            case .space(let space):
                assert(nextSpace ==  nil, "You use more then one StackSpace instance between same StackItem's")
                nextSpace = space
                lastSpace = space
                continue mainLoop
            case .item(let stackItem):
                item = stackItem
            }

            self.add({ item! })

            item.view.ui.snp.makeConstraints({ (maker: ConstraintMaker) -> Void in
                if let first = item.alignment.first {
                    item.view.ui.asAnchorLayoutBuilder().makeAnchor(firstSide, constraint: first).build()
                }

                if let second = item.alignment.second {
                    item.view.ui.asAnchorLayoutBuilder().makeAnchor(secondSide, constraint: second).build()
                }

                if [item.alignment.first, item.alignment.second].allSatisfy({ $0 == nil }) {
                    maker[keyPath: acrossAxis].equalToSuperview().priority(UILayoutPriority.almostRequired)
                }

                var next: ConstraintMakerEditable

                switch (Axis.self, previousItem) {
                case (is HorizontalStackAxis.Type, Optional.some(let previous)):
                    next = maker[keyPath: beforeAnchor].equalTo((previous.view.ui.snp.right))

                case (is VerticalStackAxis.Type, Optional.some(let previous)):
                    next = maker[keyPath: beforeAnchor].equalTo((previous.view.ui.snp.bottom))

                // if it first item
                case (_, Optional.none):
                    next = maker[keyPath: beforeAnchor].equalToSuperview()

                default:
                    preconditionFailure("Unavailable Stack Axis Type - \(Axis.self)")
                }

                next.offset(nextSpace?.value ?? CGFloat.zero)
                    .priority(nextSpace?.priority ?? UILayoutPriority.almostRequired)

                previousItem = item
                nextSpace = nil
            })
        }

        switch (Axis.self, previousItem) {
        case (is HorizontalStackAxis.Type, Optional.some(let item)):
            item.view.ui
                .layout({
                    $0.right
                        .equalToSuperview()
                        .inset(lastSpace?.value ?? CGFloat.zero)
                        .priority(lastSpace?.priority ?? UILayoutPriority.almostRequired)
                })
                .build()

        case (is VerticalStackAxis.Type, Optional.some(let item)):
            item.view.ui
                .layout({
                    $0.bottom
                        .equalToSuperview()
                        .inset(lastSpace?.value ?? CGFloat.zero)
                        .priority(lastSpace?.priority ?? UILayoutPriority.almostRequired)
                })
                .build()

        default:
            break
        }

        return self
    }
}
