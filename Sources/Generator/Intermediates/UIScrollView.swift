import Foundation

extension UIScrollView {

    
    public enum IndicatorStyle : Int {

        
        case `default` = 0

        case black = 1

        case white = 2
    }

    
    @available(iOS 7.0, *)
    public enum KeyboardDismissMode : Int {

        
        case none = 0

        case onDrag = 1 // dismisses the keyboard when a drag begins

        case interactive = 2 // the keyboard follows the dragging touch off screen, and may be pulled upward again to cancel the dismiss
    }

    
    public enum IndexDisplayMode : Int {

        
        case automatic = 0 // the index will show or hide automatically as needed

        case alwaysHidden = 1 // the index will never be displayed
    }

    
    @available(iOS 11.0, *)
    public enum ContentInsetAdjustmentBehavior : Int {

        
        case automatic = 0 // Similar to .scrollableAxes, but for backward compatibility will also adjust the top & bottom contentInset when the scroll view is owned by a view controller with automaticallyAdjustsScrollViewInsets = YES inside a navigation controller, regardless of whether the scroll view is scrollable

        case scrollableAxes = 1 // Edges for scrollable axes are adjusted (i.e., contentSize.width\/height > frame.size.width\/height or alwaysBounceHorizontal\/Vertical = YES)

        case never = 2 // contentInset is not adjusted

        case always = 3 // contentInset is always adjusted by the scroll view's safeAreaInsets
    }

    
    public struct DecelerationRate : Hashable, Equatable, RawRepresentable {

        public init(rawValue: CGFloat)
    }
}
extension UIScrollView.DecelerationRate {

    
    @available(iOS 3.0, *)
    public static let normal: UIScrollView.DecelerationRate

    @available(iOS 3.0, *)
    public static let fast: UIScrollView.DecelerationRate
}

@available(iOS 2.0, *)
open class UIScrollView : UIView, NSCoding, UIFocusItemScrollableContainer {

    
    open var contentOffset: CGPoint // default CGPointZero

    open var contentSize: CGSize // default CGSizeZero

    open var contentInset: UIEdgeInsets // default UIEdgeInsetsZero. add additional scroll area around content

    
    /* When contentInsetAdjustmentBehavior allows, UIScrollView may incorporate
     its safeAreaInsets into the adjustedContentInset.
     */
    @available(iOS 11.0, *)
    open var adjustedContentInset: UIEdgeInsets { get }

    
    /* Also see -scrollViewDidChangeAdjustedContentInset: in the UIScrollViewDelegate protocol.
     */
    @available(iOS 11.0, *)
    open func adjustedContentInsetDidChange()

    
    /* Configure the behavior of adjustedContentInset.
     Default is UIScrollViewContentInsetAdjustmentAutomatic.
     */
    @available(iOS 11.0, *)
    open var contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior

    
    /* Configures whether the scroll indicator insets are automatically adjusted by the system.
     Default is YES.
     */
    @available(iOS 13.0, *)
    open var automaticallyAdjustsScrollIndicatorInsets: Bool

    
    /* contentLayoutGuide anchors (e.g., contentLayoutGuide.centerXAnchor, etc.) refer to
     the untranslated content area of the scroll view.
     */
    @available(iOS 11.0, *)
    open var contentLayoutGuide: UILayoutGuide { get }

    
    /* frameLayoutGuide anchors (e.g., frameLayoutGuide.centerXAnchor) refer to
     the untransformed frame of the scroll view.
     */
    @available(iOS 11.0, *)
    open var frameLayoutGuide: UILayoutGuide { get }

    
    weak open var delegate: UIScrollViewDelegate? // default nil. weak reference

    open var isDirectionalLockEnabled: Bool // default NO. if YES, try to lock vertical or horizontal scrolling while dragging

    open var bounces: Bool // default YES. if YES, bounces past edge of content and back again

    open var alwaysBounceVertical: Bool // default NO. if YES and bounces is YES, even if content is smaller than bounds, allow drag vertically

    open var alwaysBounceHorizontal: Bool // default NO. if YES and bounces is YES, even if content is smaller than bounds, allow drag horizontally

    open var isPagingEnabled: Bool // default NO. if YES, stop on multiples of view bounds

