import Foundation

extension UIControl {

    
    public struct Event : OptionSet {

        public init(rawValue: UInt)

        
        public static var touchDown: UIControl.Event { get }

        public static var touchDownRepeat: UIControl.Event { get }

        public static var touchDragInside: UIControl.Event { get }

        public static var touchDragOutside: UIControl.Event { get }

        public static var touchDragEnter: UIControl.Event { get }

        public static var touchDragExit: UIControl.Event { get }

        public static var touchUpInside: UIControl.Event { get }

        public static var touchUpOutside: UIControl.Event { get }

        public static var touchCancel: UIControl.Event { get }

        
        public static var valueChanged: UIControl.Event { get }

        @available(iOS 9.0, *)
        public static var primaryActionTriggered: UIControl.Event { get }

        @available(iOS 14.0, *)
        public static var menuActionTriggered: UIControl.Event { get }

        
        public static var editingDidBegin: UIControl.Event { get }

        public static var editingChanged: UIControl.Event { get }

        public static var editingDidEnd: UIControl.Event { get }

        public static var editingDidEndOnExit: UIControl.Event { get }

        
        public static var allTouchEvents: UIControl.Event { get }

        public static var allEditingEvents: UIControl.Event { get }

        public static var applicationReserved: UIControl.Event { get }

        public static var systemReserved: UIControl.Event { get }

        public static var allEvents: UIControl.Event { get }
    }

    
    public enum ContentVerticalAlignment : Int {

        
        case center = 0

        case top = 1

        case bottom = 2

        case fill = 3
    }

    
    public enum ContentHorizontalAlignment : Int {

        
        case center = 0

        case left = 1

        case right = 2

        case fill = 3

        @available(iOS 11.0, *)
        case leading = 4

        @available(iOS 11.0, *)
        case trailing = 5
    }

    
    public struct State : OptionSet {

        public init(rawValue: UInt)

        
        public static var normal: UIControl.State { get }

        public static var highlighted: UIControl.State { get } // used when UIControl isHighlighted is set

        public static var disabled: UIControl.State { get }

        public static var selected: UIControl.State { get } // flag usable by app (see below)

        @available(iOS 9.0, *)
        public static var focused: UIControl.State { get } // Applicable only when the screen supports focus

        public static var application: UIControl.State { get } // additional flags available for application use

        public static var reserved: UIControl.State { get } // flags reserved for internal framework use
    }
}

//______________________________________________________

@available(iOS 2.0, *)
open class UIControl : UIView {

    
    public init(frame: CGRect)

    public init?(coder: NSCoder)

    
    //\/ Initializes the control and adds primaryAction for the UIControlEventPrimaryActionTriggered control event. Subclasses of UIControl may alter or add behaviors around the usage of primaryAction, see subclass documentation of this initializer for additional information.
    @available(iOS 14.0, *)
    public convenience init(frame: CGRect, primaryAction: UIAction?)

    
    open var isEnabled: Bool // default is YES. if NO, ignores touch events and subclasses may draw differently

    open var isSelected: Bool // default is NO may be used by some subclasses or by application

    open var isHighlighted: Bool // default is NO. this gets set\/cleared automatically when touch enters\/exits during tracking and cleared on up

    open var contentVerticalAlignment: UIControl.ContentVerticalAlignment // how to position content vertically inside control. default is center

    open var contentHorizontalAlignment: UIControl.ContentHorizontalAlignment // how to position content horizontally inside control. default is center

    open var effectiveContentHorizontalAlignment: UIControl.ContentHorizontalAlignment { get } // how to position content horizontally inside control, guaranteed to return 'left' or 'right' for any 'leading' or 'trailing'

    
    open var state: UIControl.State { get } // could be more than one state (e.g. disabled|selected). synthesized from other flags.

    open var isTracking: Bool { get }

    open var isTouchInside: Bool { get } // valid during tracking only

    
    open func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool

    open func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool

    open func endTracking(_ touch: UITouch?, with event: UIEvent?) // touch is sometimes nil if cancelTracking calls through to this.

