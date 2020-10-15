//
//  Alignment.swift
//  
//
//  Created by Ernest0N on 14.10.2020.
//

public extension StackingLayoutBuilder {
    struct Alignment {
        let first: AnchorLayoutBuilderConstraint?
        let second: AnchorLayoutBuilderConstraint?

        public static var center: Alignment {
            Alignment(first: nil, second: nil)
        }

        public static func fill(sideInset: AnchorLayoutBuilderConstraint = 0) -> Alignment {
            Alignment(first: sideInset, second: sideInset)
        }

        public static func left(_ inset: AnchorLayoutBuilderConstraint) -> Alignment where Axis == VerticalStackAxis {
            .init(first: inset, second: nil)
        }

        public static func right(_ inset: AnchorLayoutBuilderConstraint) -> Alignment where Axis == VerticalStackAxis {
            .init(first: nil, second: inset)
        }

        public static func custom(left: AnchorLayoutBuilderConstraint, right: AnchorLayoutBuilderConstraint) -> Alignment where Axis == VerticalStackAxis {
            .init(first: left, second: right)
        }

        public static func top(_ inset: AnchorLayoutBuilderConstraint) -> Alignment where Axis == HorizontalStackAxis {
            .init(first: inset, second: nil)
        }

        public static func bottom(_ inset: AnchorLayoutBuilderConstraint) -> Alignment where Axis == HorizontalStackAxis {
            .init(first: nil, second: inset)
        }

        public static func custom(top: AnchorLayoutBuilderConstraint, bottom: AnchorLayoutBuilderConstraint) -> Alignment where Axis == HorizontalStackAxis {
            .init(first: top, second: bottom)
        }
    }
}
