//
//  UIGestureRecognizer+Action.swift
//  
//
//  Created by uuttff8 on 13.07.2021.
//

import UIKit


/// Add action to a UIGestureRecognizer.
///
/// Using:
///
/// UIView()
///     .addGesture(gesture: UITapGestureRecognizer()
///             .addAction {
///                 // ...
///             })
extension UIGestureRecognizer {
    func addAction(_ action: @escaping () -> Void) -> Self {
        let action = ClosureAction(attachTo: self, closure: action)
        self.addTarget(action, action: ClosureAction.selector)
        return self
    }
}
