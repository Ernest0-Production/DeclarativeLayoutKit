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

public typealias UIStackViewSpaceObserver = (CGFloat) -> Void
public typealias UIStackViewSpaceProvider = (UIStackViewSpaceObserver) -> Void

public func UIStackViewSpace(dynamic provider: @escaping UIStackViewSpaceProvider) -> UIStackViewConfiguration {
    AnyUIStackViewConfiguration { (stackView: UIStackView) in
        let view = stackView.lastArrangedView
        
        provider({ [weak stackView, weak view] (newSpace: CGFloat) in
            guard let view = view else { return }
            
            stackView?.setCustomSpacing(newSpace, after: view)
        })
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
    
    func observeArrangedSubviews(_ observer: @escaping ([UIView]) -> Void) {
        let subscription = layer.observe(
            \.sublayers,
            
            options: [.initial, .new],
            
            changeHandler: { [unowned self] _, _ in
                observer(arrangedSubviews)
            }
        )
        
        whenDeallocated(self, subscription.invalidate)
    }
}
