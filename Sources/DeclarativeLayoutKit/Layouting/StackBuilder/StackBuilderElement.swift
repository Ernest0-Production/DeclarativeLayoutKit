//
//  StackBuilderElement.swift
//  
//
//  Created by Ernest0N on 12.10.2020.
//


public enum StackBuilderElement<Axis: StackAxis> {
    case space(StackBuilderSpace)
    case item(StackBuilderItemView<Axis>)
}