    open var isScrollEnabled: Bool // default YES. turn off any dragging temporarily

    
    open var showsVerticalScrollIndicator: Bool // default YES. show indicator while we are tracking. fades out after tracking

    open var showsHorizontalScrollIndicator: Bool // default YES. show indicator while we are tracking. fades out after tracking

    open var indicatorStyle: UIScrollView.IndicatorStyle // default is UIScrollViewIndicatorStyleDefault

    
    @available(iOS 11.1, *)
    open var verticalScrollIndicatorInsets: UIEdgeInsets // default is UIEdgeInsetsZero.

    @available(iOS 11.1, *)
    open var horizontalScrollIndicatorInsets: UIEdgeInsets // default is UIEdgeInsetsZero.

    open var scrollIndicatorInsets: UIEdgeInsets // use the setter only, as a convenience for setting both verticalScrollIndicatorInsets and horizontalScrollIndicatorInsets to the same value. if those properties have been set to different values, the return value of this getter (deprecated) is undefined.

    
    @available(iOS 3.0, *)
    open var decelerationRate: UIScrollView.DecelerationRate

    open var indexDisplayMode: UIScrollView.IndexDisplayMode

    
    open func setContentOffset(_ contentOffset: CGPoint, animated: Bool) // animate at constant velocity to new offset

    open func scrollRectToVisible(_ rect: CGRect, animated: Bool) // scroll so rect is just visible (nearest edges). nothing if rect completely visible

    
    open func flashScrollIndicators() // displays the scroll indicators for a short time. This should be done whenever you bring the scroll view to front.

    
    /*
     Scrolling with no scroll bars is a bit complex. on touch down, we don't know if the user will want to scroll or track a subview like a control.
     on touch down, we start a timer and also look at any movement. if the time elapses without sufficient change in position, we start sending events to
     the hit view in the content subview. if the user then drags far enough, we switch back to dragging and cancel any tracking in the subview.
     the methods below are called by the scroll view and give subclasses override points to add in custom behaviour.
     you can remove the delay in delivery of touchesBegan:withEvent: to subviews by setting delaysContentTouches to NO.
     */
    
    open var isTracking: Bool { get } // returns YES if user has touched. may not yet have started dragging

    open var isDragging: Bool { get } // returns YES if user has started scrolling. this may require some time and or distance to move to initiate dragging

    open var isDecelerating: Bool { get } // returns YES if user isn't dragging (touch up) but scroll view is still moving

    
    open var delaysContentTouches: Bool // default is YES. if NO, we immediately call -touchesShouldBegin:withEvent:inContentView:. this has no effect on presses

    open var canCancelContentTouches: Bool // default is YES. if NO, then once we start tracking, we don't try to drag if the touch moves. this has no effect on presses

    
    // override points for subclasses to control delivery of touch events to subviews of the scroll view
    // called before touches are delivered to a subview of the scroll view. if it returns NO the touches will not be delivered to the subview
    // this has no effect on presses
    // default returns YES
    open func touchesShouldBegin(_ touches: Set<UITouch>, with event: UIEvent?, in view: UIView) -> Bool

    // called before scrolling begins if touches have already been delivered to a subview of the scroll view. if it returns NO the touches will continue to be delivered to the subview and scrolling will not occur
    // not called if canCancelContentTouches is NO. default returns YES if view isn't a UIControl
    // this has no effect on presses
    open func touchesShouldCancel(in view: UIView) -> Bool

    
    /*
     the following properties and methods are for zooming. as the user tracks with two fingers, we adjust the offset and the scale of the content. When the gesture ends, you should update the content
     as necessary. Note that the gesture can end and a finger could still be down. While the gesture is in progress, we do not send any tracking calls to the subview.
     the delegate must implement both viewForZoomingInScrollView: and scrollViewDidEndZooming:withView:atScale: in order for zooming to work and the max\/min zoom scale must be different
     note that we are not scaling the actual scroll view but the 'content view' returned by the delegate. the delegate must return a subview, not the scroll view itself, from viewForZoomingInScrollview:
     */
    
    open var minimumZoomScale: CGFloat // default is 1.0

