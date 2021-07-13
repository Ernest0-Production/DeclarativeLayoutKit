//
//  UIGestureRecognizer+Action.swift
//  
//
//  Created by uuttff8 on 13.07.2021.
//

import UIKit


/// **⚠️ Don't forget about ARC when use self or some parent view in action closure, to prevent retain cycle**
///
/// Using:
///
/// UIView()
///     .addGesture(UITapGestureRecognizer()
///                     .addAction {
///                         // ...
///                     })
extension UIGestureRecognizer {
    func addAction(_ action: @escaping () -> Void) -> Self {
        let action = ClosureAction(attachTo: self, closure: action)
        self.addTarget(action, action: ClosureAction.selector)
        return self
    }
}
