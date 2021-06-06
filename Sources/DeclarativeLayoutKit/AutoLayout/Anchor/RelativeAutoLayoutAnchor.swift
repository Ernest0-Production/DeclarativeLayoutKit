//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


public typealias HorizontalRelativeAutoLayoutAnchor = RelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>
public typealias VerticalRelativeAutoLayoutAnchor = RelativeAutoLayoutAnchor<NSLayoutYAxisAnchor>

public struct RelativeAutoLayoutAnchor<Axis: AnyObject> {
    var relationType: RelationType
    
    var priority: UILayoutPriority
    
    var target: NSLayoutAnchor<Axis>?
    
    typealias Constant = RelativeAutoLayoutConstant
    
    var constant: Constant
}

public protocol HorizontalRelativeAutoLayoutAnchorConvertible {
    func asHorizontalRelativeAutoLayoutAnchor() -> HorizontalRelativeAutoLayoutAnchor
}

public protocol VerticalRelativeAutoLayoutAnchorConvertible {
    func asVerticalRelativeAutoLayoutAnchor() -> VerticalRelativeAutoLayoutAnchor
}

extension RelativeAutoLayoutAnchor: HorizontalRelativeAutoLayoutAnchorConvertible where Axis == NSLayoutXAxisAnchor {
    public func asHorizontalRelativeAutoLayoutAnchor() -> HorizontalRelativeAutoLayoutAnchor { self }
}

extension RelativeAutoLayoutAnchor: VerticalRelativeAutoLayoutAnchorConvertible where Axis == NSLayoutYAxisAnchor {
    public func asVerticalRelativeAutoLayoutAnchor() -> VerticalRelativeAutoLayoutAnchor { self }
}
