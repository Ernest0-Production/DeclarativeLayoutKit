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
    func test_stackView_summation_spacing() {
        let afterSpacedView = UIView()
        
        let stackView = HorizontalStack {
            afterSpacedView
            
            UIStackViewSpace(10)
            
            UIStackViewSpace(1)
        }
        
        XCTAssertEqual(
            stackView.customSpacing(after: afterSpacedView),
            11
        )
        
        UIStackView()
            
    }
}
