//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public extension AutoLayoutItemConvertible {
    func leftAnchor(
        _ selfRelatedAnchor: NSLayoutConstraintModificator<SelfRelatedRelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            selfRelatedAnchor.build({ (secondAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>) in
                makeRelativeConstraint(
                    to: view.leftAnchor,
                    with: secondAnchor.create(from: HorizontalRelativeAutoLayoutAnchor(
                        target: secondAnchor.targetPath(view)
                    ))
                )
            })
        })
    }
    
    func leadingAnchor(
        _ selfRelatedAnchor: NSLayoutConstraintModificator<SelfRelatedRelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            selfRelatedAnchor.build({ (secondAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>) in
                makeRelativeConstraint(
                    to: view.leadingAnchor,
                    with: secondAnchor.create(from: HorizontalRelativeAutoLayoutAnchor(
                        target: secondAnchor.targetPath(view)
                    ))
                )
            })
        })
    }
    
    func rightAnchor(
        _ selfRelatedAnchor: NSLayoutConstraintModificator<SelfRelatedRelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            selfRelatedAnchor.build({ (secondAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>) in
                makeRelativeConstraint(
                    to: view.rightAnchor,
                    with: secondAnchor.create(from: HorizontalRelativeAutoLayoutAnchor(
                        target: secondAnchor.targetPath(view)
                    ))
                )
            })
        })
    }
    
    func trailingAnchor(
        _ selfRelatedAnchor: NSLayoutConstraintModificator<SelfRelatedRelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            selfRelatedAnchor.build({ (secondAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>) in
                makeRelativeConstraint(
                    to: view.trailingAnchor,
                    with: secondAnchor.create(from: HorizontalRelativeAutoLayoutAnchor(
                        target: secondAnchor.targetPath(view)
                    ))
                )
            })
        })
    }
    
    func topAnchor(
        _ selfRelatedAnchor: NSLayoutConstraintModificator<SelfRelatedRelativeAutoLayoutAnchor<NSLayoutYAxisAnchor>>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            selfRelatedAnchor.build({ (secondAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutYAxisAnchor>) in
                makeRelativeConstraint(
                    to: view.topAnchor,
                    with: secondAnchor.create(from: VerticalRelativeAutoLayoutAnchor(
                        target: secondAnchor.targetPath(view)
                    ))
                )
            })
        })
    }
    
    func bottomAnchor(
        _ selfRelatedAnchor: NSLayoutConstraintModificator<SelfRelatedRelativeAutoLayoutAnchor<NSLayoutYAxisAnchor>>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            selfRelatedAnchor.build({ (secondAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutYAxisAnchor>) in
                makeRelativeConstraint(
                    to: view.bottomAnchor,
                    with: secondAnchor.create(from: VerticalRelativeAutoLayoutAnchor(
                        target: secondAnchor.targetPath(view)
                    ))
                )
            })
        })
    }
}
