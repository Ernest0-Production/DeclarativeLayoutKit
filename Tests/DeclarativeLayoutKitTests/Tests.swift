//
//  Tests.swift
//  
//
//  Created by Бабаян Эрнест on 18.12.2020.
//

import XCTest
import DeclarativeLayoutKit
import UIKit


final class Tests: XCTestCase {
    func test_stackView_elements() {
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()

        let stackView = HorizontalStack {
            view1
            UIStackViewSpace(1)
            view2
            view3
        }
        
        XCTAssertEqual(stackView.arrangedSubviews, [view1, view2, view3])
        XCTAssertEqual(stackView.customSpacing(after: view1), 1)
        XCTAssertEqual(stackView.customSpacing(after: view2), UIStackView.spacingUseDefault)
    }
    
    func test_stackView_summation_spacing() {
        let afterSpacedView = UIView()
        
        let stackView = HorizontalStack {
            afterSpacedView
            
            UIStackViewSpace(10)
            
            UIStackViewSpace(1, withSummation: true)
        }
        
        XCTAssertEqual(
            stackView.customSpacing(after: afterSpacedView),
            11
        )
    }
}
