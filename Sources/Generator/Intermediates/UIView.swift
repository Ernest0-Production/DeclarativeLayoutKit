import Foundation

extension UIView {

    
    public enum AnimationCurve : Int {

        
        case easeInOut = 0

        case easeIn = 1

        case easeOut = 2

        case linear = 3
    }

    
    public enum ContentMode : Int {

        
        case scaleToFill = 0

        case scaleAspectFit = 1 // contents scaled to fit with fixed aspect. remainder is transparent

        case scaleAspectFill = 2 // contents scaled to fill with fixed aspect. some portion of content may be clipped.

        case redraw = 3 // redraw on bounds change (calls -setNeedsDisplay)

        case center = 4 // contents remain same size. positioned adjusted.

        case top = 5

        case bottom = 6

        case left = 7

        case right = 8

        case topLeft = 9

        case topRight = 10

        case bottomLeft = 11

        case bottomRight = 12
    }

    
    public enum AnimationTransition : Int {

        
        case none = 0

        case flipFromLeft = 1

        case flipFromRight = 2

        case curlUp = 3

        case curlDown = 4
    }

    
    public struct AutoresizingMask : OptionSet {

        public init(rawValue: UInt)

        
        public static var flexibleLeftMargin: UIView.AutoresizingMask { get }

        public static var flexibleWidth: UIView.AutoresizingMask { get }

        public static var flexibleRightMargin: UIView.AutoresizingMask { get }

        public static var flexibleTopMargin: UIView.AutoresizingMask { get }

        public static var flexibleHeight: UIView.AutoresizingMask { get }

        public static var flexibleBottomMargin: UIView.AutoresizingMask { get }
    }

    
    @available(iOS 4.0, *)
    public struct AnimationOptions : OptionSet {

        public init(rawValue: UInt)

        
        public static var layoutSubviews: UIView.AnimationOptions { get }

        public static var allowUserInteraction: UIView.AnimationOptions { get } // turn on user interaction while animating

        public static var beginFromCurrentState: UIView.AnimationOptions { get } // start all views from current value, not initial value

        public static var `repeat`: UIView.AnimationOptions { get } // repeat animation indefinitely

        public static var autoreverse: UIView.AnimationOptions { get } // if repeat, run animation back and forth

        public static var overrideInheritedDuration: UIView.AnimationOptions { get } // ignore nested duration

        public static var overrideInheritedCurve: UIView.AnimationOptions { get } // ignore nested curve

        public static var allowAnimatedContent: UIView.AnimationOptions { get } // animate contents (applies to transitions only)

        public static var showHideTransitionViews: UIView.AnimationOptions { get } // flip to\/from hidden state instead of adding\/removing

        public static var overrideInheritedOptions: UIView.AnimationOptions { get } // do not inherit any options or animation type

        
        public static var curveEaseInOut: UIView.AnimationOptions { get } // default

        public static var curveEaseIn: UIView.AnimationOptions { get }

        public static var curveEaseOut: UIView.AnimationOptions { get }

        public static var curveLinear: UIView.AnimationOptions { get }

        
        public static var transitionFlipFromLeft: UIView.AnimationOptions { get }

        public static var transitionFlipFromRight: UIView.AnimationOptions { get }

        public static var transitionCurlUp: UIView.AnimationOptions { get }

        public static var transitionCurlDown: UIView.AnimationOptions { get }

        public static var transitionCrossDissolve: UIView.AnimationOptions { get }

        public static var transitionFlipFromTop: UIView.AnimationOptions { get }

        public static var transitionFlipFromBottom: UIView.AnimationOptions { get }

        
        public static var preferredFramesPerSecond60: UIView.AnimationOptions { get }

        public static var preferredFramesPerSecond30: UIView.AnimationOptions { get }
    }

    
    @available(iOS 7.0, *)
    public struct KeyframeAnimationOptions : OptionSet {

        public init(rawValue: UInt)

        
        public static var layoutSubviews: UIView.KeyframeAnimationOptions { get }

        public static var allowUserInteraction: UIView.KeyframeAnimationOptions { get } // turn on user interaction while animating

        public static var beginFromCurrentState: UIView.KeyframeAnimationOptions { get } // start all views from current value, not initial value

        public static var `repeat`: UIView.KeyframeAnimationOptions { get } // repeat animation indefinitely

        public static var autoreverse: UIView.KeyframeAnimationOptions { get } // if repeat, run animation back and forth

        public static var overrideInheritedDuration: UIView.KeyframeAnimationOptions { get } // ignore nested duration

        public static var overrideInheritedOptions: UIView.KeyframeAnimationOptions { get } // do not inherit any options or animation type

        
        public static var calculationModeLinear: UIView.KeyframeAnimationOptions { get } // default

        public static var calculationModeDiscrete: UIView.KeyframeAnimationOptions { get }

        public static var calculationModePaced: UIView.KeyframeAnimationOptions { get }

        public static var calculationModeCubic: UIView.KeyframeAnimationOptions { get }

        public static var calculationModeCubicPaced: UIView.KeyframeAnimationOptions { get }
    }

    
    @available(iOS 7.0, *)
    public enum SystemAnimation : UInt {

        
        case delete = 0 // removes the views from the hierarchy when complete
    }

    
    @available(iOS 7.0, *)
    public enum TintAdjustmentMode : Int {

        
        case automatic = 0

        
        case normal = 1

