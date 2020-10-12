import Foundation

//
//  UITextView.h
//  UIKit
//
//  Copyright (c) 2007-2018 Apple Inc. All rights reserved.
//

public protocol UITextViewDelegate : UIScrollViewDelegate {

    
    @available(iOS 2.0, *)
    optional func textViewShouldBeginEditing(_ textView: UITextView) -> Bool

    @available(iOS 2.0, *)
    optional func textViewShouldEndEditing(_ textView: UITextView) -> Bool

    
    @available(iOS 2.0, *)
    optional func textViewDidBeginEditing(_ textView: UITextView)

    @available(iOS 2.0, *)
    optional func textViewDidEndEditing(_ textView: UITextView)

    
    @available(iOS 2.0, *)
    optional func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool

    @available(iOS 2.0, *)
    optional func textViewDidChange(_ textView: UITextView)

    
    @available(iOS 2.0, *)
    optional func textViewDidChangeSelection(_ textView: UITextView)

    
    @available(iOS 10.0, *)
    optional func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool

    @available(iOS 10.0, *)
    optional func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool

    
    @available(iOS, introduced: 7.0, deprecated: 10.0)
    optional func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool

    @available(iOS, introduced: 7.0, deprecated: 10.0)
    optional func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange) -> Bool
}

@available(iOS 2.0, *)
open class UITextView : UIScrollView, UITextInput, UIContentSizeCategoryAdjusting {

    
    weak open var delegate: UITextViewDelegate?

    
    open var text: String!

    open var font: UIFont?

    open var textColor: UIColor?

    open var textAlignment: NSTextAlignment // default is NSLeftTextAlignment

    open var selectedRange: NSRange

    open var isEditable: Bool

    @available(iOS 7.0, *)
    open var isSelectable: Bool // toggle selectability, which controls the ability of the user to select content and interact with URLs & attachments. On tvOS this also makes the text view focusable.

    @available(iOS 3.0, *)
    open var dataDetectorTypes: UIDataDetectorTypes

    
    @available(iOS 6.0, *)
    open var allowsEditingTextAttributes: Bool // defaults to NO

    @available(iOS 6.0, *)
    @NSCopying open var attributedText: NSAttributedString!

    @available(iOS 6.0, *)
    open var typingAttributes: [NSAttributedString.Key : Any] // automatically resets when the selection changes

    
    open func scrollRangeToVisible(_ range: NSRange)

    
    // Presented when object becomes first responder.  If set to nil, reverts to following responder chain.  If
    // set while first responder, will not take effect until reloadInputViews is called.
    open var inputView: UIView?

    open var inputAccessoryView: UIView?

    
    @available(iOS 6.0, *)
    open var clearsOnInsertion: Bool // defaults to NO. if YES, the selection UI is hidden, and inserting text will replace the contents of the field. changing the selection will automatically set this to NO.

    
    // Create a new text view with the specified text container (can be nil) - this is the new designated initializer for this class
    @available(iOS 7.0, *)
    public init(frame: CGRect, textContainer: NSTextContainer?)

    public init?(coder: NSCoder)

    
    // Get the text container for the text view
    @available(iOS 7.0, *)
    open var textContainer: NSTextContainer { get }

    // Inset the text container's layout area within the text view's content area
    @available(iOS 7.0, *)
    open var textContainerInset: UIEdgeInsets

    
    // Convenience accessors (access through the text container)
    @available(iOS 7.0, *)
    open var layoutManager: NSLayoutManager { get }

    @available(iOS 7.0, *)
    open var textStorage: NSTextStorage { get }

    
    // Style for links
    @available(iOS 7.0, *)
    open var linkTextAttributes: [NSAttributedString.Key : Any]!

    
    // When turned on, this changes the rendering scale of the text to match the standard text scaling and preserves the original font point sizes when the contents of the text view are copied to the pasteboard.  Apps that show a lot of text content, such as a text viewer or editor, should turn this on and use the standard text scaling.
    @available(iOS 13.0, *)
    open var usesStandardTextScaling: Bool
}

extension UITextView : UITextDraggable, UITextDroppable, UITextPasteConfigurationSupporting {
}
extension UITextView {

    
    public class let textDidBeginEditingNotification: NSNotification.Name

    public class let textDidChangeNotification: NSNotification.Name

    public class let textDidEndEditingNotification: NSNotification.Name
}
,
extension UITextView: Chainable {}
