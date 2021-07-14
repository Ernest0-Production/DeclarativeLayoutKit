//
//  File.swift
//  
//
//  Created by Ernest Babayan on 13.07.2021.
//

import UIKit


public typealias HorizontalRelativeAutoLayoutAnchor = RelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>

public protocol HorizontalRelativeAutoLayoutAnchorConvertible {
    func asHorizontalRelativeAutoLayoutAnchor() -> HorizontalRelativeAutoLayoutAnchor
}

extension RelativeAutoLayoutAnchor: HorizontalRelativeAutoLayoutAnchorConvertible where Axis == NSLayoutXAxisAnchor {
    public func asHorizontalRelativeAutoLayoutAnchor() -> HorizontalRelativeAutoLayoutAnchor { self }
}

extension NSLayoutXAxisAnchor: HorizontalRelativeAutoLayoutAnchorConvertible {
    public func asHorizontalRelativeAutoLayoutAnchor() -> HorizontalRelativeAutoLayoutAnchor {
        RelativeAutoLayoutAnchor(target: self)
    }
}
