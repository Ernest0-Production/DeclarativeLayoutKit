//
//  File.swift
//  
//
//  Created by Ernest Babayan on 13.07.2021.
//

import UIKit

func ex() {
    let anchor = 12.orLess.priority(.required)
    
    UIView().leftAnchor(anchor)
    
//    UIView().leftAnchor(UIView().leftAnchor.priority(.required))
}

/*
 
 
 1. Изменяют Modificator
 2. Неявная трансофрмация в то, что позволяет хранить Modificator-ы
 3. Экстеншны типа:
 .priority
 .activate
 .identifier
 - должны создавать этот самый объект с теми самыми модификаторами ИИИИ сохранять текущий контекст. т.е. обернуть в AfterBuildModificator<Self, NSLayoutConstraint>
 
 4. Т.е. экстеншоны выше должны возвращать AfterBuildModificator<Self, NSLayoutConstraint>
 5. Протокол для описания этих хуевин будет
 protocol AfterBuildNSLayoutConstrantModificator {
    associatedtype Model
    func asModificator() -> AfterBuildModificator<Model, NSLayoutConstraint>
 }
 
 extension AfterBuildNSLayoutConstrantModificator: NSLayoutConstraintModificatorCompatible {
    var constraintModificator: Modificator<NSLayoutConstraint> {
        asModificator()
    }
 }
 
 */

public extension AutoLayoutConstant {
    var orLess: AfterBuildModificator<(CGFloat, RelationType), NSLayoutConstraint> {
        AfterBuildModificator<(CGFloat, RelationType), NSLayoutConstraint>(model: (self.value, RelationType.less))
    }
    
    var orGreater: AfterBuildModificator<(CGFloat, RelationType), NSLayoutConstraint> {
        AfterBuildModificator<(CGFloat, RelationType), NSLayoutConstraint>(model: (self.value, RelationType.greater))
    }
}


public extension AutoLayoutItemConvertible {
    /// firstView.leftAnchor(16.orLess)
    func leftAnchor<M: AfterRelationConstantBuildNSLayoutConstraintModificatorConvertible>(_ constantModificator: M) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            constantModificator
                .asAfterRelationConstantBuildNSLayoutConstraintModificator()
                .build({ constant in
                    makeRelativeConstraint(
                        to: view.leftAnchor,
                        with: HorizontalRelativeAutoLayoutAnchor(
                            relationType: constant.1,
                            target: view.superview!.leftAnchor
                        )
                    )
                })
                
        })
    }
    
//    func leadingAnchor(_ constant: CGFloat) -> AutoLayoutItem {
//        leadingAnchor(.to(\.superview!.leadingAnchor))
//    }
//
//    func rightAnchor(_ constant: CGFloat) -> AutoLayoutItem {
//        rightAnchor(.to(\.superview!.rightAnchor))
//    }
//
//    func trailingAnchor(_ constant: CGFloat) -> AutoLayoutItem {
//        trailingAnchor(.to(\.superview!.trailingAnchor))
//    }
    
    /// firstView.leftAnchor(.to(\.superview!.safeAreaLayoutGuide.leftAnchor))
    func leftAnchor(
        _ selfRelatedAnchor: SelfRelatedAutoLayoutAnchor<NSLayoutXAxisAnchor, HorizontalRelativeAutoLayoutAnchor>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeRelativeConstraint(
                to: view.leftAnchor,
                with: selfRelatedAnchor.create(from: HorizontalRelativeAutoLayoutAnchor(
                    target: selfRelatedAnchor.targetPath(view)
                ))
            )
        })
    }
    
    /// firstView.leftAnchor(.to(\.superview!.safeAreaLayoutGuide.leftAnchor).priority(.required))
    func leftAnchor(
        _ selfRelatedAnchorModificator: AfterBuildModificator<SelfRelatedAutoLayoutAnchor<NSLayoutXAxisAnchor, HorizontalRelativeAutoLayoutAnchor>, NSLayoutConstraint>
    ) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            selfRelatedAnchorModificator.build({ (selfRelatedAnchor: SelfRelatedAutoLayoutAnchor<NSLayoutXAxisAnchor, HorizontalRelativeAutoLayoutAnchor>) in
                makeRelativeConstraint(
                    to: view.leftAnchor,
                    with: selfRelatedAnchor.create(from: HorizontalRelativeAutoLayoutAnchor(
                        target: selfRelatedAnchor.targetPath(view)
                    ))
                )
            })
        })
    }
    
//    func topAnchor(_ constant: CGFloat) -> AutoLayoutItem {
//        topAnchor(.to(\.superview!.topAnchor))
//    }
//
//    func bottomAnchor(_ constant: CGFloat) -> AutoLayoutItem {
//        bottomAnchor(.to(\.superview!.bottomAnchor))
//    }
//
//    func leadingAnchor(
//        _ selfRelatedAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>
//    ) -> AutoLayoutItem {
//        asAutoLayoutItem().layout({ (view: UIView) in
//            makeRelativeConstraint(
//                to: view.leadingAnchor,
//                with: selfRelatedAnchor.create(from: HorizontalRelativeAutoLayoutAnchor(
//                    target: selfRelatedAnchor.targetPath(view)
//                ))
//            )
//        })
//    }
//
//
//    func rightAnchor(
//        _ selfRelatedAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>
//    ) -> AutoLayoutItem {
//        asAutoLayoutItem().layout({ (view: UIView) in
//            makeRelativeConstraint(
//                to: view.rightAnchor,
//                with: selfRelatedAnchor.create(from: HorizontalRelativeAutoLayoutAnchor(
//                    target: selfRelatedAnchor.targetPath(view)
//                ))
//            )
//        })
//    }
//
//
//    func trailingAnchor(
//        _ selfRelatedAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutXAxisAnchor>
//    ) -> AutoLayoutItem {
//        asAutoLayoutItem().layout({ (view: UIView) in
//            makeRelativeConstraint(
//                to: view.trailingAnchor,
//                with: selfRelatedAnchor.create(from: HorizontalRelativeAutoLayoutAnchor(
//                    target: selfRelatedAnchor.targetPath(view)
//                ))
//            )
//        })
//    }
//
//
//
//    func topAnchor(
//        _ selfRelatedAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutYAxisAnchor>
//    ) -> AutoLayoutItem {
//        asAutoLayoutItem().layout({ (view: UIView) in
//            makeRelativeConstraint(
//                to: view.topAnchor,
//                with: selfRelatedAnchor.create(from: VerticalRelativeAutoLayoutAnchor(
//                    target: selfRelatedAnchor.targetPath(view)
//                ))
//            )
//        })
//    }
//
//
//
//    func bottomAnchor(
//        _ selfRelatedAnchor: SelfRelatedRelativeAutoLayoutAnchor<NSLayoutYAxisAnchor>
//    ) -> AutoLayoutItem {
//        asAutoLayoutItem().layout({ (view: UIView) in
//            makeRelativeConstraint(
//                to: view.topAnchor,
//                with: selfRelatedAnchor.create(from: VerticalRelativeAutoLayoutAnchor(
//                    target: selfRelatedAnchor.targetPath(view)
//                ))
//            )
//        })
//    }
}
