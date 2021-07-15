//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


public final class AfterBuildModificator<Model, Result> {
    init(model: Model, modificator: Modificator<Result> = .empty) {
        self.model = model
        self.modificator = modificator
    }
    
    private let model: Model
    fileprivate var modificator: Modificator<Result>
    private var finalModificator = Modificator<Result>.empty
    
    @discardableResult
    func append(_ nextModification: @escaping (Result) -> Void) -> Self {
        modificator.append(nextModification)
        return self
    }
    
    func map<T>(_ transform: (Model) -> T) -> AfterBuildModificator<T, Result> {
        AfterBuildModificator<T, Result>(
            model: transform(model),
            modificator: Modificator.merge([modificator, finalModificator])
        )
    }
    
    func build(_ builder: (Model) -> Result) {
        let result = builder(model)
        modificator.apply(into: result)
        finalModificator.apply(into: result)
    }
}

public final class Modificator<Object> {
    init(_ modification: @escaping (Object) -> Void) {
        self.modification = modification
    }
    
    static func merge(_ modificators: [Modificator<Object>]) -> Modificator<Object> {
        Modificator({ (object: Object) in
            for modificator in modificators {
                modificator.apply(into: object)
            }
        })
    }
    
    static var empty: Modificator<Object> { .init({ _ in } )}
    
    private var modification: (Object) -> Void
    
    func apply(into object: Object) {
        modification(object)
    }
    
    @discardableResult
    func append(_ nextModification: @escaping (Object) -> Void) -> Self {
        self.modification = { [modification] (object: Object) in
            modification(object)
            nextModification(object)
        }
        
        return self
    }
}

public extension AfterBuildModificator {
    func completion(_ handler: @escaping (Result) -> Void) -> Self {
        finalModificator.append(handler)
        return self
    }
}

public extension AfterBuildModificator where Result == NSLayoutConstraint {
    func identifier(_ identifier: String) -> Self {
        append({ $0.identifier = identifier })
    }
    
    func priority(_ priority: UILayoutPriority) -> Self {
        append({ $0.priority = priority })
    }
    
    func deactivateAfterCreation() -> Self {
        append({ $0.isActive = false })
    }
}


public extension AutoLayoutConstant {
    func completion<Result>(_ handler: @escaping (Result) -> Void) -> AfterBuildModificator<Self, Result> {
        AfterBuildModificator(model: self).completion(handler)
    }
    
    func identifier(_ identifier: String) -> AfterBuildModificator<Self, NSLayoutConstraint> {
        AfterBuildModificator(model: self).identifier(identifier)
    }
    
    func priority(_ priority: UILayoutPriority) -> AfterBuildModificator<Self, NSLayoutConstraint> {
        AfterBuildModificator(model: self).priority(priority)
    }
    
    func deactivateAfterCreation() -> AfterBuildModificator<Self, NSLayoutConstraint> {
        AfterBuildModificator(model: self).deactivateAfterCreation()
    }
}

public extension NSLayoutXAxisAnchor {
    func completion<Result>(_ handler: @escaping (Result) -> Void) -> AfterBuildModificator<NSLayoutXAxisAnchor, Result> {
        AfterBuildModificator(model: self).completion(handler)
    }
    
    func identifier(_ identifier: String) -> AfterBuildModificator<NSLayoutXAxisAnchor, NSLayoutConstraint> {
        AfterBuildModificator(model: self).identifier(identifier)
    }

    func priority(_ priority: UILayoutPriority) -> AfterBuildModificator<NSLayoutXAxisAnchor, NSLayoutConstraint> {
        AfterBuildModificator(model: self).priority(priority)
    }

    func deactivateAfterCreation() -> AfterBuildModificator<NSLayoutXAxisAnchor, NSLayoutConstraint> {
        AfterBuildModificator(model: self).deactivateAfterCreation()
    }
}

public extension NSLayoutYAxisAnchor {
    func completion<Result>(_ handler: @escaping (Result) -> Void) -> AfterBuildModificator<NSLayoutYAxisAnchor, Result> {
        AfterBuildModificator(model: self).completion(handler)
    }
    
    func identifier(_ identifier: String) -> AfterBuildModificator<NSLayoutYAxisAnchor, NSLayoutConstraint> {
        AfterBuildModificator(model: self).identifier(identifier)
    }

    func priority(_ priority: UILayoutPriority) -> AfterBuildModificator<NSLayoutYAxisAnchor, NSLayoutConstraint> {
        AfterBuildModificator(model: self).priority(priority)
    }

    func deactivateAfterCreation() -> AfterBuildModificator<NSLayoutYAxisAnchor, NSLayoutConstraint> {
        AfterBuildModificator(model: self).deactivateAfterCreation()
    }
}

public extension NSLayoutDimension {
    func completion<Result>(_ handler: @escaping (Result) -> Void) -> AfterBuildModificator<NSLayoutDimension, Result> {
        AfterBuildModificator(model: self).completion(handler)
    }
    
    func identifier(_ identifier: String) -> AfterBuildModificator<NSLayoutDimension, NSLayoutConstraint> {
        AfterBuildModificator(model: self).identifier(identifier)
    }

    func priority(_ priority: UILayoutPriority) -> AfterBuildModificator<NSLayoutDimension, NSLayoutConstraint> {
        AfterBuildModificator(model: self).priority(priority)
    }

    func deactivateAfterCreation() -> AfterBuildModificator<NSLayoutDimension, NSLayoutConstraint> {
        AfterBuildModificator(model: self).deactivateAfterCreation()
    }
}

public extension WithCustomRelationType {
    func completion<Result>(_ handler: @escaping (Result) -> Void) -> AfterBuildModificator<WithCustomRelationType<Object>, Result> {
        AfterBuildModificator(model: self).completion(handler)
    }
    
    func identifier(_ identifier: String) -> AfterBuildModificator<WithCustomRelationType<Object>, NSLayoutConstraint> {
        AfterBuildModificator(model: self).identifier(identifier)
    }

    func priority(_ priority: UILayoutPriority) -> AfterBuildModificator<WithCustomRelationType<Object>, NSLayoutConstraint> {
        AfterBuildModificator(model: self).priority(priority)
    }

    func deactivateAfterCreation() -> AfterBuildModificator<WithCustomRelationType<Object>, NSLayoutConstraint> {
        AfterBuildModificator(model: self).deactivateAfterCreation()
    }
}
