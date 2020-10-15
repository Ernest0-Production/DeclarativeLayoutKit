//
//  ViewStyle.swift
//  
//
//  Created by Ernest0N on 13.10.2020.
//

public final class ViewStyle<Target: ViewStyleCompatible> {
    private let handler: (Target) -> ()

    public init(_ handler: @escaping (Target) -> ()) {
        self.handler = handler
    }

    func apply(into target: Target) {
        handler(target)
    }
}

public extension ViewStyle {
    func adding(_ second: ViewStyle<Target>) -> ViewStyle<Target> {
        [self, second].merge()
    }
}

public extension Sequence {
    func merge<Target: ViewStyleCompatible>() -> ViewStyle<Target> where Element == ViewStyle<Target>{
        ViewStyle<Target> { target in
            self.forEach { $0.apply(into: target) }
        }
    }
}
