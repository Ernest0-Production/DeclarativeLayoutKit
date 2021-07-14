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

public protocol AfterRelationConstantBuildNSLayoutConstraintModificatorConvertible: AfterBuildNSLayoutConstraintModificatorConvertible {
    func asAfterRelationConstantBuildNSLayoutConstraintModificator() -> AfterBuildModificator<(CGFloat, RelationType), NSLayoutConstraint>
}

extension AfterRelationConstantBuildNSLayoutConstraintModificatorConvertible {
    public func asAfterBuildNSLayoutConstraintModificator() -> AfterBuildModificator<(CGFloat, RelationType), NSLayoutConstraint> {
        self.asAfterRelationConstantBuildNSLayoutConstraintModificator()
    }
}

public protocol AfterBuildNSLayoutConstraintModificatorConvertible {
    associatedtype Model
    
    func asAfterBuildNSLayoutConstraintModificator() -> AfterBuildModificator<Model, NSLayoutConstraint>
}


public extension AfterBuildModificator {
    func completion(_ handler: @escaping (Result) -> Void) -> AfterBuildModificator {
        finalModificator.append(handler)
        return self
    }
}

extension AfterBuildModificator: AfterBuildNSLayoutConstraintModificatorConvertible where Result == NSLayoutConstraint {
    public func asAfterBuildNSLayoutConstraintModificator() -> AfterBuildModificator<Model, NSLayoutConstraint> { self }
}

public extension AfterBuildNSLayoutConstraintModificatorConvertible {
    func identifier(_ identifier: String) -> AfterBuildModificator<Model, NSLayoutConstraint> {
        asAfterBuildNSLayoutConstraintModificator().append({ $0.identifier = identifier })
        
    }
    
    func priority(_ priority: UILayoutPriority) -> AfterBuildModificator<Model, NSLayoutConstraint> {
        asAfterBuildNSLayoutConstraintModificator().append({ $0.priority = priority })
    }
    
    func deactivateAfterCreation() -> AfterBuildModificator<Model, NSLayoutConstraint> {
        asAfterBuildNSLayoutConstraintModificator().append({ $0.isActive = false })
    }
}