        case dimmed = 2
    }

    
    // for playback controls such as Play\/RW\/FF buttons and playhead scrubbers
    // for controls that result in some sort of directional change in the UI, e.g. a segmented control for text alignment or a D-pad in a game
    
    // default is [CALayer class]. Used when creating the underlying layer for the view.
    
    // default is YES. if set to NO, user events (touch, keys) are ignored and removed from the event queue.
    // default is 0
    // returns view's layer. Will always return a non-nil value. view is layer's delegate
    
    // NO by default
    
    //\/ The identifier of the focus group that this view belongs to. If this is nil, subviews inherit their superview's focus group.
    
    // This method returns the layout direction implied by the provided semantic content attribute relative to the application-wide layout direction (as returned by UIApplication.sharedApplication.userInterfaceLayoutDirection).
    
    // This method returns the layout direction implied by the provided semantic content attribute relative to the provided layout direction. For example, when provided a layout direction of RightToLeft and a semantic content attribute of Playback, this method returns LeftToRight. Layout and drawing code can use this method to determine how to arrange elements, but might find it easier to query the container view’s effectiveUserInterfaceLayoutDirection property instead.
    
    // Returns the user interface layout direction appropriate for arranging the immediate content of this view. Always consult the effectiveUserInterfaceLayoutDirection of the view whose immediate content is being arranged or drawn. Do not assume that the value propagates through the view’s subtree.
    
    // animatable. do not use frame if view is transformed since it will not correctly reflect the actual location of the view. use bounds + center instead.
    
    // use bounds\/center and not frame if non-identity transform. if bounds dimension is odd, center may be have fractional part
    // default bounds is zero origin, frame size. animatable
    // center is center of frame. animatable
    // default is CGAffineTransformIdentity. animatable. Please use this property instead of the affineTransform property on the layer
    // default is CATransform3DIdentity. animatable. Please use this property instead of the transform property on the layer
    
    // default is NO
    // default is NO
    
    // recursively calls -pointInside:withEvent:. point is in the receiver's coordinate system
    // default returns YES if point is in bounds
    
    // default is YES. if set, subviews are adjusted according to their autoresizingMask if self.bounds changes
    // simple resize. default is UIViewAutoresizingNone
    
    // return 'best' size to fit given size. does not actually resize view. Default is return existing view size
    // calls sizeThatFits: with current view bounds and changes bounds size.
    
    // returns YES for self.
    // recursive search. includes self
    
    // Allows you to perform layout before the drawing cycle happens. -layoutIfNeeded forces layout early
    
    // override point. called by layoutIfNeeded automatically. As of iOS 6.0, when constraints-based layout is used the base implementation applies the constraints-based layout, otherwise it does nothing.
    
    /* -layoutMargins returns a set of insets from the edge of the view's bounds that denote a default spacing for laying out content.
     If preservesSuperviewLayoutMargins is YES, margins cascade down the view tree, adjusting for geometry offsets, so that setting
     the left value of layoutMargins on a superview will affect the left value of layoutMargins for subviews positioned close to the
     left edge of their superview's bounds
       If your view subclass uses layoutMargins in its layout or drawing, override -layoutMarginsDidChange in order to refresh your 
     view if the margins change.
       On iOS 11.0 and later, please support both user interface layout directions by setting the directionalLayoutMargins property
     instead of the layoutMargins property. After setting the directionalLayoutMargins property, the values in the left and right
     fields of the layoutMargins property will depend on the user interface layout direction.
     */
    
    /* directionalLayoutMargins.leading is used on the left when the user interface direction is LTR and on the right for RTL.
     Vice versa for directionalLayoutMargins.trailing.
     */
    
    // default is NO - set to enable pass-through or cascading behavior of margins from this view’s parent to its children
    // Default: YES
    
    /* The edges of this guide are constrained to equal the edges of the view inset by the layoutMargins
     */
    
    //\/ This content guide provides a layout area that you can use to place text and related content whose width should generally be constrained to a size that is easy for the user to read. This guide provides a centered region that you can place content within to get this behavior for this view.
    
    /* The top of the safeAreaLayoutGuide indicates the unobscured top edge of the view (e.g, not behind
     the status bar or navigation bar, if present). Similarly for the other edges.
     */
    
    // When YES, content and subviews are clipped to the bounds of the view. Default is NO.
    // default is nil. Can be useful with the appearance proxy on custom UIView subclasses.
    // animatable. default is 1.0
    // default is YES. opaque views must fill their entire bounds or the results are undefined. the active CGContext in drawRect: will not have been cleared and may have non-zeroed pixels
    // default is YES. ignored for opaque views. for non-opaque views causes the active CGContext in drawRect: to be pre-filled with transparent pixels
    // default is NO. doesn't check superviews
    // default is UIViewContentModeScaleToFill
    // animatable. default is unit rectangle {{0,0} {1,1}}. Now deprecated: please use -[UIImage resizableImageWithCapInsets:] to achieve the same effect.
    
