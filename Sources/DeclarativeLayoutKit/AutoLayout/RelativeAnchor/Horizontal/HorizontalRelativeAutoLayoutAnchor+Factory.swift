//
//  File.swift
//  
//
//  Created by Ernest Babayan on 13.07.2021.
//

import UIKit


/// view.leftAnchor.orLess
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
