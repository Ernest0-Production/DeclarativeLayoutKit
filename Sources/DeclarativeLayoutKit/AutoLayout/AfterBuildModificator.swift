//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//


public final class AfterBuildModificator<Model, Result> {
    init(model: Model, handler: @escaping (Result) -> Void = { _ in }) {
        self.model = model
        self.handler = handler
    }
    
    private let model: Model
    private var handler: (Result) -> Void
    private var afterBuild: (Result) -> Void = { _ in }
    
    func build(_ constraintMaker: (Model) -> Result) {
        let result = constraintMaker(model)
        handler(result)
        afterBuild(result)
    }
    
    @discardableResult
    func then(_ nextHandler: @escaping (Result) -> Void) -> Self {
        handler = { [handler] in
            handler($0)
            nextHandler($0)
        }
        
        return self
    }
}

public extension AfterBuildModificator {
    func completion(_ listiner: @escaping (Result) -> Void) -> AfterBuildModificator {
        then(listiner)
    }
}