    /*
     -tintColor always returns a color. The color returned is the first non-default value in the receiver's superview chain (starting with itself).
     If no non-default value is found, a system-defined color is returned.
     If this view's -tintAdjustmentMode returns Dimmed, then the color that is returned for -tintColor will automatically be dimmed.
     If your view subclass uses tintColor in its rendering, override -tintColorDidChange in order to refresh the rendering if the color changes.
     */
    
    /*
     -tintAdjustmentMode always returns either UIViewTintAdjustmentModeNormal or UIViewTintAdjustmentModeDimmed. The value returned is the first non-default value in the receiver's superview chain (starting with itself).
     If no non-default value is found, UIViewTintAdjustmentModeNormal is returned.
     When tintAdjustmentMode has a value of UIViewTintAdjustmentModeDimmed for a view, the color it returns from tintColor will be modified to give a dimmed appearance.
     When the tintAdjustmentMode of a view changes (either the view's value changing or by one of its superview's values changing), -tintColorDidChange will be called to allow the view to refresh its rendering.
     */
    
    /*
     The -tintColorDidChange message is sent to appropriate subviews of a view when its tintColor is changed by client code or to subviews in the view hierarchy of a view whose tintColor is implicitly changed when its superview or tintAdjustmentMode changes.
     */
    
    // ignore any attribute changes while set.
    
    // delay = 0.0, options = 0
    
    // delay = 0.0, options = 0, completion = NULL
    
    /* Performs `animations` using a timing curve described by the motion of a spring. When `dampingRatio` is 1, the animation will smoothly decelerate to its final model values without oscillating. Damping ratios less than 1 will oscillate more and more before coming to a complete stop. You can use the initial spring velocity to specify how fast the object at the end of the simulated spring was moving before it was attached. It's a unit coordinate system, where 1 is defined as travelling the total animation distance in a second. So if you're changing an object's position by 200pt in this animation, and you want the animation to behave as if the object was moving at 100pt\/s before the animation started, you'd pass 0.5. You'll typically want to pass 0 for the velocity. */
    
    // toView added to fromView.superview, fromView removed from its superview
    
    /* Performs the requested system-provided animation on one or more views. Specify addtional animations in the parallelAnimations block. These additional animations will run alongside the system animation with the same timing and duration that the system animation defines\/inherits. Additional animations should not modify properties of the view on which the system animation is being performed. Not all system animations honor all available options.
     */
    
    /* Call this method from within an animation block to repeat animations, otherwise has no effect. The total duration of a repeating animation can be computed via (outerAnimationDuration * repeatCount * autoreverses ? 2 : 1). */
    
    // start time and duration are values between 0.0 and 1.0 specifying time and duration relative to the overall time of the keyframe animation
    
    // called when the recognizer attempts to transition out of UIGestureRecognizerStatePossible if a touch hit-tested to this view will be cancelled as a result of gesture recognition
    // returns YES by default. return NO to cause the gesture recognizer to transition to UIGestureRecognizerStateFailed
    // subclasses may override to prevent recognition of particular gestures. for example, UISlider prevents swipes parallel to the slider that start in the thumb
    
    /*! Begins applying `effect` to the receiver. The effect's emitted keyPath\/value pairs will be
        applied to the view's presentation layer.
     
        Animates the transition to the motion effect's values using the present UIView animation
        context. */
    
    /*! Stops applying `effect` to the receiver. Any affected presentation values will animate to
        their post-removal values using the present UIView animation context. */
    
    //
    // UIView Constraint-based Layout Support
    //
    
    // Installing Constraints
    
    /* A constraint is typically installed on the closest common ancestor of the views involved in the constraint. 
     It is required that a constraint be installed on _a_ common ancestor of every view involved.  The numbers in a constraint are interpreted in the coordinate system of the view it is installed on.  A view is considered to be an ancestor of itself.
     */
    
    // This method will be deprecated in a future release and should be avoided.  Instead, set NSLayoutConstraint's active property to YES.
    // This method will be deprecated in a future release and should be avoided.  Instead use +[NSLayoutConstraint activateConstraints:].
    // This method will be deprecated in a future release and should be avoided.  Instead set NSLayoutConstraint's active property to NO.
    // This method will be deprecated in a future release and should be avoided.  Instead use +[NSLayoutConstraint deactivateConstraints:].
    
    // Core Layout Methods
    
    /* To render a window, the following passes will occur, if necessary.  
     
     update constraints
     layout
     display
     
     Please see the conceptual documentation for a discussion of these methods.
     */
    
    // Updates the constraints from the bottom up for the view hierarchy rooted at the receiver. UIWindow's implementation creates a layout engine if necessary first.
    // Override this to adjust your special constraints during a constraints update pass
    
    // Compatibility and Adoption
    
    /* By default, the autoresizing mask on a view gives rise to constraints that fully determine 
     the view's position. This allows the auto layout system to track the frames of views whose 
     layout is controlled manually (through -setFrame:, for example).
     When you elect to position the view using auto layout by adding your own constraints, 
     you must set this property to NO. IB will do this for you.
     */
    // Default YES
    
    /* constraint-based layout engages lazily when someone tries to use it (e.g., adds a constraint to a view).  If you do all of your constraint set up in -updateConstraints, you might never even receive updateConstraints if no one makes a constraint.  To fix this chicken and egg problem, override this method to return YES if your view needs the window to use constraint-based layout.  
     */
    
