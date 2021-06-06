//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.06.2021.
//

import UIKit


public protocol AutoLayoutItemConvertible: UIStackViewElementConvertable {
    func asAutoLayoutItem() -> AutoLayoutItem
}

extension AutoLayoutItemConvertible {
    public func asUIStackViewElement() -> UIStackViewElement {
        UIStackViewElement.arranged(self)
    }
}

public final class AutoLayoutItem {
    init(view: UIView) { self.view = view }

    let view: UIView
    var constraintsContainer: [() -> Void] = []
    var afterBuild: () -> Void = {}

    func layout(_ build: @escaping (UIView) -> Void) -> AutoLayoutItem {
        constraintsContainer.append({ [view] in build(view) })
        return self
    }
    
    func move(to superview: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(view)
    }
    
    @discardableResult
    public func activate() -> UIView {
        for constraintBuilder in constraintsContainer { constraintBuilder() }
        constraintsContainer = []
        afterBuild()
        return view
    }
}

extension AutoLayoutItem: AutoLayoutItemConvertible {
    public func asAutoLayoutItem() -> AutoLayoutItem { self }
}


extension UIView: AutoLayoutItemConvertible {
    public func asAutoLayoutItem() -> AutoLayoutItem { AutoLayoutItem(view: self) }
}
