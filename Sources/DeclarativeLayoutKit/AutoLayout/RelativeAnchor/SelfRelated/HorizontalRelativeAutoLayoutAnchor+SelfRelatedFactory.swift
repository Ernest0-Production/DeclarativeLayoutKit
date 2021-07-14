//
//  File.swift
//  
//
//  Created by Ernest Babayan on 13.07.2021.
//

import UIKit


public extension SelfRelatedAutoLayoutAnchor where AnchorType == HorizontalRelativeAutoLayoutAnchor {
    var orLess: Self {
        addSetup({ (anchor: inout HorizontalRelativeAutoLayoutAnchor) in
            anchor = anchor.orLess
        })
    }
    
    var orGreater: Self {
        addSetup({ (anchor: inout HorizontalRelativeAutoLayoutAnchor) in
            anchor = anchor.orGreater
        })
    }
}