    // Separation of Concerns
    
    /* Constraints do not actually relate the frames of the views, rather they relate the \"alignment rects\" of views.  This is the same as the frame unless overridden by a subclass of UIView.  Alignment rects are the same as the \"layout rects\" shown in Interface Builder 3.  Typically the alignment rect of a view is what the end user would think of as the bounding rect around a control, omitting ornamentation like shadows and engraving lines.  The edges of the alignment rect are what is interesting to align, not the shadows and such.  
     */
    
    /* These two methods should be inverses of each other.  UIKit will call both as part of layout computation.
     They may be overridden to provide arbitrary transforms between frame and alignment rect, though the two methods must be inverses of each other.
     However, the default implementation uses -alignmentRectInsets, so just override that if it's applicable.  It's easier to get right. 
     A view that displayed an image with some ornament would typically override these, because the ornamental part of an image would scale up with the size of the frame.  
     Set the NSUserDefault UIViewShowAlignmentRects to YES to see alignment rects drawn.
     */
    
    /* override this if the alignment rect is obtained from the frame by insetting each edge by a fixed amount.  This is only called by alignmentRectForFrame: and frameForAlignmentRect:.
     */
    
    /* -viewForFirstBaselineLayout is called by the constraints system when interpreting
     the firstBaseline attribute for a view.
        For complex custom UIView subclasses, override this method to return the text-based
     (i.e., UILabel or non-scrollable UITextView) descendant of the receiver whose first baseline
     is appropriate for alignment.
        UIView's implementation returns [self viewForLastBaselineLayout], so if the same 
     descendant is appropriate for both first- and last-baseline layout you may override
     just -viewForLastBaselineLayout.
     */
    
    /* -viewForLastBaselineLayout is called by the constraints system when interpreting
     the lastBaseline attribute for a view.
        For complex custom UIView subclasses, override this method to return the text-based
     (i.e., UILabel or non-scrollable UITextView) descendant of the receiver whose last baseline
     is appropriate for alignment.
        UIView's implementation returns self.
     */
    
    /* Override this method to tell the layout system that there is something it doesn't natively understand in this view, and this is how large it intrinsically is.  A typical example would be a single line text field.  The layout system does not understand text - it must just be told that there's something in the view, and that that something will take a certain amount of space if not clipped.  
     
     In response, UIKit will set up constraints that specify (1) that the opaque content should not be compressed or clipped, (2) that the view prefers to hug tightly to its content. 
     
     A user of a view may need to specify the priority of these constraints.  For example, by default, a push button 
     -strongly wants to hug its content in the vertical direction (buttons really ought to be their natural height)
     -weakly hugs its content horizontally (extra side padding between the title and the edge of the bezel is acceptable)
     -strongly resists compressing or clipping content in both directions. 
     
     However, you might have a case where you'd prefer to show all the available buttons with truncated text rather than losing some of the buttons. The truncation might only happen in portrait orientation but not in landscape, for example. In that case you'd want to setContentCompressionResistancePriority:forAxis: to (say) UILayoutPriorityDefaultLow for the horizontal axis.
     
     The default 'strong' and 'weak' priorities referred to above are UILayoutPriorityDefaultHigh and UILayoutPriorityDefaultLow.  
     
     Note that not all views have an intrinsicContentSize.  UIView's default implementation is to return (UIViewNoIntrinsicMetric, UIViewNoIntrinsicMetric).  The _intrinsic_ content size is concerned only with data that is in the view itself, not in other views. Remember that you can also set constant width or height constraints on any view, and you don't need to override instrinsicContentSize if these dimensions won't be changing with changing view content.
     */
    @available(iOS 6.0, *)
    public class let noIntrinsicMetric: CGFloat // -1

    
    // call this when something changes that affects the intrinsicContentSize.  Otherwise UIKit won't notice that it changed.
    
    // Size To Fit
    
    @available(iOS 6.0, *)
    public class let layoutFittingCompressedSize: CGSize

    @available(iOS 6.0, *)
    public class let layoutFittingExpandedSize: CGSize
}
@available(iOS 9.0, *)
public enum UISemanticContentAttribute : Int {

    case unspecified = 0

    case playback = 1

    case spatial = 2

    case forceLeftToRight = 3

    case forceRightToLeft = 4
}
public protocol UICoordinateSpace : NSObjectProtocol {

    @available(iOS 8.0, *)
    func convert(_ point: CGPoint, to coordinateSpace: UICoordinateSpace) -> CGPoint

    @available(iOS 8.0, *)
    func convert(_ point: CGPoint, from coordinateSpace: UICoordinateSpace) -> CGPoint

    @available(iOS 8.0, *)
    func convert(_ rect: CGRect, to coordinateSpace: UICoordinateSpace) -> CGRect

    @available(iOS 8.0, *)
    func convert(_ rect: CGRect, from coordinateSpace: UICoordinateSpace) -> CGRect

    @available(iOS 8.0, *)
    var bounds: CGRect { get }
}
@available(iOS 2.0, *)
open class UIView : UIResponder, NSCoding, UIAppearance, UIAppearanceContainer, UIDynamicItem, UITraitEnvironment, UICoordinateSpace, UIFocusItem, UIFocusItemContainer, CALayerDelegate {

