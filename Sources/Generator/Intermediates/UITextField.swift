import Foundation


@available(iOS 2.0, *)
open class UITextField : UIControl, UITextInput, NSCoding, UIContentSizeCategoryAdjusting {

    
    open var text: String? // default is nil

    @available(iOS 6.0, *)
    @NSCopying open var attributedText: NSAttributedString? // default is nil

    open var textColor: UIColor? // default is nil. use opaque black

    open var font: UIFont? // default is nil. use system font 12 pt

    open var textAlignment: NSTextAlignment // default is NSLeftTextAlignment

    open var borderStyle: UITextField.BorderStyle // default is UITextBorderStyleNone. If set to UITextBorderStyleRoundedRect, custom background images are ignored.

    @available(iOS 7.0, *)
    open var defaultTextAttributes: [NSAttributedString.Key : Any] // applies attributes to the full range of text. Unset attributes act like default values.

    
    open var placeholder: String? // default is nil. string is drawn 70% gray

    @available(iOS 6.0, *)
    @NSCopying open var attributedPlaceholder: NSAttributedString? // default is nil

    open var clearsOnBeginEditing: Bool // default is NO which moves cursor to location clicked. if YES, all text cleared

    open var adjustsFontSizeToFitWidth: Bool // default is NO. if YES, text will shrink to minFontSize along baseline

    open var minimumFontSize: CGFloat // default is 0.0. actual min may be pinned to something readable. used if adjustsFontSizeToFitWidth is YES

    weak open var delegate: UITextFieldDelegate? // default is nil. weak reference

    open var background: UIImage? // default is nil. draw in border rect. image should be stretchable

    open var disabledBackground: UIImage? // default is nil. ignored if background not set. image should be stretchable

    
    open var isEditing: Bool { get }

    @available(iOS 6.0, *)
    open var allowsEditingTextAttributes: Bool // default is NO. allows editing text attributes with style operations and pasting rich text

    @available(iOS 6.0, *)
    open var typingAttributes: [NSAttributedString.Key : Any]? // automatically resets when the selection changes

    
    // You can supply custom views which are displayed at the left or right
    // sides of the text field. Uses for such views could be to show an icon or
    // a button to operate on the text in the field in an application-defined
    // manner.
    // 
    // A very common use is to display a clear button on the right side of the
    // text field, and a standard clear button is provided.
    
    open var clearButtonMode: UITextField.ViewMode // sets when the clear button shows up. default is UITextFieldViewModeNever

    
    open var leftView: UIView? // e.g. magnifying glass

    open var leftViewMode: UITextField.ViewMode // sets when the left view shows up. default is UITextFieldViewModeNever

    
    open var rightView: UIView? // e.g. bookmarks button

    open var rightViewMode: UITextField.ViewMode // sets when the right view shows up. default is UITextFieldViewModeNever

    
    // drawing and positioning overrides
    
    open func borderRect(forBounds bounds: CGRect) -> CGRect

    open func textRect(forBounds bounds: CGRect) -> CGRect

    open func placeholderRect(forBounds bounds: CGRect) -> CGRect

    open func editingRect(forBounds bounds: CGRect) -> CGRect

    open func clearButtonRect(forBounds bounds: CGRect) -> CGRect

    open func leftViewRect(forBounds bounds: CGRect) -> CGRect

    open func rightViewRect(forBounds bounds: CGRect) -> CGRect

    
    open func drawText(in rect: CGRect)

    open func drawPlaceholder(in rect: CGRect)

    
    // Presented when object becomes first responder.  If set to nil, reverts to following responder chain.  If
    // set while first responder, will not take effect until reloadInputViews is called.
    open var inputView: UIView?

    open var inputAccessoryView: UIView?

    
    @available(iOS 6.0, *)
    open var clearsOnInsertion: Bool // defaults to NO. if YES, the selection UI is hidden, and inserting text will replace the contents of the field. changing the selection will automatically set this to NO.
}

extension UITextField : UITextDraggable, UITextDroppable, UITextPasteConfigurationSupporting {
}

extension UIView {

    open func endEditing(_ force: Bool) -> Bool // use to make the view or any subview that is the first responder resign (optionally force)
}

public protocol UITextFieldDelegate : NSObjectProtocol {

    
    @available(iOS 2.0, *)
    optional func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool // return NO to disallow editing.

    @available(iOS 2.0, *)
    optional func textFieldDidBeginEditing(_ textField: UITextField) // became first responder

    @available(iOS 2.0, *)
    optional func textFieldShouldEndEditing(_ textField: UITextField) -> Bool // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end

    @available(iOS 2.0, *)
    optional func textFieldDidEndEditing(_ textField: UITextField) // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

    @available(iOS 10.0, *)
    optional func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) // if implemented, called in place of textFieldDidEndEditing:

    
    @available(iOS 2.0, *)
    optional func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool // return NO to not change text

    
    @available(iOS 13.0, *)
    optional func textFieldDidChangeSelection(_ textField: UITextField)

    
    @available(iOS 2.0, *)
    optional func textFieldShouldClear(_ textField: UITextField) -> Bool // called when clear button pressed. return NO to ignore (no notifications)

    @available(iOS 2.0, *)
    optional func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
}
extension UITextField {

    
    public class let textDidBeginEditingNotification: NSNotification.Name

    public class let textDidEndEditingNotification: NSNotification.Name

    public class let textDidChangeNotification: NSNotification.Name

    
    @available(iOS 10.0, *)
    public class let didEndEditingReasonUserInfoKey: String

    public enum BorderStyle : Int {

        case none = 0

        case line = 1

        case bezel = 2

        case roundedRect = 3
    }

    public enum ViewMode : Int {

        case never = 0

        case whileEditing = 1

        case unlessEditing = 2

        case always = 3
    }

    @available(iOS 10.0, *)
    public enum DidEndEditingReason : Int {

        case committed = 0
    }
}
,
extension UITextField: Chainable {}
