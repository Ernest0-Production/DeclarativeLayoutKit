//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public typealias SelfRelatedBidirectionalRelativeAutoLayoutAnchors<Guide: AutoLayoutGuide> = SelfRelatedAutoLayoutAnchor<Guide, BidirectionalRelativeAutoLayoutAnchors>

public extension SelfRelatedAutoLayoutAnchor where AnchorType == BidirectionalRelativeAutoLayoutAnchors {
    var orLess: Self {
        addSetup({ (anchor: inout BidirectionalRelativeAutoLayoutAnchors) in
            anchor = anchor.orLess
        })
    }
    
    var orGreater: Self {
        addSetup({ (anchor: inout BidirectionalRelativeAutoLayoutAnchors) in
            anchor = anchor.orGreater
        })
    }
}

public extension AutoLayoutConstant {
    func to<Guide>(
        _ target: @escaping SelfRelatedBidirectionalRelativeAutoLayoutAnchors<Guide>.TargetPath
    ) -> SelfRelatedBidirectionalRelativeAutoLayoutAnchors<Guide> {
        SelfRelatedBidirectionalRelativeAutoLayoutAnchors
            .to(target)
            .addSetup({ (anchor: inout BidirectionalRelativeAutoLayoutAnchors) in
                anchor.constant = RelativeAutoLayoutConstant(value: self.value, kind: .inset)
            })
    }
    
    func from<Guide>(
        _ target: @escaping SelfRelatedBidirectionalRelativeAutoLayoutAnchors<Guide>.TargetPath
    ) -> SelfRelatedBidirectionalRelativeAutoLayoutAnchors<Guide> {
        SelfRelatedBidirectionalRelativeAutoLayoutAnchors
            .to(target)
            .addSetup({ (anchor: inout BidirectionalRelativeAutoLayoutAnchors) in
                anchor.constant = RelativeAutoLayoutConstant(value: self.value, kind: .offset)
            })
    }
}