    open func cancelTracking(with event: UIEvent?) // event may be nil if cancelled for non-event reasons, e.g. removed from window

    
    // add target\/action for particular event. you can call this multiple times and you can specify multiple target\/actions for a particular event.
    // passing in nil as the target goes up the responder chain. The action may optionally include the sender and the event in that order
    // the action cannot be NULL. Note that the target is not retained.
    open func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event)

    
    // remove the target\/action for a set of events. pass in NULL for the action to remove all actions for that target
    open func removeTarget(_ target: Any?, action: Selector?, for controlEvents: UIControl.Event)

    
    //\/ Adds the UIAction to a given event. UIActions are uniqued based on their identifier, and subsequent actions with the same identifier replace previously added actions. You may add multiple UIActions for corresponding controlEvents, and you may add the same action to multiple controlEvents.
    @available(iOS 14.0, *)
    open func addAction(_ action: UIAction, for controlEvents: UIControl.Event)

    //\/ Removes the action from the set of passed control events.
    @available(iOS 14.0, *)
    open func removeAction(_ action: UIAction, for controlEvents: UIControl.Event)

    //\/ Removes the action with the provided identifier from the set of passed control events.
    @available(iOS 14.0, *)
    open func removeAction(identifiedBy actionIdentifier: UIAction.Identifier, for controlEvents: UIControl.Event)

    
    // get info about target & actions. this makes it possible to enumerate all target\/actions by checking for each event kind
    open var allTargets: Set<AnyHashable> { get } // set may include NSNull to indicate at least one nil target

    open var allControlEvents: UIControl.Event { get } // list of all events that have at least one action

    
    open func actions(forTarget target: Any?, forControlEvent controlEvent: UIControl.Event) -> [String]? // single event. returns NSArray of NSString selector names. returns nil if none

    
    //\/ Dispatch the target-action pair. This method is called repeatedly by -sendActionsForControlEvents: and is a point at which you can observe or override behavior.
    open func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?)

    //\/ Like -sendAction:to:forEvent:, this method is called by -sendActionsForControlEvents:. You may override this method to observe or modify behavior. If you override this method, you should call super precisely once to dispatch the action, or not call super to suppress sending that action.
    @available(iOS 14.0, *)
    open func sendAction(_ action: UIAction)

    //\/ send all actions associated with the given control events
    open func sendActions(for controlEvents: UIControl.Event)

    
    //\/ Returns a UIContextMenuInteraction with this control set as its delegate. Before constructing the UIContextMenuInteraction, UIControl verifies 'self' is a viable delegate. See 'Implementing UIControl Menus' below for more details.
    @available(iOS 14.0, *)
    open var contextMenuInteraction: UIContextMenuInteraction? { get }

    //\/ Specifies if the context menu interaction is enabled. NO by default.
    @available(iOS 14.0, *)
    open var isContextMenuInteractionEnabled: Bool

    //\/ If the contextMenuInteraction is the primary action of the control, invoked on touch-down. NO by default.
    @available(iOS 14.0, *)
    open var showsMenuAsPrimaryAction: Bool

    
    //\/ Return a point in this control's coordinate space to which to attach the given configuration's menu.
    @available(iOS 14.0, *)
    open func menuAttachmentPoint(for configuration: UIContextMenuConfiguration) -> CGPoint
}

extension UIControl {

    @available(iOS 14.0, *)
    public func enumerateEventHandlers(_ iterator: (UIAction?, (Any?, Selector)?, UIControl.Event, inout Bool) -> Void)
}

//\/ Implementing UIControl Menus
//\/ UIControl will only create a UIContextMenuInteraction if you've created a subclass of UIControl with a minimum viable delegate implementation. UIControl extends the contract of UIContextMenuInteractionDelegate for these methods, see each method for more detail.
extension UIControl : UIContextMenuInteractionDelegate {

    
    //\/ An override is required for UIControl to create a UIContextMenuInteraction. Direct UIControl subclasses do not need to call super.
    @available(iOS 14.0, *)
    open func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration?

    
    //\/ Direct UIControl subclasses do not need to call super.
    @available(iOS 14.0, *)
    open func contextMenuInteraction(_ interaction: UIContextMenuInteraction, previewForHighlightingMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview?

    
    //\/ Direct UIControl subclasses do not need to call super.
    @available(iOS 14.0, *)
    open func contextMenuInteraction(_ interaction: UIContextMenuInteraction, previewForDismissingMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview?

    
    //\/ UIControl subclasses should always call super.
    @available(iOS 14.0, *)
    open func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willDisplayMenuFor configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?)

    
    //\/ UIControl subclasses should always call super.
    @available(iOS 14.0, *)
    open func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willEndFor configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?)
}
,
extension UIControl: Chainable {}
