//
//  StackElement.swift
//  
//
//  Created by Ernest0N on 12.10.2020.
//

import UIKit


public enum StackElement<Axis: StackAxis> {
    case space(StackSpace)
    case item(StackItemView<Axis>)
}
//
//public protocol HorizontalStackElementConvertable {
//    func asStackElement() -> StackElement<HorizontalStackAxis>
//}
//
//public protocol VerticalStackElementConvertable {
//    func asStackElement() -> StackElement<VerticalStackAxis>
//}
//
//
//extension StackSpace: HorizontalStackElementConvertable, VerticalStackElementConvertable {
//    public func asStackElement() -> StackElement<HorizontalStackAxis> {
//        StackElement<HorizontalStackAxis>.space(self)
//    }
//
//    public func asStackElement() -> StackElement<VerticalStackAxis> {
//        StackElement<VerticalStackAxis>.space(self)
//    }
//}
