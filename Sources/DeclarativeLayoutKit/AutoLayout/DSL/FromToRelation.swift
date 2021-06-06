//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


public extension HorizontalRelativeAutoLayoutAnchorConvertible {
    func to(_ insetAnchor: NSLayoutXAxisAnchor) -> HorizontalRelativeAutoLayoutAnchor {
        var copy = asHorizontalRelativeAutoLayoutAnchor()
        
        copy.constant = RelativeAutoLayoutConstant(
            value: copy.constant.value,
            kind: .inset
        )
        
        copy.target = insetAnchor
        
        return copy
    }
    
    func from(_ offsetAnchor: NSLayoutXAxisAnchor) -> HorizontalRelativeAutoLayoutAnchor {
        var copy = asHorizontalRelativeAutoLayoutAnchor()
        
        copy.constant = RelativeAutoLayoutConstant(
            value: copy.constant.value,
            kind: .offset
        )
        
        copy.target = offsetAnchor
        
        return copy
    }
}

public extension VerticalRelativeAutoLayoutAnchorConvertible {
    func to(_ anchor: NSLayoutYAxisAnchor) -> VerticalRelativeAutoLayoutAnchor {
        var copy = asVerticalRelativeAutoLayoutAnchor()
        
        copy.constant = RelativeAutoLayoutConstant(
            value: copy.constant.value,
            kind: .inset
        )
        
        copy.target = anchor
        
        return copy
    }
    
    func from(_ anchor: NSLayoutYAxisAnchor) -> VerticalRelativeAutoLayoutAnchor {
        var copy = asVerticalRelativeAutoLayoutAnchor()
        
        copy.constant = RelativeAutoLayoutConstant(
            value: copy.constant.value,
            kind: .offset
        )
        
        copy.target = anchor
        
        return copy
    }
}

public extension BidirectionRelativeAutoLayoutAnchorConvertible {
    func to(_ target: AutoLauoutGuide) -> BidirectionRelativeAutoLayoutAnchor {
        var copy = asBidirectionalRelativeAutoLayoutAnchor()
        
        copy.constant = RelativeAutoLayoutConstant(
            value: copy.constant.value,
            kind: .inset
        )
        
        copy.target = target
        
        return copy
    }
    
    func from(_ target: AutoLauoutGuide) -> BidirectionRelativeAutoLayoutAnchor {
        var copy = asBidirectionalRelativeAutoLayoutAnchor()
        
        copy.constant = RelativeAutoLayoutConstant(
            value: copy.constant.value,
            kind: .offset
        )
        
        copy.target = target
        
        return copy
    }
}
