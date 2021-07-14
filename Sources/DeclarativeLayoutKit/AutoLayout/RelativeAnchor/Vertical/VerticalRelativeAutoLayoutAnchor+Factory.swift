//
//  File.swift
//  
//
//  Created by Ernest Babayan on 13.07.2021.
//

import UIKit


/// view.leftAnchor.orLess
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
