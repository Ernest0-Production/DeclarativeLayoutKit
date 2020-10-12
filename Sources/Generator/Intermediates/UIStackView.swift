import Foundation

extension UIStackView {

    
    @available(iOS 9.0, *)
    public enum Distribution : Int {

        
        case fill = 0

        
        case fillEqually = 1

        
        case fillProportionally = 2

        
        case equalSpacing = 3

        
        case equalCentering = 4
    }

    
    /* Alignment—the layout transverse to the stacking axis.
     */
    @available(iOS 9.0, *)
    public enum Alignment : Int {

        
        /* Align the leading and trailing edges of vertically stacked items
         or the top and bottom edges of horizontally stacked items tightly to the container.
         */
        case fill = 0

        
        /* Align the leading edges of vertically stacked items
         or the top edges of horizontally stacked items tightly to the relevant edge
         of the container
         */
        case leading = 1

        public static var top: UIStackView.Alignment { get }

        case firstBaseline = 2 // Valid for horizontal axis only

        
        /* Center the items in a vertical stack horizontally
         or the items in a horizontal stack vertically
         */
        case center = 3

        
        /* Align the trailing edges of vertically stacked items
         or the bottom edges of horizontally stacked items tightly to the relevant
         edge of the container
         */
        case trailing = 4

        public static var bottom: UIStackView.Alignment { get }

        case lastBaseline = 5 // Valid for horizontal axis only
    }

    
    /* Used when setting custom spacing after an arranged subview to indicate reverting to 
     the value specified by the spacing property. 
     
     See -setCustomSpacing:afterView:, -customSpacingAfterView:
     */
    @available(iOS 11.0, *)
    public class let spacingUseDefault: CGFloat

    
    /* Used when setting custom spacing after an arranged subview to request the system 
     spacing to the neighboring view. 
     
     Also used as a token for the spacing property to request system spacing between
     arranged subviews.
     
     See spacing, -setCustomSpacing:afterView:, -customSpacingAfterView:
     */
    @available(iOS 11.0, *)
    public class let spacingUseSystem: CGFloat
}

/* UIStackView is a non-rendering subclass of UIView, intended for managing layout of its subviews.
 You may not override +[UIStackView layerClass], and -drawLayer:inContext: will not be sent to
 UIStackView.

 UIStackView arranges its subviews in its arrangedSubviews list in the order of 
 that list along a vertical or horizontal axis, with exact arrangement determined
 by the distribution, alignment, and spacing properties.
 
 The layout will update automatically when arrangedSubviews list changes
 due to adding, removing, or inserting arrangedSubviews, and also when
 views in the arrangedSubviews list change their hidden property.
 
 A horizontal UIStackView will return its tallest view for -viewForFirst\/LastBaselineLayout,
 or if that is another stack view, then the relevant viewForFirst\/LastBaselineLayout from that
 stack view.
 
 A vertical UIStackView will return its first view for -viewForFirstBaselineLayout and its
 last view for -viewForLastBaselineLayout, or if that is another stack view, then the relevant  
 viewForFirst\/LastBaselineLayout from that stack view.
 */

@available(iOS 9.0, *)
open class UIStackView : UIView {

    
    public init(frame: CGRect)

    public init(coder: NSCoder)

    
    /* UIStackView enforces that all views in the arrangedSubviews list
     must be subviews of the UIStackView.
        Thus, when a view is added to the arrangedSubviews, UIStackView
     adds it as a subview if it isn't already. And when a view in a
     UIStackView's arrangedSubviews list receives -removeFromSuperview
     it is also removed from the arrangedSubviews.
     
     Please note that this is a convenience initializer and cannot be overridden in Swift.
     */
    public convenience init(arrangedSubviews views: [UIView]) // Adds views as subviews of the receiver.

    open var arrangedSubviews: [UIView] { get }

    
    /* Add a view to the end of the arrangedSubviews list.
     Maintains the rule that the arrangedSubviews list is a subset of the
     subviews list by adding the view as a subview of the receiver if
     necessary.
        Does not affect the subview ordering if view is already a subview 
     of the receiver.
     */
    open func addArrangedSubview(_ view: UIView)

    
    /* Removes a subview from the list of arranged subviews without removing it as
     a subview of the receiver.
        To remove the view as a subview, send it -removeFromSuperview as usual;
     the relevant UIStackView will remove it from its arrangedSubviews list
     automatically.
     */
    open func removeArrangedSubview(_ view: UIView)

    /*
     Adds the view as a subview of the container if it isn't already.
        Updates the stack index (but not the subview index) of the
     arranged subview if it's already in the arrangedSubviews list.
     */
    open func insertArrangedSubview(_ view: UIView, at stackIndex: Int)

    
    /* A stack with a horizontal axis is a row of arrangedSubviews,
    and a stack with a vertical axis is a column of arrangedSubviews.
     */
    open var axis: NSLayoutConstraint.Axis

    
    /* The layout of the arrangedSubviews along the axis
     */
    open var distribution: UIStackView.Distribution

    
    /* The layout of the arrangedSubviews transverse to the axis;
     e.g., leading\/trailing edges in a vertical stack
     */
    open var alignment: UIStackView.Alignment

    
    /* Spacing between adjacent edges of arrangedSubviews.
     Used as a strict spacing for the Fill distributions, and
     as a minimum spacing for the EqualCentering and EqualSpacing
     distributions. Use negative values to allow overlap.
     
     On iOS 11.0 or later, use UIStackViewSpacingUseSystem (Swift: UIStackView.spacingUseSystem) 
     to get a system standard spacing value. Setting spacing to UIStackViewSpacingUseDefault 
     (Swift: UIStackView.spacingUseDefault) will result in a spacing of 0.
     
     System spacing between views depends on the views involved, and may vary across the 
     stack view.
     
     In vertical stack views with baselineRelativeArrangement == YES, the spacing between 
     text-containing views (such as UILabels) will depend on the fonts involved.
     */
    open var spacing: CGFloat

    
    /* Set and get custom spacing after a view. 
     
     This custom spacing takes precedence over any other value that might otherwise be used 
     for the space following the arranged subview.
     
     Defaults to UIStackViewSpacingUseDefault (Swift: UIStackView.spacingUseDefault), where 
     resolved value will match the spacing property.
     
     You may also set the custom spacing to UIStackViewSpacingUseSystem (Swift: UIStackView.spacingUseSystem),
     where the resolved value will match the system-defined value for the space to the neighboring view, 
     independent of the spacing property.
     
     Maintained when the arranged subview changes position in the stack view, but not after it
     is removed from the arrangedSubviews list.
     
     Ignored if arrangedSubview is not actually an arranged subview.
     */
    @available(iOS 11.0, *)
    open func setCustomSpacing(_ spacing: CGFloat, after arrangedSubview: UIView)

    @available(iOS 11.0, *)
    open func customSpacing(after arrangedSubview: UIView) -> CGFloat

    
    /* Baseline-to-baseline spacing in vertical stacks.
        The baselineRelativeArrangement property supports specifications of vertical 
     space from the last baseline of one text-based view to the first baseline of a
     text-based view below, or from the  top (or bottom) of a container to the first
     (or last) baseline of a contained text-based view.
        This property is ignored in horizontal stacks. Use the alignment property
     to specify baseline alignment in horizontal stacks.
        Defaults to NO.
     */
    open var isBaselineRelativeArrangement: Bool

    
    /* Uses margin layout attributes for edge constraints where applicable.
        Defaults to NO.
     */
    open var isLayoutMarginsRelativeArrangement: Bool
}
,
extension UIStackView: Chainable {}
