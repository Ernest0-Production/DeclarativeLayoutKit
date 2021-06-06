//
//  AnchorBuilderTests.swift
//  
//
//  Created by Бабаян Эрнест on 18.12.2020.
//

import XCTest
import Layouting


final class AnchorBuilderTests: XCTestCase {
    func test_create_constraints_from_inset() {
        let insets: [Float] = [0, 12, -0.5]

        for (inset, constraint) in zip(insets, insets.map({ $0 as AnchorLayoutBuilderConstraint })) {
            assertConstraint(constraint, inset: inset, comparisonType: .equal, priority: 999, multiplier: 1)
            XCTAssertTrue(constraint.target is SuperviewConstraintTarget)
        }
    }

    func test_create_constraints_from_inset_withCustomSetup() {
        let constraint: AnchorLayoutBuilderConstraint = 15

        assertConstraint(constraint.priority(500), inset: 15, priority: 500)
        assertConstraint(constraint.multiplied(by: 0.3), inset: 15, multiplier: 0.3)
        assertConstraint(constraint.orGreater, inset: 15, comparisonType: .greater)
        assertConstraint(constraint.orLess, inset: 15, comparisonType: .less)
    }

    func test_create_constraints_from_inset_withNonSuperviewTarget() {
        let intConstraint: AnchorLayoutBuilderConstraint = 5.from(6)
        XCTAssertEqual(intConstraint.target as! Int, 6)

        let doubleConstraint: AnchorLayoutBuilderConstraint = 5.from(4.3)
        XCTAssertEqual(doubleConstraint.target as! Double, 4.3)

        let targetView = UIView()
        let targetViewConstraint: AnchorLayoutBuilderConstraint = 5.from(targetView)
        XCTAssert((targetViewConstraint.target as! UIView) === targetView)

        let targetViewAnchor = targetView.snp.top
        let targetViewAnchorConstraint: AnchorLayoutBuilderConstraint = 5.from(targetViewAnchor)
        XCTAssert((targetViewAnchorConstraint.target as! ConstraintItem) === targetViewAnchor)
    }

}


private func assertConstraint(
    _ constraint: AnchorLayoutBuilderConstraint,
    inset: AnchorLayoutBuilderConstraintInset?,
    comparisonType: ConstraintComparisonType = .equal,
    priority: ConstraintPriorityTarget = 999,
    multiplier: ConstraintMultiplierTarget = 1
) {
    XCTAssertEqual(constraint.inset?.value, inset?.value)
    XCTAssertEqual(constraint.comparisonType, comparisonType)
    XCTAssertEqual(constraint.priority.constraintPriorityTargetValue, priority.constraintPriorityTargetValue)
    XCTAssertEqual(constraint.multiplier.constraintMultiplierTargetValue, multiplier.constraintMultiplierTargetValue)
}