    open class var layerClass: AnyClass { get }

    public init(frame: CGRect)

    public init?(coder: NSCoder)

    open var isUserInteractionEnabled: Bool

    open var tag: Int

    open var layer: CALayer { get }

    @available(iOS 9.0, *)
    open var canBecomeFocused: Bool { get }

    @available(iOS 9.0, *)
    open var isFocused: Bool { get }

    //\/ The identifier of the focus group that this view belongs to. If this is nil, subviews inherit their superview's focus group.
    @available(iOS 14.0, *)
    open var focusGroupIdentifier: String?

    @available(iOS 9.0, *)
    open var semanticContentAttribute: UISemanticContentAttribute

    @available(iOS 9.0, *)
    open class func userInterfaceLayoutDirection(for attribute: UISemanticContentAttribute) -> UIUserInterfaceLayoutDirection

    @available(iOS 10.0, *)
    open class func userInterfaceLayoutDirection(for semanticContentAttribute: UISemanticContentAttribute, relativeTo layoutDirection: UIUserInterfaceLayoutDirection) -> UIUserInterfaceLayoutDirection

    @available(iOS 10.0, *)
    open var effectiveUserInterfaceLayoutDirection: UIUserInterfaceLayoutDirection { get }
}
extension UIView {

    open var frame: CGRect

    open var bounds: CGRect

    open var center: CGPoint

    open var transform: CGAffineTransform

    @available(iOS 13.0, *)
    open var transform3D: CATransform3D

    @available(iOS 4.0, *)
    open var contentScaleFactor: CGFloat

    open var isMultipleTouchEnabled: Bool

    open var isExclusiveTouch: Bool

    open func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView?

    open func point(inside point: CGPoint, with event: UIEvent?) -> Bool

    open func convert(_ point: CGPoint, to view: UIView?) -> CGPoint

    open func convert(_ point: CGPoint, from view: UIView?) -> CGPoint

    open func convert(_ rect: CGRect, to view: UIView?) -> CGRect

    open func convert(_ rect: CGRect, from view: UIView?) -> CGRect

    open var autoresizesSubviews: Bool

    open var autoresizingMask: UIView.AutoresizingMask

    open func sizeThatFits(_ size: CGSize) -> CGSize

    open func sizeToFit()
}
extension UIView {

    open var superview: UIView? { get }

    open var subviews: [UIView] { get }

    open var window: UIWindow? { get }

    open func removeFromSuperview()

    open func insertSubview(_ view: UIView, at index: Int)

    open func exchangeSubview(at index1: Int, withSubviewAt index2: Int)

    open func addSubview(_ view: UIView)

    open func insertSubview(_ view: UIView, belowSubview siblingSubview: UIView)

    open func insertSubview(_ view: UIView, aboveSubview siblingSubview: UIView)

    open func bringSubviewToFront(_ view: UIView)

    open func sendSubviewToBack(_ view: UIView)

    open func didAddSubview(_ subview: UIView)

    open func willRemoveSubview(_ subview: UIView)

    open func willMove(toSuperview newSuperview: UIView?)

    open func didMoveToSuperview()

    open func willMove(toWindow newWindow: UIWindow?)

    open func didMoveToWindow()

    open func isDescendant(of view: UIView) -> Bool

    open func viewWithTag(_ tag: Int) -> UIView?

    open func setNeedsLayout()

    open func layoutIfNeeded()

    open func layoutSubviews()

    @available(iOS 8.0, *)
    open var layoutMargins: UIEdgeInsets

    @available(iOS 11.0, *)
    open var directionalLayoutMargins: NSDirectionalEdgeInsets

    @available(iOS 8.0, *)
    open var preservesSuperviewLayoutMargins: Bool

    @available(iOS 11.0, *)
    open var insetsLayoutMarginsFromSafeArea: Bool

    @available(iOS 8.0, *)
    open func layoutMarginsDidChange()

    @available(iOS 11.0, *)
    open var safeAreaInsets: UIEdgeInsets { get }

    @available(iOS 11.0, *)
    open func safeAreaInsetsDidChange()

    @available(iOS 9.0, *)
    open var layoutMarginsGuide: UILayoutGuide { get }

    //\/ This content guide provides a layout area that you can use to place text and related content whose width should generally be constrained to a size that is easy for the user to read. This guide provides a centered region that you can place content within to get this behavior for this view.
    @available(iOS 9.0, *)
    open var readableContentGuide: UILayoutGuide { get }

    @available(iOS 11.0, *)
    open var safeAreaLayoutGuide: UILayoutGuide { get }
}
extension UIView {

    open func draw(_ rect: CGRect)

    open func setNeedsDisplay()

    open func setNeedsDisplay(_ rect: CGRect)

    open var clipsToBounds: Bool

    @NSCopying open var backgroundColor: UIColor?

    open var alpha: CGFloat

    open var isOpaque: Bool

    open var clearsContextBeforeDrawing: Bool

    open var isHidden: Bool

    open var contentMode: UIView.ContentMode

    @available(iOS 8.0, *)
    open var mask: UIView?

