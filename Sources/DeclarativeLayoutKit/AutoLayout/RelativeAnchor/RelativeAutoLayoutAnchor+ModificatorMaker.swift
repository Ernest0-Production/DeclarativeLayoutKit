//
//  File.swift
//  
//
//  Created by Ernest Babayan on 13.07.2021.
//

import UIKit


public extension AutoLayoutItemConvertible {
    /// firstView.leftAnchor(secondView.rightAnchor.priority(900))
    func leftAnchor(_ secondAnchorModificator: AfterBuildModificator<HorizontalRelativeAutoLayoutAnchor, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAnchor: HorizontalRelativeAutoLayoutAnchor) in
                makeRelativeConstraint(to: view.leftAnchor, with: secondAnchor)
            })
        })
    }
    
    /// firstView.leadingAnchor(secondView.leadingAnchor.priority(900))
    func leadingAnchor(_ secondAnchorModificator: AfterBuildModificator<HorizontalRelativeAutoLayoutAnchor, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAnchor: HorizontalRelativeAutoLayoutAnchor) in
                makeRelativeConstraint(to: view.leadingAnchor, with: secondAnchor)
            })
        })
    }
    
    /// firstView.rightAnchor(secondView.rightAnchor.priority(900))
    func rightAnchor(_ secondAnchorModificator: AfterBuildModificator<HorizontalRelativeAutoLayoutAnchor, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAnchor: HorizontalRelativeAutoLayoutAnchor) in
                makeRelativeConstraint(to: view.rightAnchor, with: secondAnchor)
            })
        })
    }
    
    /// firstView.trailingAnchor(secondView.trailingAnchor.priority(900))
    func trailingAnchor(_ secondAnchorModificator: AfterBuildModificator<HorizontalRelativeAutoLayoutAnchor, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAnchor: HorizontalRelativeAutoLayoutAnchor) in
                makeRelativeConstraint(to: view.trailingAnchor, with: secondAnchor)
            })
        })
    }
    
    /// firstView.topAnchor(secondView.topAnchor.priority(900))
    func topAnchor(_ secondAnchorModificator: AfterBuildModificator<VerticalRelativeAutoLayoutAnchor, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAnchor: VerticalRelativeAutoLayoutAnchor) in
                makeRelativeConstraint(to: view.topAnchor, with: secondAnchor)
            })
        })
    }
  
    /// firstView.bottomAnchor(secondView.bottomAnchor.priority(900))
    func bottomAnchor(_ secondAnchorModificator: AfterBuildModificator<VerticalRelativeAutoLayoutAnchor, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAnchor: VerticalRelativeAutoLayoutAnchor) in
                makeRelativeConstraint(to: view.bottomAnchor, with: secondAnchor)
            })
        })
    }
}
