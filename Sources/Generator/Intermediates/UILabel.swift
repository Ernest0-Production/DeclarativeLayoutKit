import Foundation

//
//  UILabel.h
//  UIKit
//
//  Copyright (c) 2006-2018 Apple Inc. All rights reserved.
//

@available(iOS 2.0, *)
open class UILabel : UIView, NSCoding, UIContentSizeCategoryAdjusting {

    
    open var text: String? // default is nil

    open var font: UIFont! // default is nil (system font 17 plain)

    open var textColor: UIColor! // default is labelColor

    open var shadowColor: UIColor? // default is nil (no shadow)

    open var shadowOffset: CGSize // default is CGSizeMake(0, -1) -- a top shadow

    open var textAlignment: NSTextAlignment // default is NSTextAlignmentNatural (before iOS 9, the default was NSTextAlignmentLeft)

    open var lineBreakMode: NSLineBreakMode // default is NSLineBreakByTruncatingTail. used for single and multiple lines of text

    
    // the underlying attributed string drawn by the label, if set, the label ignores the properties above.
    @available(iOS 6.0, *)
    @NSCopying open var attributedText: NSAttributedString? // default is nil

    
    // the 'highlight' property is used by subclasses for such things as pressed states. it's useful to make it part of the base class as a user property
    
    open var highlightedTextColor: UIColor? // default is nil

    open var isHighlighted: Bool // default is NO

    
    open var isUserInteractionEnabled: Bool // default is NO

    open var isEnabled: Bool // default is YES. changes how the label is drawn

    
    // this determines the number of lines to draw and what to do when sizeToFit is called. default value is 1 (single line). A value of 0 means no limit
    // if the height of the text reaches the # of lines or the height of the view is less than the # of lines allowed, the text will be
    // truncated using the line break mode.
    
    open var numberOfLines: Int

    
    // these next 3 properties allow the label to be autosized to fit a certain width by scaling the font size(s) by a scaling factor >= the minimum scaling factor
    // and to specify how the text baseline moves when it needs to shrink the font.
    
    open var adjustsFontSizeToFitWidth: Bool // default is NO

    open var baselineAdjustment: UIBaselineAdjustment // default is UIBaselineAdjustmentAlignBaselines

    @available(iOS 6.0, *)
    open var minimumScaleFactor: CGFloat // default is 0.0

    
    // Tightens inter-character spacing in attempt to fit lines wider than the available space if the line break mode is one of the truncation modes before starting to truncate.
    // The maximum amount of tightening performed is determined by the system based on contexts such as font, line width, etc.
    @available(iOS 9.0, *)
    open var allowsDefaultTighteningForTruncation: Bool // default is NO

    
    // Specifies the line break strategies that may be used for laying out the text in this label.
    // If this property is not set, the default value is NSLineBreakStrategyStandard.
    // If the label contains an attributed text with paragraph style(s) that specify a set of line break strategies, the set of strategies in the paragraph style(s) will be used instead of the set of strategies defined by this property.
    open var lineBreakStrategy: NSParagraphStyle.LineBreakStrategy

    
    // override points. can adjust rect before calling super.
    // label has default content mode of UIViewContentModeRedraw
    
    open func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect

    open func drawText(in rect: CGRect)

    
    // Support for constraint-based layout (auto layout)
    // If nonzero, this is used when determining -intrinsicContentSize for multiline labels
    @available(iOS 6.0, *)
    open var preferredMaxLayoutWidth: CGFloat
}
,
extension UILabel: Chainable {}
