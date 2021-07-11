//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension VerticalRelativeAutoLayoutAnchorConvertible {
    var orLess: VerticalRelativeAutoLayoutAnchor {
        var copy = self.asVerticalRelativeAutoLayoutAnchor()
        copy.relationType = .less
        return copy
    }
    
    var orGreater: VerticalRelativeAutoLayoutAnchor {
        var copy = self.asVerticalRelativeAutoLayoutAnchor()
        copy.relationType = .greater
        return copy
    }
}

public extension HorizontalRelativeAutoLayoutAnchorConvertible {
    var orLess: HorizontalRelativeAutoLayoutAnchor {
        var copy = self.asHorizontalRelativeAutoLayoutAnchor()
        copy.relationType = .less
        return copy
    }
    
    var orGreater: HorizontalRelativeAutoLayoutAnchor {
        var copy = self.asHorizontalRelativeAutoLayoutAnchor()
        copy.relationType = .greater
        return copy
    }
}

public extension AutoLayoutConstant {
    func to(_ secondAnchor: NSLayoutXAxisAnchor) -> HorizontalRelativeAutoLayoutAnchor {
        HorizontalRelativeAutoLayoutAnchor(
            target: secondAnchor,
            constant: RelativeAutoLayoutConstant(
                value: self.value,
                kind: RelativeAutoLayoutConstant.Kind.inset
            )
        )
    }
    
    func from(_ secondAnchor: NSLayoutXAxisAnchor) -> HorizontalRelativeAutoLayoutAnchor {
        HorizontalRelativeAutoLayoutAnchor(
            target: secondAnchor,
            constant: RelativeAutoLayoutConstant(
                value: self.value,
                kind: RelativeAutoLayoutConstant.Kind.offset
            )
        )
    }
}

public extension AutoLayoutConstant {
    func to(_ secondAnchor: NSLayoutYAxisAnchor) -> VerticalRelativeAutoLayoutAnchor {
        VerticalRelativeAutoLayoutAnchor(
            target: secondAnchor,
            constant: RelativeAutoLayoutConstant(
                value: self.value,
                kind: RelativeAutoLayoutConstant.Kind.inset
            )
        )
    }
    
    func from(_ secondAnchor: NSLayoutYAxisAnchor) -> VerticalRelativeAutoLayoutAnchor {
        VerticalRelativeAutoLayoutAnchor(
            target: secondAnchor,
            constant: RelativeAutoLayoutConstant(
                value: self.value,
                kind: RelativeAutoLayoutConstant.Kind.offset
            )
        )
    }
}
