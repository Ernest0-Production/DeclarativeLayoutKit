//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension AutoLayoutConstant {
    func to<Axis>(
        _ target: @escaping SelfRelatedRelativeAutoLayoutAnchor<Axis>.TargetPath
    ) -> SelfRelatedRelativeAutoLayoutAnchor<Axis> {
        SelfRelatedRelativeAutoLayoutAnchor<Axis>
            .to(target)
            .addSetup({ (anchor: inout RelativeAutoLayoutAnchor<Axis>) in
                anchor.constant = RelativeAutoLayoutAnchor<Axis>.Constant(value: self.value, kind: .inset)
            })
    }
    
    func from<Axis>(
        _ target: @escaping SelfRelatedRelativeAutoLayoutAnchor<Axis>.TargetPath
    ) -> SelfRelatedRelativeAutoLayoutAnchor<Axis> {
        SelfRelatedRelativeAutoLayoutAnchor<Axis>
            .to(target)
            .addSetup({ (anchor: inout RelativeAutoLayoutAnchor<Axis>) in
                anchor.constant = RelativeAutoLayoutAnchor<Axis>.Constant(value: self.value, kind: .offset)
            })
    }
}


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
