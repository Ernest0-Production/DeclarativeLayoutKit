//
//  StackView.swift
//  UICore
//
//  Created by Бабаян Эрнест on 11.07.2020.
//

import UIKit
import SnapKit


@_functionBuilder
public struct HStackBuilder {
    public static func buildBlock(_ items: StackingLayoutBuilderConvertable...) -> UIView {
        UIView().add(axis: .horizontal, items)
    }
}

public func HStack(@HStackBuilder builder: () -> UIView) -> UIView {
    builder()
}

@_functionBuilder
public struct VStackBuilder {
    public static func buildBlock(_ items: StackingLayoutBuilderConvertable...) -> UIView {
        UIView().add(axis: .vertical, items)
    }
}

public func VStack(@VStackBuilder builder: () -> UIView) -> UIView {
    builder()
}


public final class StackingLayoutBuilder {
    public enum Axis {
        case vertical, horizontal
    }
    
    struct Margin {
        let value: CGFloat
        let priority: UILayoutPriority
    }
   
    let view: UIView
    var beforeSpace: Margin
    var afterSpace: Margin
    var sideInset: Margin
    var centerAlign: Bool
    
    init(view: UIView,
         beforeSpace: Margin = .zero,
         afterSpace: Margin = .zero,
         sideInset: Margin = .zero,
         centerAlign: Bool = false) {
        self.view = view
        self.beforeSpace = beforeSpace
        self.afterSpace = afterSpace
        self.sideInset = sideInset
        self.centerAlign = centerAlign
    }
}

extension StackingLayoutBuilder.Margin {
    static var zero: StackingLayoutBuilder.Margin {
        .init(value: 0, priority: 999)
    }
}
   

public protocol StackingLayoutBuilderConvertable {
    func asStackItemBuilder() -> StackingLayoutBuilder
}

extension StackingLayoutBuilder: StackingLayoutBuilderConvertable {
    public func asStackItemBuilder() -> StackingLayoutBuilder { self }
}


extension UIView: StackingLayoutBuilderConvertable {
    public func asStackItemBuilder() -> StackingLayoutBuilder {
        StackingLayoutBuilder(view: self)
    }
}


public extension StackingLayoutBuilderConvertable {
    func beforeSpace(_ space: CGFloat, priority: UILayoutPriority = 999) -> StackingLayoutBuilder {
        let builder = self.asStackItemBuilder()
        builder.beforeSpace = .init(value: space, priority: priority)
        
        return builder
    }
    
    func afterSpace(_ space: CGFloat, priority: UILayoutPriority = 999) -> StackingLayoutBuilder {
        let builder = self.asStackItemBuilder()
        builder.afterSpace = .init(value: space, priority: priority)
        
        return builder
    }
    
    func sideInset(_ space: CGFloat, priority: UILayoutPriority = 999) -> StackingLayoutBuilder {
        let builder = self.asStackItemBuilder()
        builder.sideInset = .init(value: space, priority: priority)
        
        return builder
    }
    
    func centerAlign() -> StackingLayoutBuilder {
        let builder = self.asStackItemBuilder()
        builder.centerAlign = true
        
        return builder
    }
}


private extension ViewConvertable {
    func add(axis: StackingLayoutBuilder.Axis = .vertical, _ builderConvertables: [StackingLayoutBuilderConvertable]) -> Self {
        guard builderConvertables.count > 0 else {
            return self
        }
        
        let builders = builderConvertables.map({ $0.asStackItemBuilder() })
        builders.forEach({ view.addSubview($0.view) })
        
        guard builders.count > 0 else {
            return self
        }
        
        var currentIndex = 0
        
        let firstBuilder = builders[currentIndex]
        firstBuilder.view.snp.makeConstraints {
            makeSideConstraints(for: firstBuilder, axis: axis)
            
            let startConstraint: ConstraintMakerEditable
            switch axis {
            case .vertical:
                startConstraint = $0.top.equalToSuperview()
            case .horizontal:
                startConstraint = $0.left.equalToSuperview()
            }
            
            startConstraint.inset(firstBuilder.beforeSpace.value).priority(firstBuilder.beforeSpace.priority)
        }
        
        currentIndex += 1
        while let currentBuilder = builders[safe: currentIndex] {
            
            currentBuilder.view.snp.makeConstraints {
                let previousBuilder = builders[currentIndex - 1]
                let next: ConstraintMakerEditable
                
                makeSideConstraints(for: currentBuilder, axis: axis)
                
                switch axis {
                case .vertical:
                    next = $0.top.equalTo(previousBuilder.view.snp.bottom)
                case .horizontal:
                    next = $0.left.equalTo(previousBuilder.view.snp.right)
                }
                
                next.inset(-[previousBuilder.afterSpace.value, currentBuilder.beforeSpace.value].unwrap().reduce(0, +))
                    .priority([previousBuilder.afterSpace.priority, currentBuilder.beforeSpace.priority].max()!)
            }
            
            currentIndex += 1
        }
        
        let lastBuilder = builders.last!
        lastBuilder.view.snp.makeConstraints({
            let endConstraint: ConstraintMakerEditable
            
            switch axis {
            case .vertical:
                endConstraint = $0.bottom.equalToSuperview()
            case .horizontal:
                endConstraint = $0.right.equalToSuperview()
            }
            
            endConstraint.inset(lastBuilder.afterSpace.value).priority(lastBuilder.afterSpace.priority)
        })
        
        return self
    }
    
    private func makeSideConstraints(for builder: StackingLayoutBuilder, axis: StackingLayoutBuilder.Axis) {
        builder.view.snp.makeConstraints {
            switch axis {
            case .vertical:
                if builder.centerAlign {
                    $0.centerX.equalToSuperview().priority(999)
                } else {
                    $0.left.right.equalToSuperview().inset(builder.sideInset.value).priority(builder.sideInset.priority)
                }
                
            case .horizontal:
                if builder.centerAlign {
                    $0.centerY.equalToSuperview().priority(999)
                } else {
                    $0.top.bottom.equalToSuperview().inset(builder.sideInset.value).priority(builder.sideInset.priority)
                    
                }
            }
        }
    }
}
