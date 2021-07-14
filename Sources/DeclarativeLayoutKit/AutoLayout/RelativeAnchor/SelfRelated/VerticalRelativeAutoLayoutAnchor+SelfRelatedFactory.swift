//
//  File.swift
//  
//
//  Created by Ernest Babayan on 13.07.2021.
//

import UIKit


public extension SelfRelatedAutoLayoutAnchor where AnchorType == VerticalRelativeAutoLayoutAnchor {
    var orLess: Self {
        addSetup({ (anchor: inout VerticalRelativeAutoLayoutAnchor) in
            anchor = anchor.orLess
        })
    }
    
    var orGreater: Self {
        addSetup({ (anchor: inout VerticalRelativeAutoLayoutAnchor) in
            anchor = anchor.orGreater
        })
    }
}
