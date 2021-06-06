//
//  File.swift
//  
//
//  Created by Ernest Babayan on 06.06.2021.
//

import UIKit


public extension AutoLayoutItemConvertible {
    func topAnchor(_ anchor: VerticalRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ view in
            makeRelativeConstraint(
                view: view,
                anchorProvider: { $0.topAnchor },
                second: anchor.asVerticalRelativeAutoLayoutAnchor(),
                invertConstant: false
            )
        })
    }

    func bottomAnchor(_ anchor: VerticalRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ view in
            makeRelativeConstraint(
                view: view,
                anchorProvider: { $0.bottomAnchor },
                second: anchor.asVerticalRelativeAutoLayoutAnchor(),
                invertConstant: true
            )
        })
    }
    
    func centerYAnchor(_ anchor: VerticalRelativeAutoLayoutAnchorConvertible = 0) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ view in
            makeRelativeConstraint(
                view: view,
                anchorProvider: { $0.centerYAnchor },
                second: anchor.asVerticalRelativeAutoLayoutAnchor(),
                invertConstant: false
            )
        })
    }
    
    func verticalAnchor(_ anchor: BidirectionRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        let bidirectionalAnchor = anchor.asBidirectionalRelativeAutoLayoutAnchor()
        
        return topAnchor(bidirectionalAnchor.toAxisAnchor(anchorPath: { $0.topAnchor }))
            .bottomAnchor(bidirectionalAnchor.toAxisAnchor(anchorPath: { $0.bottomAnchor }))
    }
    
    func leftAnchor(_ anchor: HorizontalRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ view in
            makeRelativeConstraint(
                view: view,
                anchorProvider: { $0.leftAnchor },
                second: anchor.asHorizontalRelativeAutoLayoutAnchor(),
                invertConstant: false
            )
        })
    }
    
    func rightAnchor(_ anchor: HorizontalRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ view in
            makeRelativeConstraint(
                view: view,
                anchorProvider: { $0.rightAnchor },
                second: anchor.asHorizontalRelativeAutoLayoutAnchor(),
                invertConstant: true
            )
        })
    }
    
    func centerXAnchor(_ anchor: HorizontalRelativeAutoLayoutAnchorConvertible = 0) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ view in
            makeRelativeConstraint(
                view: view,
                anchorProvider: { $0.centerXAnchor },
                second: anchor.asHorizontalRelativeAutoLayoutAnchor(),
                invertConstant: false
            )
        })
    }
    
    func horizontalAnchor(_ anchor: BidirectionRelativeAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        let bidirectionalAnchor = anchor.asBidirectionalRelativeAutoLayoutAnchor()
        
        return leftAnchor(bidirectionalAnchor.toAxisAnchor(anchorPath: { $0.leftAnchor }))
            .rightAnchor(bidirectionalAnchor.toAxisAnchor(anchorPath: { $0.rightAnchor }))
    }

    func edgesAnchors(
        _ insets: UIEdgeInsets = .zero,
        to target: UIView? = nil,
        priority: UILayoutPriority = UILayoutPriority(999)
    ) -> AutoLayoutItem {

        func make<Axis>(
            for anchor: (UIView) -> NSLayoutAnchor<Axis>,
            inset: CGFloat
        ) -> RelativeAutoLayoutAnchor<Axis> {
            RelativeAutoLayoutAnchor(
                relationType: .equal,
                priority: priority,
                target: target.map(anchor),
                constant: RelativeAutoLayoutAnchor<Axis>.Constant(value: inset, kind: .inset)
            )
        }

        return topAnchor(make(for: { $0.topAnchor }, inset: insets.top))
            .leftAnchor(make(for: { $0.leftAnchor }, inset: insets.left))
            .rightAnchor(make(for: { $0.rightAnchor }, inset: insets.right))
            .bottomAnchor(make(for: { $0.bottomAnchor }, inset: insets.bottom))
    }
    
    func widthAnchor(_ anchor: DimensionAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeDimensionConstraint(
                view: view,
                anchorProvider: \.widthAnchor,
                second: anchor.asDimensionAutoLayoutAnchor()
            )
        })
    }
    
    func heightAnchor(_ anchor: DimensionAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            makeDimensionConstraint(
                view: view,
                anchorProvider: \.heightAnchor,
                second: anchor.asDimensionAutoLayoutAnchor()
            )
        })
    }
    
    func sizeAnchor(_ anchor: BidirectionalDimensionAutoLayoutAnchorConvertible) -> AutoLayoutItem {
        let bidirectionalAnchor = anchor.asBidirectionalDimensionAutoLayoutAnchor()
        
        return heightAnchor(bidirectionalAnchor.toDimensionAnchor(anchorPath: { $0.heightAnchor }))
            .widthAnchor(bidirectionalAnchor.toDimensionAnchor(anchorPath: { $0.widthAnchor }))
    }
}

