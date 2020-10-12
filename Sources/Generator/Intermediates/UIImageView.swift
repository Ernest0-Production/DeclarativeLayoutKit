import Foundation

//
//  UIImageView.h
//  UIKit
//
//  Copyright (c) 2006-2018 Apple Inc. All rights reserved.
//

@available(iOS 2.0, *)
open class UIImageView : UIView {

    
    public init(image: UIImage?)

    @available(iOS 3.0, *)
    public init(image: UIImage?, highlightedImage: UIImage?)

    
    open var image: UIImage? // default is nil

    @available(iOS 3.0, *)
    open var highlightedImage: UIImage? // default is nil

    @available(iOS 13.0, *)
    open var preferredSymbolConfiguration: UIImage.SymbolConfiguration?

    open var isUserInteractionEnabled: Bool // default is NO

    
    @available(iOS 3.0, *)
    open var isHighlighted: Bool // default is NO

    
    // these allow a set of images to be animated. the array may contain multiple copies of the same
    
    open var animationImages: [UIImage]? // The array must contain UIImages. Setting hides the single image. default is nil

    @available(iOS 3.0, *)
    open var highlightedAnimationImages: [UIImage]? // The array must contain UIImages. Setting hides the single image. default is nil

    
    open var animationDuration: TimeInterval // for one cycle of images. default is number of images * 1\/30th of a second (i.e. 30 fps)

    open var animationRepeatCount: Int // 0 means infinite (default is 0)

    
    // When tintColor is non-nil, any template images set on the image view will be colorized with that color.
    // The tintColor is inherited through the superview hierarchy. See UIView for more information.
    @available(iOS 7.0, *)
    open var tintColor: UIColor!

    
    open func startAnimating()

    open func stopAnimating()

    open var isAnimating: Bool { get }
}
,
extension UIImageView: Chainable {}
