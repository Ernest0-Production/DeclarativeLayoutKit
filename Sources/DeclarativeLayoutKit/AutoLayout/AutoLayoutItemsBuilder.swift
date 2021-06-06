//
//  ViewLayoutBuilderComposer.swift
//  
//
//  Created by Ernest0N on 12.10.2020.
//

import UIKit


public typealias AutoLayoutItemsBuilder = ArrayBuilder<AutoLayoutItemConvertible>

public extension UIView {
    @discardableResult
    func add(_ items: [AutoLayoutItemConvertible]) -> Self {
        for itemBox in items {
            let item = itemBox.asAutoLayoutItem()
            item.move(to: self)
            item.activate()
        }

        return self
    }
    
    convenience init(@AutoLayoutItemsBuilder _ items: () -> [AutoLayoutItemConvertible]) {
        self.init(frame: .zero)
        self.add(items)
    }

    @discardableResult
    func add(@AutoLayoutItemsBuilder _ items: () -> [AutoLayoutItemConvertible]) -> Self {
        add(items())
    }
    
    @discardableResult
    func add(_ items: AutoLayoutItemConvertible...) -> Self {
        add(items)
    }
}

public extension AutoLayoutItem {
    func add(@AutoLayoutItemsBuilder _ items: @escaping () -> [AutoLayoutItemConvertible]) -> AutoLayoutItem {
        afterBuild = { [view] in view.add(items) }
        
        return self
    }
}
