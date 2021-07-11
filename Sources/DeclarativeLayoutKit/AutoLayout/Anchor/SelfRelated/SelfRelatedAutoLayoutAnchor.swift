//
//  File.swift
//  
//
//  Created by Ernest Babayan on 07.07.2021.
//

import UIKit


public final class SelfRelatedAutoLayoutAnchor<TargetType, AnchorType> {
    public typealias TargetPath = (UIView) -> TargetType
    
    private init(_ targetPath: @escaping TargetPath) {
        self.targetPath = targetPath
    }
    
    public static func to(_ targetPath: @escaping TargetPath) -> Self {
        Self(targetPath)
    }
    
    let targetPath: TargetPath
    private var setupConfiguration: (inout AnchorType) -> Void = { _ in }
    
    @discardableResult
    func addSetup(_ configuration: @escaping (inout AnchorType) -> Void) -> Self {
        setupConfiguration = { [setupConfiguration] anchor in
            setupConfiguration(&anchor)
            configuration(&anchor)
        }
        
        return self
    }
    
    func create(from initialAnchor: AnchorType) -> AnchorType {
        var anchor = initialAnchor
        setupConfiguration(&anchor)
        return anchor
    }
}
