//
//  File.swift
//  
//
//  Created by Ernest Babayan on 06.06.2021.
//

import UIKit


struct RelativeAutoLayoutConstant {
    var value: CGFloat
    
    enum Kind { case inset, offset }
    
    var kind: Kind
    
    static var zero: Self { Self(value: .zero, kind: .inset) }
}