    open var maximumZoomScale: CGFloat // default is 1.0. must be > minimum zoom scale to enable zooming

    
    @available(iOS 3.0, *)
    open var zoomScale: CGFloat // default is 1.0

    @available(iOS 3.0, *)
    open func setZoomScale(_ scale: CGFloat, animated: Bool)

    @available(iOS 3.0, *)
    open func zoom(to rect: CGRect, animated: Bool)

    
    open var bouncesZoom: Bool // default is YES. if set, user can go past min\/max zoom while gesturing and the zoom will animate to the min\/max value at gesture end

    
    open var isZooming: Bool { get } // returns YES if user in zoom gesture

    open var isZoomBouncing: Bool { get } // returns YES if we are in the middle of zooming back to the min\/max value

    
    // When the user taps the status bar, the scroll view beneath the touch which is closest to the status bar will be scrolled to top, but only if its `scrollsToTop` property is YES, its delegate does not return NO from `-scrollViewShouldScrollToTop:`, and it is not already at the top.
    // On iPhone, we execute this gesture only if there's one on-screen scroll view with `scrollsToTop` == YES. If more than one is found, none will be scrolled.
    open var scrollsToTop: Bool // default is YES.

    
    // Use these accessors to configure the scroll view's built-in gesture recognizers.
    // Do not change the gestures' delegates or override the getters for these properties.
    
    // Change `panGestureRecognizer.allowedTouchTypes` to limit scrolling to a particular set of touch types.
    @available(iOS 5.0, *)
    open var panGestureRecognizer: UIPanGestureRecognizer { get }

    // `pinchGestureRecognizer` will return nil when zooming is disabled.
    @available(iOS 5.0, *)
    open var pinchGestureRecognizer: UIPinchGestureRecognizer? { get }

    // `directionalPressGestureRecognizer` is disabled by default, but can be enabled to perform scrolling in response to up \/ down \/ left \/ right arrow button presses directly, instead of scrolling indirectly in response to focus updates.
    open var directionalPressGestureRecognizer: UIGestureRecognizer { get }

    
    @available(iOS 7.0, *)
    open var keyboardDismissMode: UIScrollView.KeyboardDismissMode // default is UIScrollViewKeyboardDismissModeNone

    
    @available(iOS 10.0, *)
    open var refreshControl: UIRefreshControl?
}

public protocol UIScrollViewDelegate : NSObjectProtocol {

    
    @available(iOS 2.0, *)
    optional func scrollViewDidScroll(_ scrollView: UIScrollView) // any offset changes

    @available(iOS 3.2, *)
    optional func scrollViewDidZoom(_ scrollView: UIScrollView) // any zoom scale changes

    
    // called on start of dragging (may require some time and or distance to move)
    @available(iOS 2.0, *)
    optional func scrollViewWillBeginDragging(_ scrollView: UIScrollView)

    // called on finger up if the user dragged. velocity is in points\/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
    @available(iOS 5.0, *)
    optional func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)

    // called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
    @available(iOS 2.0, *)
    optional func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool)

    
    @available(iOS 2.0, *)
    optional func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) // called on finger up as we are moving

    @available(iOS 2.0, *)
    optional func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) // called when scroll view grinds to a halt

    
    @available(iOS 2.0, *)
    optional func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) // called when setContentOffset\/scrollRectVisible:animated: finishes. not called if not animating

    
    @available(iOS 2.0, *)
    optional func viewForZooming(in scrollView: UIScrollView) -> UIView? // return a view that will be scaled. if delegate returns nil, nothing happens

    @available(iOS 3.2, *)
    optional func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) // called before the scroll view begins zooming its content

    @available(iOS 2.0, *)
    optional func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) // scale between minimum and maximum. called after any 'bounce' animations

    
    @available(iOS 2.0, *)
    optional func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool // return a yes if you want to scroll to the top. if not defined, assumes YES

    @available(iOS 2.0, *)
    optional func scrollViewDidScrollToTop(_ scrollView: UIScrollView) // called when scrolling animation finished. may be called immediately if already at top

    
    /* Also see -[UIScrollView adjustedContentInsetDidChange]
     */
    @available(iOS 11.0, *)
    optional func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView)
}
,
extension UIScrollView: Chainable {}
