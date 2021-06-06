//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit

public extension DimensionAutoLayoutAnchorConvertible {
    func priority(_ value: UILayoutPriority) -> DimensionAutoLayoutAnchor {
        var copy = asDimensionAutoLayoutAnchor()
        
        copy.priority = value
        
        return copy
    }
    
    func priority(_ value: Float) -> DimensionAutoLayoutAnchor {
        var copy = asDimensionAutoLayoutAnchor()
        
        copy.priority = UILayoutPriority(value)
        
        return copy
    }
}

public extension VerticalRelativeAutoLayoutAnchorConvertible {
    func priority(_ value: UILayoutPriority) -> VerticalRelativeAutoLayoutAnchor {
        var copy = asVerticalRelativeAutoLayoutAnchor()
        
        copy.priority = value
        
        return copy
    }
    
    func priority(_ value: Float) -> VerticalRelativeAutoLayoutAnchor {
        var copy = asVerticalRelativeAutoLayoutAnchor()
        
        copy.priority = UILayoutPriority(value)
        
        return copy
    }
}

public extension HorizontalRelativeAutoLayoutAnchorConvertible {
    func priority(_ value: UILayoutPriority) -> HorizontalRelativeAutoLayoutAnchor {
        var copy = asHorizontalRelativeAutoLayoutAnchor()
        
        copy.priority = value
        
        return copy
    }
    
    func priority(_ value: Float) -> HorizontalRelativeAutoLayoutAnchor {
        var copy = asHorizontalRelativeAutoLayoutAnchor()
        
        copy.priority = UILayoutPriority(value)
        
        return copy
    }
}

public extension BidirectionRelativeAutoLayoutAnchorConvertible {
    func priority(_ value: UILayoutPriority) -> BidirectionRelativeAutoLayoutAnchor {
        var copy = asBidirectionalRelativeAutoLayoutAnchor()
        
        copy.priority = value
        
        return copy
    }
    
    func priority(_ value: Float) -> BidirectionRelativeAutoLayoutAnchor {
        var copy = asBidirectionalRelativeAutoLayoutAnchor()
        
        copy.priority = UILayoutPriority(value)
        
        return copy
    }
}


public extension BidirectionalDimensionAutoLayoutAnchorConvertible {
    func priority(_ value: UILayoutPriority) -> BidirectionalDimensionAutoLayoutAnchor {
        var copy = asBidirectionalDimensionAutoLayoutAnchor()
        
        copy.priority = value
        
        return copy
    }
    
    func priority(_ value: Float) -> BidirectionalDimensionAutoLayoutAnchor {
        var copy = asBidirectionalDimensionAutoLayoutAnchor()
        
        copy.priority = UILayoutPriority(value)
        
        return copy
    }
}
