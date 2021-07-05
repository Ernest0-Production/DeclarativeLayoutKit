//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


public extension HorizontalRelativeAutoLayoutAnchorConvertible {
    @available(*, deprecated, renamed: "inset")
    func to(_ insetAnchor: NSLayoutXAxisAnchor) -> HorizontalRelativeAutoLayoutAnchor {
        inset(insetAnchor)
    }
    
    @available(*, deprecated, renamed: "offset")
    func from(_ offsetAnchor: NSLayoutXAxisAnchor) -> HorizontalRelativeAutoLayoutAnchor {
        offset(offsetAnchor)
    }
    
    func inset(_ insetAnchor: NSLayoutXAxisAnchor) -> HorizontalRelativeAutoLayoutAnchor {
        var copy = asHorizontalRelativeAutoLayoutAnchor()
        
        copy.constant = RelativeAutoLayoutConstant(
            value: copy.constant.value,
            kind: .inset
        )
        
        copy.target = insetAnchor
        
        return copy
    }
    
    func offset(_ offsetAnchor: NSLayoutXAxisAnchor) -> HorizontalRelativeAutoLayoutAnchor {
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
    @available(*, deprecated, renamed: "inset")
    func to(_ insetAnchor: NSLayoutYAxisAnchor) -> VerticalRelativeAutoLayoutAnchor {
        inset(insetAnchor)
    }
    
    @available(*, deprecated, renamed: "offset")
    func from(_ offsetAnchor: NSLayoutYAxisAnchor) -> VerticalRelativeAutoLayoutAnchor {
        offset(offsetAnchor)
    }
    
    func inset(_ anchor: NSLayoutYAxisAnchor) -> VerticalRelativeAutoLayoutAnchor {
        var copy = asVerticalRelativeAutoLayoutAnchor()
        
        copy.constant = RelativeAutoLayoutConstant(
            value: copy.constant.value,
            kind: .inset
        )
        
        copy.target = anchor
        
        return copy
    }
    
    func offset(_ anchor: NSLayoutYAxisAnchor) -> VerticalRelativeAutoLayoutAnchor {
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
    @available(*, deprecated, renamed: "inset")
    func to(_ insetAnchor: AutoLauoutGuide) -> BidirectionRelativeAutoLayoutAnchorConvertible {
        inset(insetAnchor)
    }
    
    @available(*, deprecated, renamed: "offset")
    func from(_ offsetAnchor: AutoLauoutGuide) -> BidirectionRelativeAutoLayoutAnchorConvertible {
        offset(offsetAnchor)
    }
    
    func inset(_ target: AutoLauoutGuide) -> BidirectionRelativeAutoLayoutAnchor {
        var copy = asBidirectionalRelativeAutoLayoutAnchor()
        
        copy.constant = RelativeAutoLayoutConstant(
            value: copy.constant.value,
            kind: .inset
        )
        
        copy.target = target
        
        return copy
    }
    
    func offset(_ target: AutoLauoutGuide) -> BidirectionRelativeAutoLayoutAnchor {
        var copy = asBidirectionalRelativeAutoLayoutAnchor()
        
        copy.constant = RelativeAutoLayoutConstant(
            value: copy.constant.value,
            kind: .offset
        )
        
        copy.target = target
        
        return copy
    }
}