    @available(iOS 7.0, *)
    open var tintColor: UIColor!

    @available(iOS 7.0, *)
    open var tintAdjustmentMode: UIView.TintAdjustmentMode

    @available(iOS 7.0, *)
    open func tintColorDidChange()
}
extension UIView {

    open class func setAnimationsEnabled(_ enabled: Bool)

    open class var areAnimationsEnabled: Bool { get }

    @available(iOS 7.0, *)
    open class func performWithoutAnimation(_ actionsWithoutAnimation: () -> Void)

    @available(iOS 9.0, *)
    open class var inheritedAnimationDuration: TimeInterval { get }
}
extension UIView {

    @available(iOS 4.0, *)
    open class func animate(withDuration duration: TimeInterval, delay: TimeInterval, options: UIView.AnimationOptions = [], animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil)

    @available(iOS 4.0, *)
    open class func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil)

    @available(iOS 4.0, *)
    open class func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void)

    @available(iOS 7.0, *)
    open class func animate(withDuration duration: TimeInterval, delay: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat, options: UIView.AnimationOptions = [], animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil)

    @available(iOS 4.0, *)
    open class func transition(with view: UIView, duration: TimeInterval, options: UIView.AnimationOptions = [], animations: (() -> Void)?, completion: ((Bool) -> Void)? = nil)

    @available(iOS 4.0, *)
    open class func transition(from fromView: UIView, to toView: UIView, duration: TimeInterval, options: UIView.AnimationOptions = [], completion: ((Bool) -> Void)? = nil)

    @available(iOS 7.0, *)
    open class func perform(_ animation: UIView.SystemAnimation, on views: [UIView], options: UIView.AnimationOptions = [], animations parallelAnimations: (() -> Void)?, completion: ((Bool) -> Void)? = nil)

    @available(iOS 12.0, *)
    open class func modifyAnimations(withRepeatCount count: CGFloat, autoreverses: Bool, animations: () -> Void)
}
extension UIView {

    @available(iOS 7.0, *)
    open class func animateKeyframes(withDuration duration: TimeInterval, delay: TimeInterval, options: UIView.KeyframeAnimationOptions = [], animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil)

    @available(iOS 7.0, *)
    open class func addKeyframe(withRelativeStartTime frameStartTime: Double, relativeDuration frameDuration: Double, animations: @escaping () -> Void)
}
extension UIView {

    @available(iOS 3.2, *)
    open var gestureRecognizers: [UIGestureRecognizer]?

    @available(iOS 3.2, *)
    open func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer)

    @available(iOS 3.2, *)
    open func removeGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer)

    @available(iOS 6.0, *)
    open func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool
}
extension UIView {

    /** Begins applying `effect` to the receiver. The effect's emitted keyPath\/value pairs will be
        applied to the view's presentation layer.
     
        Animates the transition to the motion effect's values using the present UIView animation
        context. */
    @available(iOS 7.0, *)
    open func addMotionEffect(_ effect: UIMotionEffect)

    /** Stops applying `effect` to the receiver. Any affected presentation values will animate to
        their post-removal values using the present UIView animation context. */
    @available(iOS 7.0, *)
    open func removeMotionEffect(_ effect: UIMotionEffect)

    @available(iOS 7.0, *)
    open var motionEffects: [UIMotionEffect]
}
extension NSLayoutConstraint {

    public enum Axis : Int {

        case horizontal = 0

        case vertical = 1
    }
}
extension UIView {

    @available(iOS 6.0, *)
    open var constraints: [NSLayoutConstraint] { get }

    @available(iOS 6.0, *)
    open func addConstraint(_ constraint: NSLayoutConstraint)

    @available(iOS 6.0, *)
    open func addConstraints(_ constraints: [NSLayoutConstraint])

    @available(iOS 6.0, *)
    open func removeConstraint(_ constraint: NSLayoutConstraint)

    @available(iOS 6.0, *)
    open func removeConstraints(_ constraints: [NSLayoutConstraint])
}
extension UIView {

    @available(iOS 6.0, *)
    open func updateConstraintsIfNeeded()

    @available(iOS 6.0, *)
    open func updateConstraints()

    @available(iOS 6.0, *)
    open func needsUpdateConstraints() -> Bool

    @available(iOS 6.0, *)
    open func setNeedsUpdateConstraints()
}
extension UIView {

    @available(iOS 6.0, *)
    open var translatesAutoresizingMaskIntoConstraints: Bool

    @available(iOS 6.0, *)
    open class var requiresConstraintBasedLayout: Bool { get }
}
extension UIView {

    @available(iOS 6.0, *)
    open func alignmentRect(forFrame frame: CGRect) -> CGRect

    @available(iOS 6.0, *)
    open func frame(forAlignmentRect alignmentRect: CGRect) -> CGRect

    @available(iOS 6.0, *)
    open var alignmentRectInsets: UIEdgeInsets { get }

