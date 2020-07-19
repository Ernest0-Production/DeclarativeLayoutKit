//
//  MarginItemConvertable.swift
//  UICore
//
//  Created by Бабаян Эрнест on 11.07.2020.
//

import UIKit
import SnapKit


public final class ViewLayoutBuilder {
    public typealias ConstraintBuild = (ConstraintMaker) -> Void
    
    public let view: UIView
    
    fileprivate var constraintBuilds: [ConstraintBuild]
    
    fileprivate init(view: UIView, constraintBuilds: [ConstraintBuild] = []) {
        self.view = view
        self.constraintBuilds = constraintBuilds
    }
    
    @discardableResult
    func addConstraint(_ build: @escaping ConstraintBuild) -> Self {
        constraintBuilds.append(build)
        return self
    }
    
    public func build() {
        view.snp.makeConstraints { maker in
            constraintBuilds.forEach({ $0(maker) })
        }
    }
}

extension ViewLayoutBuilder: ViewConvertable {
    public func asView() -> UIView { view }
}

public protocol ViewLayoutBuilderConvertable {
    func asLayoutBuilder() -> ViewLayoutBuilder
}

extension ViewLayoutBuilder: ViewLayoutBuilderConvertable {
    public func asLayoutBuilder() -> ViewLayoutBuilder { self }
}

extension UIView: ViewLayoutBuilderConvertable {
    public func asLayoutBuilder() -> ViewLayoutBuilder {
        ViewLayoutBuilder(view: self)
    }
}


public extension ViewConvertable {
    @discardableResult
    func add(_ convertables: ViewLayoutBuilderConvertable...) -> Self {
        for convertable in convertables {
            let builder = convertable.asLayoutBuilder()
            
            asView().addSubview(builder.view)
            builder.view.translatesAutoresizingMaskIntoConstraints = false
            builder.build()
        }
        
        return self
    }
}

public extension ViewLayoutBuilderConvertable {
    
    @discardableResult
    func layout(_ build: @escaping ViewLayoutBuilder.ConstraintBuild) -> ViewLayoutBuilder {
        self.asLayoutBuilder().addConstraint(build)
    }
    
    @discardableResult
    func stretch(_ insets: UIEdgeInsets = 0, to item: ConstraintRelatableTarget? = nil, priority: UILayoutPriority = 999) -> ViewLayoutBuilder {
        self.layout { $0.edges.equalToFallbackingSuperview(item).inset(insets).priority(priority) }
    }
    
    @discardableResult
    func anhors(_ insets: UIEdgeInsets, to item: ConstraintRelatableTarget? = nil, priority: UILayoutPriority = 999) -> ViewLayoutBuilder {
        self.layout {
                if !insets.left.isZero {
                    $0.left.equalToFallbackingSuperview(item).inset(insets.left).priority(priority)
                }
                if !insets.right.isZero {
                    $0.right.equalToFallbackingSuperview(item).inset(insets.right).priority(priority)
                }
                if !insets.top.isZero {
                    $0.top.equalToFallbackingSuperview(item).inset(insets.top).priority(priority)
                }
                if !insets.bottom.isZero {
                    $0.bottom.equalToFallbackingSuperview(item).inset(insets.bottom).priority(priority)
                }
        }
    }
    
    @discardableResult
    func topAnchor(_ value: CGFloat, to item: ConstraintRelatableTarget? = nil, priority: UILayoutPriority = 999) -> ViewLayoutBuilder {
        self.layout { $0.top.equalToFallbackingSuperview(item).inset(value).priority(priority) }
    }
    
    @discardableResult
    func bottomAnchor(_ value: CGFloat, to item: ConstraintRelatableTarget? = nil, priority: UILayoutPriority = 999) -> ViewLayoutBuilder {
        self.layout { $0.top.equalToFallbackingSuperview(item).inset(value).priority(priority) }
    }
    
    @discardableResult
    func leftAnchor(_ value: CGFloat, to item: ConstraintRelatableTarget? = nil, priority: UILayoutPriority = 999) -> ViewLayoutBuilder {
        self.layout { $0.left.equalToFallbackingSuperview(item).inset(value).priority(priority) }
    }
    
    @discardableResult
    func rightAnhor(_ value: CGFloat, to item: ConstraintRelatableTarget? = nil, priority: UILayoutPriority = 999) -> ViewLayoutBuilder {
        self.layout { $0.right.equalToFallbackingSuperview(item).inset(value).priority(priority) }
    }
    
    @discardableResult
    func sideAnchor(_ value: CGFloat, to item: ConstraintRelatableTarget? = nil, priority: UILayoutPriority = 999) -> ViewLayoutBuilder {
        self.leftAnchor(value, to: item, priority: priority).rightAnhor(value, to: item, priority: priority)
    }
    
    @discardableResult
    func verticalMargin(_ value: CGFloat, to item: ConstraintRelatableTarget? = nil, priority: UILayoutPriority = 999) -> ViewLayoutBuilder {
        self.topAnchor(value, to: item, priority: priority).bottomAnchor(value, to: item, priority: priority)
    }
    
    @discardableResult
    func centerXAnchor(_ value: CGFloat = 0, to item: ConstraintRelatableTarget? = nil, priority: UILayoutPriority = 999) -> ViewLayoutBuilder {
        self.layout { $0.centerX.equalToFallbackingSuperview(item).inset(value).priority(priority) }
    }
    
    @discardableResult
    func centerYAnchor(_ value: CGFloat = 0, to item: ConstraintRelatableTarget? = nil, priority: UILayoutPriority = 999) -> ViewLayoutBuilder {
        self.layout { $0.centerY.equalToFallbackingSuperview(item).inset(value).priority(priority) }
    }
    
    @discardableResult
    func centerAnchor(_ value: CGFloat = 0, to item: ConstraintRelatableTarget? = nil, priority: UILayoutPriority = 999) -> ViewLayoutBuilder {
        self.centerYAnchor(value, to: item, priority: priority).centerXAnchor(value, to: item, priority: priority)
    }
}


private extension ConstraintMakerExtendable {
    func equalToFallbackingSuperview(_ anotherAnchor: ConstraintRelatableTarget? = nil) -> ConstraintMakerEditable {
        guard let anotherAnchor = anotherAnchor else {
            return self.equalToSuperview()
        }
        
        return self.equalTo(anotherAnchor)
    }
}