private extension RelativeAutoLayoutAnchor.Constant {
    func finalized(invert: Bool) -> CGFloat {
        switch (kind, invert) {
        case (.inset, false): return value
        case (.inset, true): return -value
        case (.offset, false): return value
        case (.offset, true): return -value
        }
    }
}
 
private func makeDimensionConstraint(
    view: UIView,
    anchorProvider: (UIView) -> NSLayoutDimension,
    second anotherAnchor: DimensionAutoLayoutAnchor
) {
    let constraint: NSLayoutConstraint
    
    if let target = anotherAnchor.target {
        switch anotherAnchor.relationType {
        case .equal:
            constraint = anchorProvider(view).constraint(
                equalTo: target.anchor ?? anchorProvider(view.superview!),
                multiplier: target.multiplier,
                constant: anotherAnchor.constant
            )
            
        case .less:
            constraint = anchorProvider(view).constraint(
                lessThanOrEqualTo: target.anchor ?? anchorProvider(view.superview!),
                multiplier: target.multiplier,
                constant: anotherAnchor.constant
            )
            
        case .greater:
            constraint = anchorProvider(view).constraint(
                greaterThanOrEqualTo: target.anchor ?? anchorProvider(view.superview!),
                multiplier: target.multiplier,
                constant: anotherAnchor.constant
            )
        }
    } else {
        switch anotherAnchor.relationType {
        case .equal:
            constraint = anchorProvider(view).constraint(equalToConstant: anotherAnchor.constant)
            
        case .less:
            constraint = anchorProvider(view).constraint(lessThanOrEqualToConstant: anotherAnchor.constant)
            
        case .greater:
            constraint = anchorProvider(view).constraint(greaterThanOrEqualToConstant: anotherAnchor.constant)
        }
    }
    
    constraint.priority = anotherAnchor.priority
    constraint.isActive = true
}

private func makeRelativeConstraint<AnchorType>(
    view: UIView,
    anchorProvider: (UIView) -> NSLayoutAnchor<AnchorType>,
    second anotherAnchor: RelativeAutoLayoutAnchor<AnchorType>,
    invertConstant: Bool
) {
    let constraint: NSLayoutConstraint
    
    switch anotherAnchor.relationType {
    case .equal:
        constraint = anchorProvider(view).constraint(
            equalTo: anotherAnchor.target ?? anchorProvider(view.superview!),
            constant: anotherAnchor.constant.finalized(invert: invertConstant)
        )
        
    case .less:
        constraint = anchorProvider(view).constraint(
            lessThanOrEqualTo: anotherAnchor.target ?? anchorProvider(view.superview!),
            constant: anotherAnchor.constant.finalized(invert: invertConstant)
        )
        
    case .greater:
        constraint = anchorProvider(view).constraint(
            greaterThanOrEqualTo: anotherAnchor.target ?? anchorProvider(view.superview!),
            constant: anotherAnchor.constant.finalized(invert: invertConstant)
        )
    }
    
    constraint.priority = anotherAnchor.priority
    constraint.isActive = true
}

/*
 TODO:
 width to superview
 */

private extension BidirectionRelativeAutoLayoutAnchor {
    func toAxisAnchor<Axis>(
        anchorPath: (AutoLauoutGuide) -> NSLayoutAnchor<Axis>
    ) -> RelativeAutoLayoutAnchor<Axis> {
        RelativeAutoLayoutAnchor(
            relationType: relationType,
            priority: priority,
            target: target.map(anchorPath),
            constant: constant
        )
    }
}

private extension BidirectionalDimensionAutoLayoutAnchor {
    func toDimensionAnchor(
        anchorPath: (AutoLauoutGuide) -> NSLayoutDimension
    ) -> DimensionAutoLayoutAnchor {
        DimensionAutoLayoutAnchor(
            relationType: relationType,
            priority: priority,
            target: target.map({ DimensionAutoLayoutAnchor.Target(anchor: $0.layoutGuide.map(anchorPath), multiplier: $0.multiplier) }),
            constant: constant
        )
    }
}