    @available(iOS, introduced: 6.0, deprecated: 9.0, message: \"Override -viewForFirstBaselineLayout or -viewForLastBaselineLayout as appropriate, instead\")
    open func forBaselineLayout() -> UIView

    @available(iOS 9.0, *)
    open var forFirstBaselineLayout: UIView { get }

    @available(iOS 9.0, *)
    open var forLastBaselineLayout: UIView { get }

    @available(iOS 6.0, *)
    open var intrinsicContentSize: CGSize { get }

    @available(iOS 6.0, *)
    open func invalidateIntrinsicContentSize()

    @available(iOS 6.0, *)
    open func contentHuggingPriority(for axis: NSLayoutConstraint.Axis) -> UILayoutPriority

    @available(iOS 6.0, *)
    open func setContentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis)

    @available(iOS 6.0, *)
    open func contentCompressionResistancePriority(for axis: NSLayoutConstraint.Axis) -> UILayoutPriority

    @available(iOS 6.0, *)
    open func setContentCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis)
}

extension UIView {

    /* The size fitting most closely to targetSize in which the receiver's subtree can be laid out while optimally satisfying the constraints. If you want the smallest possible size, pass UILayoutFittingCompressedSize; for the largest possible size, pass UILayoutFittingExpandedSize.
     Also see the comment for UILayoutPriorityFittingSizeLevel.
     */
    @available(iOS 6.0, *)
    open func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize // Equivalent to sending -systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority: with UILayoutPriorityFittingSizeLevel for both priorities.

    @available(iOS 8.0, *)
    open func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize
}

extension UIView {

    
    /* UILayoutGuide objects owned by the receiver.
     */
    @available(iOS 9.0, *)
    open var layoutGuides: [UILayoutGuide] { get }

    
    /* Adds layoutGuide to the receiver, passing the receiver in -setOwningView: to layoutGuide.
     */
    @available(iOS 9.0, *)
    open func addLayoutGuide(_ layoutGuide: UILayoutGuide)

    
    /* Removes layoutGuide from the receiver, passing nil in -setOwningView: to layoutGuide.
     */
    @available(iOS 9.0, *)
    open func removeLayoutGuide(_ layoutGuide: UILayoutGuide)
}

extension UIView {

    /* Constraint creation conveniences. See NSLayoutAnchor.h for details.
     */
    @available(iOS 9.0, *)
    open var leadingAnchor: NSLayoutXAxisAnchor { get }

    @available(iOS 9.0, *)
    open var trailingAnchor: NSLayoutXAxisAnchor { get }

    @available(iOS 9.0, *)
    open var leftAnchor: NSLayoutXAxisAnchor { get }

    @available(iOS 9.0, *)
    open var rightAnchor: NSLayoutXAxisAnchor { get }

    @available(iOS 9.0, *)
    open var topAnchor: NSLayoutYAxisAnchor { get }

    @available(iOS 9.0, *)
    open var bottomAnchor: NSLayoutYAxisAnchor { get }

    @available(iOS 9.0, *)
    open var widthAnchor: NSLayoutDimension { get }

    @available(iOS 9.0, *)
    open var heightAnchor: NSLayoutDimension { get }

    @available(iOS 9.0, *)
    open var centerXAnchor: NSLayoutXAxisAnchor { get }

    @available(iOS 9.0, *)
    open var centerYAnchor: NSLayoutYAxisAnchor { get }

    @available(iOS 9.0, *)
    open var firstBaselineAnchor: NSLayoutYAxisAnchor { get }

    @available(iOS 9.0, *)
    open var lastBaselineAnchor: NSLayoutYAxisAnchor { get }
}

// Debugging

/* Everything in this section should be used in debugging only, never in shipping code.  These methods may not exist in the future - no promises.  
 */
extension UIView {

    
    /* This returns a list of all the constraints that are affecting the current location of the receiver.  The constraints do not necessarily involve the receiver, they may affect the frame indirectly.
     Pass UILayoutConstraintAxisHorizontal for the constraints affecting [self center].x and CGRectGetWidth([self bounds]), and UILayoutConstraintAxisVertical for the constraints affecting[self center].y and CGRectGetHeight([self bounds]).
     */
    @available(iOS 6.0, *)
    open func constraintsAffectingLayout(for axis: NSLayoutConstraint.Axis) -> [NSLayoutConstraint]

    
    /* If there aren't enough constraints in the system to uniquely determine layout, we say the layout is ambiguous.  For example, if the only constraint in the system was x = y + 100, then there are lots of different possible values for x and y.  This situation is not automatically detected by UIKit, due to performance considerations and details of the algorithm used for layout.  
     The symptom of ambiguity is that views sometimes jump from place to place, or possibly are just in the wrong place.
     -hasAmbiguousLayout runs a check for whether there is another center and bounds the receiver could have that could also satisfy the constraints.
     -exerciseAmbiguousLayout does more.  It randomly changes the view layout to a different valid layout.  Making the UI jump back and forth can be helpful for figuring out where you're missing a constraint.  
     */
    @available(iOS 6.0, *)
    open var hasAmbiguousLayout: Bool { get }

    
    @available(iOS 6.0, *)
    open func exerciseAmbiguityInLayout()
}

/* Everything in this section should be used in debugging only, never in shipping code.  These methods may not exist in the future - no promises.
 */
