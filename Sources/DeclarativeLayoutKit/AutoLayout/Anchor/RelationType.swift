//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


enum RelationType {
    case less, equal, greater
}

public extension DimensionAutoLayoutAnchorConvertible {
    var orLess: DimensionAutoLayoutAnchor {
        var copy = asDimensionAutoLayoutAnchor()
        copy.relationType = .less
        return copy
    }
    
    var orGreater: DimensionAutoLayoutAnchor {
        var copy = asDimensionAutoLayoutAnchor()
        copy.relationType = .greater
        return copy
    }
}

public extension HorizontalRelativeAutoLayoutAnchorConvertible {
    var orLess: HorizontalRelativeAutoLayoutAnchor {
        var copy = asHorizontalRelativeAutoLayoutAnchor()
        copy.relationType = .less
        return copy
    }
    
    var orGreater: HorizontalRelativeAutoLayoutAnchor {
        var copy = asHorizontalRelativeAutoLayoutAnchor()
        copy.relationType = .greater
        return copy
    }
}

public extension VerticalRelativeAutoLayoutAnchorConvertible {
    var orLess: VerticalRelativeAutoLayoutAnchor {
        var copy = asVerticalRelativeAutoLayoutAnchor()
        copy.relationType = .less
        return copy
    }
    
    var orGreater: VerticalRelativeAutoLayoutAnchor {
        var copy = asVerticalRelativeAutoLayoutAnchor()
        copy.relationType = .greater
        return copy
    }
}

public extension BidirectionRelativeAutoLayoutAnchorConvertible {
    var orLess: BidirectionRelativeAutoLayoutAnchor {
        var copy = asBidirectionalRelativeAutoLayoutAnchor()
        copy.relationType = .less
        return copy
    }
    
    var orGreater: BidirectionRelativeAutoLayoutAnchor {
        var copy = asBidirectionalRelativeAutoLayoutAnchor()
        copy.relationType = .greater
        return copy
    }
}
