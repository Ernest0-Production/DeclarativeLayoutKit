//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


extension NSLayoutXAxisAnchor: HorizontalRelativeAutoLayoutAnchorConvertible {
    public func asHorizontalRelativeAutoLayoutAnchor() -> HorizontalRelativeAutoLayoutAnchor {
        RelativeAutoLayoutAnchor(target: self)
    }
}

extension NSLayoutYAxisAnchor: VerticalRelativeAutoLayoutAnchorConvertible {
    public func asVerticalRelativeAutoLayoutAnchor() -> VerticalRelativeAutoLayoutAnchor {
        RelativeAutoLayoutAnchor(target: self)
    }
}