extension UILayoutGuide {

    
    /* This returns a list of all the constraints that are affecting the current location of the receiver.  The constraints do not necessarily involve the receiver, they may affect the frame indirectly.
     Pass UILayoutConstraintAxisHorizontal for the constraints affecting [self center].x and CGRectGetWidth([self bounds]), and UILayoutConstraintAxisVertical for the constraints affecting[self center].y and CGRectGetHeight([self bounds]).
     */
    @available(iOS 10.0, *)
    open func constraintsAffectingLayout(for axis: NSLayoutConstraint.Axis) -> [NSLayoutConstraint]

    
    /* If there aren't enough constraints in the system to uniquely determine layout, we say the layout is ambiguous.  For example, if the only constraint in the system was x = y + 100, then there are lots of different possible values for x and y.  This situation is not automatically detected by UIKit, due to performance considerations and details of the algorithm used for layout.
     The symptom of ambiguity is that views sometimes jump from place to place, or possibly are just in the wrong place.
     -hasAmbiguousLayout runs a check for whether there is another center and bounds the receiver could have that could also satisfy the constraints.
     */
    @available(iOS 10.0, *)
    open var hasAmbiguousLayout: Bool { get }
}

extension UIView {

    @available(iOS 6.0, *)
    open var restorationIdentifier: String?

    @available(iOS 6.0, *)
    open func encodeRestorableState(with coder: NSCoder)

    @available(iOS 6.0, *)
    open func decodeRestorableState(with coder: NSCoder)
}

extension UIView {

    /* 
    * When requesting a snapshot, 'afterUpdates' defines whether the snapshot is representative of what's currently on screen or if you wish to include any recent changes before taking the snapshot. 
     
     If called during layout from a committing transaction, snapshots occurring after the screen updates will include all changes made, regardless of when the snapshot is taken and the changes are made. For example:
     
         - (void)layoutSubviews {
             UIView *snapshot = [self snapshotViewAfterScreenUpdates:YES];
             self.alpha = 0.0;
         }
     
     The snapshot will appear to be empty since the change in alpha will be captured by the snapshot. If you need to animate the view during layout, animate the snapshot instead.
    
    * Creating snapshots from existing snapshots (as a method to duplicate, crop or create a resizable variant) is supported. In cases where many snapshots are needed, creating a snapshot from a common superview and making subsequent snapshots from it can be more performant. Please keep in mind that if 'afterUpdates' is YES, the original snapshot is committed and any changes made to it, not the view originally snapshotted, will be included.
     */
    @available(iOS 7.0, *)
    open func snapshotView(afterScreenUpdates afterUpdates: Bool) -> UIView?

    @available(iOS 7.0, *)
    open func resizableSnapshotView(from rect: CGRect, afterScreenUpdates afterUpdates: Bool, withCapInsets capInsets: UIEdgeInsets) -> UIView? // Resizable snapshots will default to stretching the center

    // Use this method to render a snapshot of the view hierarchy into the current context. Returns NO if the snapshot is missing image data, YES if the snapshot is complete. Calling this method from layoutSubviews while the current transaction is committing will capture what is currently displayed regardless if afterUpdates is YES.
    @available(iOS 7.0, *)
    open func drawHierarchy(in rect: CGRect, afterScreenUpdates afterUpdates: Bool) -> Bool
}

extension UIView {

    
    /* Deprecated in iOS 13.0. Please use the block-based animation API instead. */
    
    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func beginAnimations(_ animationID: String?, context: UnsafeMutableRawPointer?)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func commitAnimations()

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationDelegate(_ delegate: Any?)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationWillStart(_ selector: Selector?)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationDidStop(_ selector: Selector?)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationDuration(_ duration: TimeInterval)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationDelay(_ delay: TimeInterval)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationStart(_ startDate: Date)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationCurve(_ curve: UIView.AnimationCurve)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationRepeatCount(_ repeatCount: Float)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationRepeatAutoreverses(_ repeatAutoreverses: Bool)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationBeginsFromCurrentState(_ fromCurrentState: Bool)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationTransition(_ transition: UIView.AnimationTransition, for view: UIView, cache: Bool)
}

extension UIView {

    
    /* Set `overrideUserInterfaceStyle` to cause this view and its subviews to have a specific `UIUserInterfaceStyle`.
     * Reading this property does not return the current `UIUserInterfaceStyle`. Use `traitCollection.userInterfaceStyle` instead.
     *
     * Whenever possible, use the `overrideUserInterfaceStyle` property on `UIViewController` instead.
     *
     * Use this property only when:
     * - You want a particular style on a single view or small view hierarchy.
     * - You want a particular style on an entire `UIWindow` and its view controllers and presentations,
     *   but don't want to force your entire application to have that style.
     *
     *  (If you do want your entire application to have a certain style, don't use this, but instead
     *   set the `UIUserInterfaceStyle\" key in your Info.plist.)
     *
     * When set on an ordinary `UIView`:
     * - This property affects only the traits of this view and its subviews.
     * - It does not affect any view controllers, or any subviews that are owned by different view controllers.
     *
     * When set on a `UIWindow`:
     * - This property affects the `rootViewController` and thus the entire view controller and view hierarchy.
     * - It also affects presentations that happen inside the window.
     */
    @available(iOS 13.0, *)
    open var overrideUserInterfaceStyle: UIUserInterfaceStyle
}
,
extension UIView: Chainable {}
