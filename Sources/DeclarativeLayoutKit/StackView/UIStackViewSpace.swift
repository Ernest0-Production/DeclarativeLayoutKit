//
//  File.swift
//  
//
//  Created by Ernest Babayan on 04.07.2021.
//

import UIKit


public func UIStackViewSpace(_ value: CGFloat, withSummation: Bool = false) -> UIStackViewConfiguration {
    AnyUIStackViewConfiguration { (stackView: UIStackView) in
        let view = stackView.lastArrangedView
        
        var finalSpace = value
        
        if withSummation {
            let currentSpaces = stackView.customSpacing(after: view)
            
            if !UIStackView.systemSpaces.contains(currentSpaces) {
                finalSpace += currentSpaces
            }
        }
        
        stackView.setCustomSpacing(finalSpace, after: view)
    }
}

public func UIStackViewSpace(_ value: CGFloat, bindVisibilityTo view: UIView) -> UIStackViewConfiguration {
    AnyUIStackViewConfiguration { [weak view] (stackView: UIStackView) in
        guard let view = view else { return }
        
        let subscription = view.observe(
            \.isHidden,
            
            options: [.initial, .new],
            
            changeHandler: { [weak stackView] view, change in
                guard let isHidden = change.newValue else { return }
                
                stackView?.setCustomSpacing(
                    isHidden ? UIStackView.spacingUseDefault : value,
                    after: view
                )
            })
        
        whenDeallocated(view, subscription.invalidate)
    }
}

public final class UIStackViewDynamicSpaceProvider {
    public init(_ initialValue: CGFloat = UIStackView.spacingUseDefault) {
        self.currentValue = initialValue
    }
    
    private(set) public var currentValue: CGFloat
    
    private var observers: [(CGFloat) -> ()] = []
    
    fileprivate func addObserver(_ observer: @escaping (CGFloat) -> Void) {
        observers.append(observer)
        observer(currentValue)
    }
    
    public func update(with newValue: CGFloat) {
        currentValue = newValue
        for observer in observers { observer(currentValue) }
    }
}

public extension UIStackViewDynamicSpaceProvider {
    static func binding(space: CGFloat, toVisibility view: UIView) -> UIStackViewDynamicSpaceProvider {
        func getSpace(isHidden: Bool) -> CGFloat {
            if isHidden { return UIStackView.spacingUseDefault }
            else { return space }
        }
        
        let provider = UIStackViewDynamicSpaceProvider(getSpace(isHidden: view.isHidden))
        
        let subscription = view.observe(
            \.isHidden,
            options: [.new],
            changeHandler: { [weak provider] _, update in
                guard let newSpace = update.newValue.map(getSpace(isHidden:))
                else { return}
                
                provider?.update(with: newSpace)
        })
        
        whenDeallocated(view, { [weak provider] in
            provider?.update(with: getSpace(isHidden: true))
            subscription.invalidate()
        })
        
        return provider
    }
}

public func UIStackViewSpace(_ provider: UIStackViewDynamicSpaceProvider) -> UIStackViewConfiguration {
    AnyUIStackViewConfiguration { (stackView: UIStackView) in
        let view = stackView.lastArrangedView
        
        provider.addObserver(onMainThread { [weak stackView, weak view] (newSpace: CGFloat) in
            guard let view = view else { return }
            
            stackView?.setCustomSpacing(newSpace, after: view)
        })
        
        whenDeallocated(stackView, { _ = provider })
    }
}

private extension UIStackView {
    var lastArrangedView: UIView {
        guard let view = arrangedSubviews.last else {
            preconditionFailure("You cannot add a space before the first arranged view")
        }
        
        return view
    }
    
    static let systemSpaces = [UIStackView.spacingUseDefault, UIStackView.spacingUseSystem]
}
