import Foundation

extension UISwitch {

    
    @available(iOS 14.0, *)
    public enum Style : Int {

        
        case automatic = 0

        case checkbox = 1

        case sliding = 2
    }
}

@available(iOS 2.0, *)
open class UISwitch : UIControl, NSCoding {

    
    @available(iOS 5.0, *)
    open var onTintColor: UIColor?

    @available(iOS 6.0, *)
    open var thumbTintColor: UIColor?

    
    @available(iOS 6.0, *)
    open var onImage: UIImage?

    @available(iOS 6.0, *)
    open var offImage: UIImage?

    
    //\/ The title displayed alongside the switch, positioned appropriately for the @c UIUserInterfaceIdiom.
    //\/ @note This property is only supported for Catalyst in the Mac idiom.
    @available(iOS 14.0, *)
    open var title: String?

    
    //\/ The switch's display style. This property always returns a concrete, resolved style (never UISwitchStyleAutomatic).
    @available(iOS 14.0, *)
    open var style: UISwitch.Style { get }

    
    //\/ Request a style for the switch. If the style changed, then the switch may resize.
    @available(iOS 14.0, *)
    open var preferredStyle: UISwitch.Style

    
    open var isOn: Bool

    
    public init(frame: CGRect) // This class enforces a size appropriate for the control, and so the frame size is ignored.

    
    public init?(coder: NSCoder)

    
    open func setOn(_ on: Bool, animated: Bool) // does not send action
}
,
extension UISwitch: Chainable {}
