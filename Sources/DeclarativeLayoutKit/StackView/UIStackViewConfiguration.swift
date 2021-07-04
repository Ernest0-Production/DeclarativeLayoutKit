//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


public protocol UIStackViewConfiguration {
    func configure(stackView: UIStackView)
}

public struct AnyUIStackViewConfiguration: UIStackViewConfiguration {
    public init(_ configuration: @escaping (UIStackView) -> Void) {
        self.configuration = configuration
    }
    
    let configuration: (UIStackView) -> Void
    
    public func configure(stackView: UIStackView) {
        configuration(stackView)
    }
}
