//
//  File.swift
//  
//
//  Created by Ernest Babayan on 05.07.2021.
//

import Foundation

func onMainThread<Input>(_ handler: @escaping (Input) -> Void) -> (Input) -> Void {
    return { (input: Input) in
        guard !Thread.isMainThread else {
            return handler(input)
        }

        DispatchQueue.main.async(execute: { handler(input) })
    }
}
