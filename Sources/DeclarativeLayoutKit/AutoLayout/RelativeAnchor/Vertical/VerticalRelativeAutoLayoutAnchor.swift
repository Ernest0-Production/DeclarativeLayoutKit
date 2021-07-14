//
//  File.swift
//  
//
//  Created by Ernest Babayan on 13.07.2021.
//

import UIKit


public typealias VerticalRelativeAutoLayoutAnchor = RelativeAutoLayoutAnchor<NSLayoutYAxisAnchor>

public protocol VerticalRelativeAutoLayoutAnchorConvertible {
    func asVerticalRelativeAutoLayoutAnchor() -> VerticalRelativeAutoLayoutAnchor
}

extension RelativeAutoLayoutAnchor: VerticalRelativeAutoLayoutAnchorConvertible where Axis == NSLayoutYAxisAnchor {
    public func asVerticalRelativeAutoLayoutAnchor() -> VerticalRelativeAutoLayoutAnchor { self }
}

extension NSLayoutYAxisAnchor: VerticalRelativeAutoLayoutAnchorConvertible {
    public func asVerticalRelativeAutoLayoutAnchor() -> VerticalRelativeAutoLayoutAnchor {
        RelativeAutoLayoutAnchor(target: self)
    }
}
