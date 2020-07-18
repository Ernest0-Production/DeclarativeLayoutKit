//
//  File.swift
//  
//
//  Created by Бабаян Эрнест on 18.07.2020.
//


extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    func unwrap<Wrapped>() -> [Wrapped] where Element == Wrapped? {
        compactMap({ $0 })
    }
}

