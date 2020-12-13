//
//  ClosureAction.swift
//  
//
//  Created by Бабаян Эрнест on 04.12.2020.
//

import Foundation


final class ClosureAction {
    private let closure: () -> ()

    init(attachTo target: AnyObject, closure: @escaping () -> ()) {
        self.closure = closure
        objc_setAssociatedObject(target, "[\(arc4random())]", self, .OBJC_ASSOCIATION_RETAIN)
    }

    @objc
    func invoke() { closure() }

    static var selector: Selector { #selector(ClosureAction.invoke) }
}
