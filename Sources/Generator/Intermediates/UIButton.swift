import Foundation

extension UIButton {

    
    public enum ButtonType : Int {

        
        case custom = 0

        @available(iOS 7.0, *)
        case system = 1

        
        case detailDisclosure = 2

        case infoLight = 3

        case infoDark = 4

        case contactAdd = 5

        
        @available(iOS 13.0, *)
        case close = 7

        
        public static var roundedRect: UIButton.ButtonType { get }
    }

    
    @available(iOS 14.0, *)
    public enum Role : Int {

        
        case normal = 0

        case primary = 1

        case cancel = 2

        case destructive = 3
    }
}

@available(iOS 13.4, *)
public typealias UIButtonPointerStyleProvider = (UIButton, __UIPointerEffect, __UIPointerShape) -> UIPointerStyle?

@available(iOS 2.0, *)
open class UIButton : UIControl, NSCoding {

    
    public init(frame: CGRect)

    public init?(coder: NSCoder)

    
    //\/ Initializes a custom button, registers primaryAction for the UIControlEventPrimaryActionTriggered control event, and uses primaryAction's title & image as the button's title & image.
    @available(iOS 14.0, *)
    public convenience init(frame: CGRect, primaryAction: UIAction?)

    
    public convenience init(type buttonType: UIButton.ButtonType)

    @available(iOS 13.0, *)
    open class func systemButton(with image: UIImage, target: Any?, action: Selector?) -> Self

    
    open var contentEdgeInsets: UIEdgeInsets // default is UIEdgeInsetsZero. On tvOS 10 or later, default is nonzero except for custom buttons.

    open var titleEdgeInsets: UIEdgeInsets // default is UIEdgeInsetsZero

    open var reversesTitleShadowWhenHighlighted: Bool // default is NO. if YES, shadow reverses to shift between engrave and emboss appearance

    open var imageEdgeInsets: UIEdgeInsets // default is UIEdgeInsetsZero

    open var adjustsImageWhenHighlighted: Bool // default is YES. if YES, image is drawn darker when highlighted(pressed)

    open var adjustsImageWhenDisabled: Bool // default is YES. if YES, image is drawn lighter when disabled

    open var showsTouchWhenHighlighted: Bool // default is NO. if YES, show a simple feedback (currently a glow) while highlighted

    @available(iOS 5.0, *)
    open var tintColor: UIColor! // The tintColor is inherited through the superview hierarchy. See UIView for more information.

    open var buttonType: UIButton.ButtonType { get }

    
    @available(iOS 14.0, *)
    open var role: UIButton.Role // default is UIButtonRoleNormal. 

    
    //\/ Enables this button's built-in pointer interaction.
    @available(iOS 13.4, *)
    open var isPointerInteractionEnabled: Bool

    
    //\/ An optional menu for the button to display. The button will automatically enable or disable its contextMenuInteraction when a non-nil or nil menu is set. Defaults to nil.
    @available(iOS 14.0, *)
    @NSCopying open var menu: UIMenu?

    
    // you can set the image, title color, title shadow color, and background image to use for each state. you can specify data
    // for a combined state by using the flags added together. in general, you should specify a value for the normal state to be used
    // by other states which don't have a custom value set
    
    open func setTitle(_ title: String?, for state: UIControl.State) // default is nil. title is assumed to be single line

    open func setTitleColor(_ color: UIColor?, for state: UIControl.State) // default is nil. use opaque white

    open func setTitleShadowColor(_ color: UIColor?, for state: UIControl.State) // default is nil. use 50% black

    open func setImage(_ image: UIImage?, for state: UIControl.State) // default is nil. should be same size if different for different states

    open func setBackgroundImage(_ image: UIImage?, for state: UIControl.State) // default is nil

    @available(iOS 13.0, *)
    open func setPreferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?, forImageIn state: UIControl.State)

    @available(iOS 6.0, *)
    open func setAttributedTitle(_ title: NSAttributedString?, for state: UIControl.State) // default is nil. title is assumed to be single line

    
    open func title(for state: UIControl.State) -> String? // these getters only take a single state value

    open func titleColor(for state: UIControl.State) -> UIColor?

    open func titleShadowColor(for state: UIControl.State) -> UIColor?

    open func image(for state: UIControl.State) -> UIImage?

    open func backgroundImage(for state: UIControl.State) -> UIImage?

    @available(iOS 13.0, *)
    open func preferredSymbolConfigurationForImage(in state: UIControl.State) -> UIImage.SymbolConfiguration?

    @available(iOS 6.0, *)
    open func attributedTitle(for state: UIControl.State) -> NSAttributedString?

    
    // these are the values that will be used for the current state. you can also use these for overrides. a heuristic will be used to
    // determine what image to choose based on the explicit states set. For example, the 'normal' state value will be used for all states
    // that don't have their own image defined.
    
    open var currentTitle: String? { get } // normal\/highlighted\/selected\/disabled. can return nil

    open var currentTitleColor: UIColor { get } // normal\/highlighted\/selected\/disabled. always returns non-nil. default is white(1,1)

    open var currentTitleShadowColor: UIColor? { get } // normal\/highlighted\/selected\/disabled.

    open var currentImage: UIImage? { get } // normal\/highlighted\/selected\/disabled. can return nil

    open var currentBackgroundImage: UIImage? { get } // normal\/highlighted\/selected\/disabled. can return nil

    @available(iOS 13.0, *)
    open var currentPreferredSymbolConfiguration: UIImage.SymbolConfiguration? { get } // normal\/highlighted\/selected\/disabled. can return nil

    @available(iOS 6.0, *)
    open var currentAttributedTitle: NSAttributedString? { get } // normal\/highlighted\/selected\/disabled. can return nil

    
    // return title and image views. will always create them if necessary. always returns nil for system buttons
    @available(iOS 3.0, *)
    open var titleLabel: UILabel? { get }

    @available(iOS 3.0, *)
    open var imageView: UIImageView? { get }

    
    // these return the rectangle for the background (assumes bounds), the content (image + title) and for the image and title separately. the content rect is calculated based
    // on the title and image size and padding and then adjusted based on the control content alignment. there are no draw methods since the contents
    // are rendered in separate subviews (UIImageView, UILabel)
    
    open func backgroundRect(forBounds bounds: CGRect) -> CGRect

    open func contentRect(forBounds bounds: CGRect) -> CGRect

    open func titleRect(forContentRect contentRect: CGRect) -> CGRect

    open func imageRect(forContentRect contentRect: CGRect) -> CGRect
}

extension UIButton {

    @available(iOS 14.0, *)
    public convenience init(type buttonType: UIButton.ButtonType = .system, primaryAction: UIAction?)
}

@available(iOS 13.4, *)
extension UIButton {

    public typealias PointerStyleProvider = (UIButton, UIPointerEffect, UIPointerShape) -> UIPointerStyle?

    public var pointerStyleProvider: UIButton.PointerStyleProvider?
}

extension UIButton : UISpringLoadedInteractionSupporting {
}
,
extension UIButton: Chainable {}
