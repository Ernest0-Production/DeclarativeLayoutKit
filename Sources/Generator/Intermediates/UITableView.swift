import Foundation

extension UITableView {

    
    public enum Style : Int {

        
        case plain = 0

        case grouped = 1

        @available(iOS 13.0, *)
        case insetGrouped = 2
    }

    
    public enum ScrollPosition : Int {

        
        case none = 0

        case top = 1

        case middle = 2

        case bottom = 3
    }

    // scroll so row of interest is completely visible at top\/center\/bottom of view
    
    public enum RowAnimation : Int {

        
        case fade = 0

        case right = 1 // slide in from right (or out to right)

        case left = 2

        case top = 3

        case bottom = 4

        case none = 5 // available in iOS 3.0

        case middle = 6 // available in iOS 3.2.  attempts to keep cell centered in the space it will\/did occupy

        case automatic = 100 // available in iOS 5.0.  chooses an appropriate animation style for you
    }

    
    // Including this constant string in the array of strings returned by sectionIndexTitlesForTableView: will cause a magnifying glass icon to be displayed at that location in the index.
    // This should generally only be used as the first title in the index.
    @available(iOS 3.0, *)
    public class let indexSearch: String

    
    // Returning this value from tableView:heightForHeaderInSection: or tableView:heightForFooterInSection: results in a height that fits the value returned from
    // tableView:titleForHeaderInSection: or tableView:titleForFooterInSection: if the title is not nil.
    @available(iOS 5.0, *)
    public class let automaticDimension: CGFloat

    
    // default background color is dependent on style
    
    //_______________________________________________________________________________________________________________
    // this represents the display and behaviour of the cells.
    
    // Display customization
    
    // Variable height support
    
    // Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
    // If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
    
    // Section header & footer information. Views are preferred over title should you decide to provide both
    
    // custom view for header. will be adjusted to default or specified header height
    // custom view for footer. will be adjusted to default or specified footer height
    
    // Accessories (disclosures). 
    
    // Selection
    
    // -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row. 
    // Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
    
    // Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
    
    // Called after the user changes the selection.
    
    // Editing
    
    // Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
    
    // This method supersedes -tableView:titleForDeleteConfirmationButtonForRowAtIndexPath: if return value is non-nil
    
    // Swipe actions
    // These methods supersede -editActionsForRowAtIndexPath: if implemented
    // return nil to get the default swipe actions
    
    // Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
    
    // The willBegin\/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert\/delete\/move). This is done by a swipe activating a single row
    
    // Moving\/reordering
    
    // Allows customization of the target row for a particular row as it is being moved\/reordered
    
    // Indentation
    
    // return 'depth' of row for hierarchies
    
    // Copy\/Paste.  All three methods must be implemented by the delegate.
    
    // Focus
    
    // Spring Loading
    
    // Allows opting-out of spring loading for an particular row.
    // If you want the interaction effect on a different subview of the spring loaded cell, modify the context.targetView property. The default is the cell.
    // If this method is not implemented, the default is YES except when the row is part of a drag session.
    
    // Multiple Selection
    
    /* Allows a two-finger pan gesture to automatically transition the table view into editing mode and start selecting cells.
     *
     * If this method returns YES, allow the user to start selecting multiple contiguous cells via a two-finger pan gesture. If
     * the table view is already in editing mode, the user can also select multiple cells via a one-finger pan gesture along the
     * edge of the table that contains editing controls (checkboxes).
     *
     * In order to support this behavior, you must also set allowsMultipleSelectionDuringEditing to YES.
     *
     * If this method is not implemented, the default is NO.
     */
    
    /* Called right after the multi-select pan gesture begins and the table view is automatically transitioned into editing mode.
     *
     * In your app, this would be a good opportunity to update the state of your UI to reflect the fact that the user is now selecting
     * multiple items at once; such as updating buttons to say \"Done\" instead of \"Select\"\/\"Edit\", for instance.
     */
    
    /* Called when the multi-select interaction ends.
     *
     * At this point, the table view will remain in multi-select mode, but this delegate method is called to indicate that the multiple
     * selection gesture or hardware keyboard interaction has ended.
     */
    
    /*!
     * @abstract Called when the interaction begins.
     *
     * @param tableView  This UITableView.
     * @param indexPath  IndexPath of the row for which a configuration is being requested.
     * @param point      Location of the interaction in the table view's coordinate space
     *
     * @return A UIContextMenuConfiguration describing the menu to be presented. Return nil to prevent the interaction from beginning.
     *         Returning an empty configuration causes the interaction to begin then fail with a cancellation effect. You might use this
     *         to indicate to users that it's possible for a menu to be presented from this element, but that there are no actions to
     *         present at this particular time.
     */
    
    /*!
     * @abstract Called when the interaction begins. Return a UITargetedPreview to override the default preview created by the table view.
     *
     * @param tableView      This UITableView.
     * @param configuration  The configuration of the menu about to be displayed by this interaction.
     */
    
    /*!
     * @abstract Called when the interaction is about to dismiss. Return a UITargetedPreview describing the desired dismissal target.
     * The interaction will animate the presented menu to the target. Use this to customize the dismissal animation.
     *
     * @param tableView      This UITableView.
     * @param configuration  The configuration of the menu displayed by this interaction.
     */
    
    /*!
     * @abstract Called when the interaction is about to \"commit\" in response to the user tapping the preview.
     *
     * @param tableView      This UITableView.
     * @param configuration  Configuration of the currently displayed menu.
     * @param animator       Commit animator. Add animations to this object to run them alongside the commit transition.
     */
    
    /*!
     * @abstract Called when the table view is about to display a menu.
     *
     * @param tableView       This UITableView.
     * @param configuration   The configuration of the menu about to be displayed.
     * @param animator        Appearance animator. Add animations to run them alongside the appearance transition.
     */
    
    /*!
     * @abstract Called when the table view's context menu interaction is about to end.
     *
     * @param tableView       This UITableView.
     * @param configuration   Ending configuration.
     * @param animator        Disappearance animator. Add animations to run them alongside the disappearance transition.
     */
    
    public class let selectionDidChangeNotification: NSNotification.Name

    
    @available(iOS 11.0, *)
    public enum SeparatorInsetReference : Int {

        
        // The value set to the separatorInset property is interpreted as an offset from the edges of the cell.
        case fromCellEdges = 0

        
        // The value set to the separatorInset property is interpreted as an offset from the automatic separator insets.
        case fromAutomaticInsets = 1
    }
}
extension UITableViewRowAction {

    @available(iOS, introduced: 8.0, deprecated: 13.0, message: \"Use UIContextualAction and related APIs instead.\")
    public enum Style : Int {

        case `default` = 0

        public static var destructive: UITableViewRowAction.Style { get }

        case normal = 1
    }
}
@available(iOS, introduced: 8.0, deprecated: 13.0, message: \"Use UIContextualAction and related APIs instead.\")
open class UITableViewRowAction : NSObject, NSCopying {

    public convenience init(style: UITableViewRowAction.Style, title: String?, handler: @escaping (UITableViewRowAction, IndexPath) -> Void)

    open var style: UITableViewRowAction.Style { get }

    open var title: String?

    @NSCopying open var backgroundColor: UIColor?

    @NSCopying open var backgroundEffect: UIVisualEffect?
}
@available(iOS 9.0, *)
open class UITableViewFocusUpdateContext : UIFocusUpdateContext {

    open var previouslyFocusedIndexPath: IndexPath? { get }

    open var nextFocusedIndexPath: IndexPath? { get }
}
public protocol UITableViewDelegate : UIScrollViewDelegate {

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)

    @available(iOS 6.0, *)
    optional func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)

    @available(iOS 6.0, *)
    optional func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int)

    @available(iOS 6.0, *)
    optional func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath)

    @available(iOS 6.0, *)
    optional func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int)

    @available(iOS 6.0, *)
    optional func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int)

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat

    @available(iOS 7.0, *)
    optional func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat

    @available(iOS 7.0, *)
    optional func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat

    @available(iOS 7.0, *)
    optional func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath)

    @available(iOS 6.0, *)
    optional func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool

    @available(iOS 6.0, *)
    optional func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath)

    @available(iOS 6.0, *)
    optional func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath)

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?

    @available(iOS 3.0, *)
    optional func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath?

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)

    @available(iOS 3.0, *)
    optional func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle

    @available(iOS 3.0, *)
    optional func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?

    @available(iOS, introduced: 8.0, deprecated: 13.0)
    optional func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?

    @available(iOS 11.0, *)
    optional func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?

    @available(iOS 11.0, *)
    optional func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath)

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?)

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int

    @available(iOS, introduced: 5.0, deprecated: 13.0)
    optional func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool

    @available(iOS, introduced: 5.0, deprecated: 13.0)
    optional func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool

    @available(iOS, introduced: 5.0, deprecated: 13.0)
    optional func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?)

    @available(iOS 9.0, *)
    optional func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool

    @available(iOS 9.0, *)
    optional func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool

    @available(iOS 9.0, *)
    optional func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator)

    @available(iOS 9.0, *)
    optional func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath?

    @available(iOS 11.0, *)
    optional func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool

    @available(iOS 13.0, *)
    optional func tableView(_ tableView: UITableView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool

    @available(iOS 13.0, *)
    optional func tableView(_ tableView: UITableView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath)

    @available(iOS 13.0, *)
    optional func tableViewDidEndMultipleSelectionInteraction(_ tableView: UITableView)

    /**
     * @abstract Called when the interaction begins.
     *
     * @param tableView  This UITableView.
     * @param indexPath  IndexPath of the row for which a configuration is being requested.
     * @param point      Location of the interaction in the table view's coordinate space
     *
     * @return A UIContextMenuConfiguration describing the menu to be presented. Return nil to prevent the interaction from beginning.
     *         Returning an empty configuration causes the interaction to begin then fail with a cancellation effect. You might use this
     *         to indicate to users that it's possible for a menu to be presented from this element, but that there are no actions to
     *         present at this particular time.
     */
    @available(iOS 13.0, *)
    optional func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration?

    /**
     * @abstract Called when the interaction begins. Return a UITargetedPreview to override the default preview created by the table view.
     *
     * @param tableView      This UITableView.
     * @param configuration  The configuration of the menu about to be displayed by this interaction.
     */
    @available(iOS 13.0, *)
    optional func tableView(_ tableView: UITableView, previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview?

    /**
     * @abstract Called when the interaction is about to dismiss. Return a UITargetedPreview describing the desired dismissal target.
     * The interaction will animate the presented menu to the target. Use this to customize the dismissal animation.
     *
     * @param tableView      This UITableView.
     * @param configuration  The configuration of the menu displayed by this interaction.
     */
    @available(iOS 13.0, *)
    optional func tableView(_ tableView: UITableView, previewForDismissingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview?

    /**
     * @abstract Called when the interaction is about to \"commit\" in response to the user tapping the preview.
     *
     * @param tableView      This UITableView.
     * @param configuration  Configuration of the currently displayed menu.
     * @param animator       Commit animator. Add animations to this object to run them alongside the commit transition.
     */
    @available(iOS 13.0, *)
    optional func tableView(_ tableView: UITableView, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating)

    /**
     * @abstract Called when the table view is about to display a menu.
     *
     * @param tableView       This UITableView.
     * @param configuration   The configuration of the menu about to be displayed.
     * @param animator        Appearance animator. Add animations to run them alongside the appearance transition.
     */
    @available(iOS 14.0, *)
    optional func tableView(_ tableView: UITableView, willDisplayContextMenu configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?)

    /**
     * @abstract Called when the table view's context menu interaction is about to end.
     *
     * @param tableView       This UITableView.
     * @param configuration   Ending configuration.
     * @param animator        Disappearance animator. Add animations to run them alongside the disappearance transition.
     */
    @available(iOS 14.0, *)
    optional func tableView(_ tableView: UITableView, willEndContextMenuInteraction configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?)
}

//_______________________________________________________________________________________________________________

@available(iOS 2.0, *)
open class UITableView : UIScrollView, NSCoding, UIDataSourceTranslating {

    
    public init(frame: CGRect, style: UITableView.Style) // must specify style at creation. -initWithFrame: calls this with UITableViewStylePlain

    public init?(coder: NSCoder)

    
    open var style: UITableView.Style { get }

    
    weak open var dataSource: UITableViewDataSource?

    weak open var delegate: UITableViewDelegate?

    @available(iOS 10.0, *)
    weak open var prefetchDataSource: UITableViewDataSourcePrefetching?

    @available(iOS 11.0, *)
    weak open var dragDelegate: UITableViewDragDelegate?

    @available(iOS 11.0, *)
    weak open var dropDelegate: UITableViewDropDelegate?

    
    open var rowHeight: CGFloat // default is UITableViewAutomaticDimension

    open var sectionHeaderHeight: CGFloat // default is UITableViewAutomaticDimension

    open var sectionFooterHeight: CGFloat // default is UITableViewAutomaticDimension

    @available(iOS 7.0, *)
    open var estimatedRowHeight: CGFloat // default is UITableViewAutomaticDimension, set to 0 to disable

    @available(iOS 7.0, *)
    open var estimatedSectionHeaderHeight: CGFloat // default is UITableViewAutomaticDimension, set to 0 to disable

    @available(iOS 7.0, *)
    open var estimatedSectionFooterHeight: CGFloat // default is UITableViewAutomaticDimension, set to 0 to disable

    
    @available(iOS 7.0, *)
    open var separatorInset: UIEdgeInsets // allows customization of the frame of cell separators; see also the separatorInsetReference property. Use UITableViewAutomaticDimension for the automatic inset for that edge.

    @available(iOS 11.0, *)
    open var separatorInsetReference: UITableView.SeparatorInsetReference // Changes how custom separatorInset values are interpreted. The default value is UITableViewSeparatorInsetFromCellEdges

    
    @available(iOS 3.2, *)
    open var backgroundView: UIView? // the background view will be automatically resized to track the size of the table view.  this will be placed as a subview of the table view behind all cells and headers\/footers.  default may be non-nil for some devices.

    
    // Info
    
    open var numberOfSections: Int { get }

    open func numberOfRows(inSection section: Int) -> Int

    
    open func rect(forSection section: Int) -> CGRect // includes header, footer and all rows

    open func rectForHeader(inSection section: Int) -> CGRect

    open func rectForFooter(inSection section: Int) -> CGRect

    open func rectForRow(at indexPath: IndexPath) -> CGRect

    
    open func indexPathForRow(at point: CGPoint) -> IndexPath? // returns nil if point is outside of any row in the table

    open func indexPath(for cell: UITableViewCell) -> IndexPath? // returns nil if cell is not visible

    open func indexPathsForRows(in rect: CGRect) -> [IndexPath]? // returns nil if rect not valid

    
    open func cellForRow(at indexPath: IndexPath) -> UITableViewCell? // returns nil if cell is not visible or index path is out of range

    open var visibleCells: [UITableViewCell] { get }

    open var indexPathsForVisibleRows: [IndexPath]? { get }

    
    @available(iOS 6.0, *)
    open func headerView(forSection section: Int) -> UITableViewHeaderFooterView?

    @available(iOS 6.0, *)
    open func footerView(forSection section: Int) -> UITableViewHeaderFooterView?

    
    open func scrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool)

    open func scrollToNearestSelectedRow(at scrollPosition: UITableView.ScrollPosition, animated: Bool)

    
    // Reloading and Updating
    
    // Allows multiple insert\/delete\/reload\/move calls to be animated simultaneously. Nestable.
    @available(iOS 11.0, *)
    open func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil)

    
    // Use -performBatchUpdates:completion: instead of these methods, which will be deprecated in a future release.
    open func beginUpdates()

    open func endUpdates()

    
    open func insertSections(_ sections: IndexSet, with animation: UITableView.RowAnimation)

    open func deleteSections(_ sections: IndexSet, with animation: UITableView.RowAnimation)

    @available(iOS 3.0, *)
    open func reloadSections(_ sections: IndexSet, with animation: UITableView.RowAnimation)

    @available(iOS 5.0, *)
    open func moveSection(_ section: Int, toSection newSection: Int)

    
    open func insertRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation)

    open func deleteRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation)

    @available(iOS 3.0, *)
    open func reloadRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation)

    @available(iOS 5.0, *)
    open func moveRow(at indexPath: IndexPath, to newIndexPath: IndexPath)

    
    // Returns YES if the table view is in the middle of reordering, is displaying a drop target gap, or has drop placeholders. If possible, avoid calling -reloadData while there are uncommitted updates to avoid interfering with user-initiated interactions that have not yet completed.
    @available(iOS 11.0, *)
    open var hasUncommittedUpdates: Bool { get }

    
    // Reloads everything from scratch. Redisplays visible rows. Note that this will cause any existing drop placeholder rows to be removed.
    open func reloadData()

    
    // Reloads the section index bar.
    @available(iOS 3.0, *)
    open func reloadSectionIndexTitles()

    
    // Editing. When set, rows show insert\/delete\/reorder controls based on data source queries
    
    open var isEditing: Bool // default is NO. setting is not animated.

    open func setEditing(_ editing: Bool, animated: Bool)

    
    @available(iOS 3.0, *)
    open var allowsSelection: Bool // default is YES. Controls whether rows can be selected when not in editing mode

    open var allowsSelectionDuringEditing: Bool // default is NO. Controls whether rows can be selected when in editing mode

    @available(iOS 5.0, *)
    open var allowsMultipleSelection: Bool // default is NO. Controls whether multiple rows can be selected simultaneously

    @available(iOS 5.0, *)
    open var allowsMultipleSelectionDuringEditing: Bool // default is NO. Controls whether multiple rows can be selected simultaneously in editing mode

    
    // Selection
    
    open var indexPathForSelectedRow: IndexPath? { get } // returns nil or index path representing section and row of selection.

    @available(iOS 5.0, *)
    open var indexPathsForSelectedRows: [IndexPath]? { get } // returns nil or a set of index paths representing the sections and rows of the selection.

    
    // Selects and deselects rows. These methods will not call the delegate methods (-tableView:willSelectRowAtIndexPath: or tableView:didSelectRowAtIndexPath:), nor will it send out a notification.
    open func selectRow(at indexPath: IndexPath?, animated: Bool, scrollPosition: UITableView.ScrollPosition)

    open func deselectRow(at indexPath: IndexPath, animated: Bool)

    
    // Appearance
    
    open var sectionIndexMinimumDisplayRowCount: Int // show special section index list on right when row count reaches this value. default is 0

    @available(iOS 6.0, *)
    open var sectionIndexColor: UIColor? // color used for text of the section index

    @available(iOS 7.0, *)
    open var sectionIndexBackgroundColor: UIColor? // the background color of the section index while not being touched

    @available(iOS 6.0, *)
    open var sectionIndexTrackingBackgroundColor: UIColor? // the background color of the section index while it is being touched

    
    open var separatorStyle: UITableViewCell.SeparatorStyle // default is UITableViewCellSeparatorStyleSingleLine

    open var separatorColor: UIColor? // default is the standard separator gray

    @available(iOS 8.0, *)
    @NSCopying open var separatorEffect: UIVisualEffect? // effect to apply to table separators

    
    @available(iOS 9.0, *)
    open var cellLayoutMarginsFollowReadableWidth: Bool // if cell layout margins are derived from the width of the readableContentGuide. default is NO.

    @available(iOS 11.0, *)
    open var insetsContentViewsToSafeArea: Bool // default value is YES

    
    open var tableHeaderView: UIView? // accessory view for above row content. default is nil. not to be confused with section header

    open var tableFooterView: UIView? // accessory view below content. default is nil. not to be confused with section footer

    
    open func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? // Used by the delegate to acquire an already allocated cell, in lieu of allocating a new one.

    @available(iOS 6.0, *)
    open func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell // newer dequeue method guarantees a cell is returned and resized properly, assuming identifier is registered

    @available(iOS 6.0, *)
    open func dequeueReusableHeaderFooterView(withIdentifier identifier: String) -> UITableViewHeaderFooterView? // like dequeueReusableCellWithIdentifier:, but for headers\/footers

    
    // Beginning in iOS 6, clients can register a nib or class for each cell.
    // If all reuse identifiers are registered, use the newer -dequeueReusableCellWithIdentifier:forIndexPath: to guarantee that a cell instance is returned.
    // Instances returned from the new dequeue method will also be properly sized when they are returned.
    @available(iOS 5.0, *)
    open func register(_ nib: UINib?, forCellReuseIdentifier identifier: String)

    @available(iOS 6.0, *)
    open func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String)

    
    @available(iOS 6.0, *)
    open func register(_ nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String)

    @available(iOS 6.0, *)
    open func register(_ aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String)

    
    // Focus
    
    @available(iOS 9.0, *)
    open var remembersLastFocusedIndexPath: Bool // defaults to NO. If YES, when focusing on a table view the last focused index path is focused automatically. If the table view has never been focused, then the preferred focused index path is used.

    
    // When enabled, the table view ensures that selection is automatically triggered when focus moves to a cell.
    @available(iOS 14.0, *)
    open var selectionFollowsFocus: Bool

    
    // Drag & Drop
    
    // To enable intra-app drags on iPhone, set this to YES.
    // You can also force drags to be disabled for this table view by setting this to NO.
    // By default, this will return YES on iPad and NO on iPhone.
    @available(iOS 11.0, *)
    open var dragInteractionEnabled: Bool

    
    // YES if a drag session is currently active. A drag session begins after rows are \"lifted\" from the table view.
    @available(iOS 11.0, *)
    open var hasActiveDrag: Bool { get }

    
    // YES if table view is currently tracking a drop session.
    @available(iOS 11.0, *)
    open var hasActiveDrop: Bool { get }
}

extension UITableView : UISpringLoadedInteractionSupporting {
}

//_______________________________________________________________________________________________________________
// this protocol represents the data model object. as such, it supplies no information about appearance (including the cells)

public protocol UITableViewDataSource : NSObjectProtocol {

    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int

    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell

    
    @available(iOS 2.0, *)
    optional func numberOfSections(in tableView: UITableView) -> Int // Default is 1 if not implemented

    
    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? // fixed font style. use custom view (UILabel) if you want something different

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?

    
    // Editing
    
    // Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool

    
    // Moving\/reordering
    
    // Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool

    
    // Index
    
    @available(iOS 2.0, *)
    optional func sectionIndexTitles(for tableView: UITableView) -> [String]? // return list of section titles to display in section index view (e.g. \"ABCD...Z#\")

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int // tell table which section corresponds to section title\/index (e.g. \"B\",1))

    
    // Data manipulation - insert and delete support
    
    // After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
    // Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)

    
    // Data manipulation - reorder \/ moving support
    
    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
}

// _______________________________________________________________________________________________________________
// this protocol can provide information about cells before they are displayed on screen.

public protocol UITableViewDataSourcePrefetching : NSObjectProtocol {

    
    // indexPaths are ordered ascending by geometric distance from the table view
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath])

    
    // indexPaths that previously were considered as candidates for pre-fetching, but were not actually used; may be a subset of the previous call to -tableView:prefetchRowsAtIndexPaths:
    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath])
}

// _______________________________________________________________________________________________________________
// Drag & Drop

@available(iOS 11.0, *)
public protocol UITableViewDragDelegate : NSObjectProtocol {

    
    // Provide items to begin a drag associated with a given index path.
    // You can use -[session locationInView:] to do additional hit testing if desired.
    // If an empty array is returned a drag session will not begin.
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem]

    
    // Called to request items to add to an existing drag session in response to the add item gesture.
    // You can use the provided point (in the table view's coordinate space) to do additional hit testing if desired.
    // If not implemented, or if an empty array is returned, no items will be added to the drag and the gesture
    // will be handled normally.
    optional func tableView(_ tableView: UITableView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem]

    
    // Allows customization of the preview used for the row when it is lifted or if the drag cancels.
    // If not implemented or if nil is returned, the entire cell will be used for the preview.
    optional func tableView(_ tableView: UITableView, dragPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters?

    
    // Called after the lift animation has completed to signal the start of a drag session.
    // This call will always be balanced with a corresponding call to -tableView:dragSessionDidEnd:
    optional func tableView(_ tableView: UITableView, dragSessionWillBegin session: UIDragSession)

    
    // Called to signal the end of the drag session.
    optional func tableView(_ tableView: UITableView, dragSessionDidEnd session: UIDragSession)

    
    // Controls whether move operations are allowed for the drag session.
    // If not implemented, defaults to YES.
    optional func tableView(_ tableView: UITableView, dragSessionAllowsMoveOperation session: UIDragSession) -> Bool

    
    // Controls whether the drag session is restricted to the source application.
    // If not implemented, defaults to NO.
    optional func tableView(_ tableView: UITableView, dragSessionIsRestrictedToDraggingApplication session: UIDragSession) -> Bool
}

@available(iOS 11.0, *)
public protocol UITableViewDropDelegate : NSObjectProtocol {

    
    // Called when the user initiates the drop.
    // Use the drop coordinator to access the items in the drop and the final destination index path and proposal for the drop,
    // as well as specify how you wish to animate each item to its final position.
    // If your implementation of this method does nothing, default drop animations will be supplied and the table view will
    // revert back to its initial state before the drop session entered.
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator)

    
    // If NO is returned no further delegate methods will be called for this drop session.
    // If not implemented, a default value of YES is assumed.
    optional func tableView(_ tableView: UITableView, canHandle session: UIDropSession) -> Bool

    
    // Called when the drop session begins tracking in the table view's coordinate space.
    optional func tableView(_ tableView: UITableView, dropSessionDidEnter session: UIDropSession)

    
    // Called frequently while the drop session being tracked inside the table view's coordinate space.
    // When the drop is at the end of a section, the destination index path passed will be for a row that does not yet exist (equal
    // to the number of rows in that section), where an inserted row would append to the end of the section.
    // The destination index path may be nil in some circumstances (e.g. when dragging over empty space where there are no cells).
    // Note that in some cases your proposal may not be allowed and the system will enforce a different proposal.
    // You may perform your own hit testing via -[session locationInView:]
    optional func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal

    
    // Called when the drop session is no longer being tracked inside the table view's coordinate space.
    optional func tableView(_ tableView: UITableView, dropSessionDidExit session: UIDropSession)

    
    // Called when the drop session completed, regardless of outcome. Useful for performing any cleanup.
    optional func tableView(_ tableView: UITableView, dropSessionDidEnd session: UIDropSession)

    
    // Allows customization of the preview used when dropping to a newly inserted row.
    // If not implemented or if nil is returned, the entire cell will be used for the preview.
    optional func tableView(_ tableView: UITableView, dropPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters?
}
extension UITableViewDropProposal {

    
    @available(iOS 11.0, *)
    public enum Intent : Int {

        
        case unspecified = 0

        
        case insertAtDestinationIndexPath = 1

        
        case insertIntoDestinationIndexPath = 2

        
        case automatic = 3
    }
}

@available(iOS 11.0, *)
open class UITableViewDropProposal : UIDropProposal {

    
    public init(operation: UIDropOperation, intent: UITableViewDropProposal.Intent)

    
    // The default is UITableViewDropIntentUnspecified.
    open var intent: UITableViewDropProposal.Intent { get }
}

@available(iOS 11.0, *)
public protocol UITableViewDropCoordinator : NSObjectProtocol {

    
    // Ordered list of items available for this drop.
    var items: [UITableViewDropItem] { get }

    
    // The last hit-tested index path known during the drop session.
    // When the drop is at the end of a section, this index path will be for a row that does not yet exist (equal
    // to the number of rows in that section), where an inserted row would append to the end of the section.
    // This index path may be nil in some circumstances (e.g. when dragging over empty space where there are no cells),
    // and if it is nil, the proposal's intent will always be UITableViewDropIntentUnspecified.
    var destinationIndexPath: IndexPath? { get }

    
    // The current drop proposal at the time of the drop.
    var proposal: UITableViewDropProposal { get }

    
    // The drop session.
    var session: UIDropSession { get }

    
    // Animate the dragItem to an automatically inserted placeholder row.
    // Once the dragItem data is available, you can exchange the temporary placeholder cell with the final cell using the placeholder context
    // method -commitInsertionWithDataSourceUpdates:
    func drop(_ dragItem: UIDragItem, to placeholder: UITableViewDropPlaceholder) -> UITableViewDropPlaceholderContext

    
    // Animate the dragItem to a row that you inserted at this index path.
    // You must call -performBatchUpdates:completion: to update your data source and insert a new row into the table view prior to calling this method.
    // If desired, use the drop delegate method -tableView:dropPreviewParametersForRowAtIndexPath: to provide preview parameters.
    func drop(_ dragItem: UIDragItem, toRowAt indexPath: IndexPath) -> UIDragAnimating

    
    // Animate the dragItem to a rect inside an existing row.
    // The rect is in the coordinate space of the cell at this index path.
    // The item will be animated with an aspect fit scale transform to fit inside the rect. Use a rect with zero size to shrink the item to a single point.
    func drop(_ dragItem: UIDragItem, intoRowAt indexPath: IndexPath, rect: CGRect) -> UIDragAnimating

    
    // Animate the dragItem to a location specified by the UIDragPreviewTarget.
    // The -[UITableViewDropItem previewSize] may be helpful to compute an appropriate transform.
    func drop(_ dragItem: UIDragItem, to target: UIDragPreviewTarget) -> UIDragAnimating
}

@available(iOS 11.0, *)
open class UITableViewPlaceholder : NSObject {

    
    // A placeholder cell will be dequeued for the reuse identifier and inserted at the specified index path without requiring a data source update.
    // You may use UITableViewAutomaticDimension for the rowHeight to have the placeholder cell self-size if the table view is using estimated row heights.
    public init(insertionIndexPath: IndexPath, reuseIdentifier: String, rowHeight: CGFloat)

    
    // Called whenever the placeholder cell is visible to update the contents of the cell.
    open var cellUpdateHandler: ((UITableViewCell) -> Void)?
}

@available(iOS 11.0, *)
open class UITableViewDropPlaceholder : UITableViewPlaceholder {

    
    // Allows customization of the preview used when dropping to a placeholder.
    // If no block is set, or if nil is returned, the entire cell will be used for the preview.
    open var previewParametersProvider: ((UITableViewCell) -> UIDragPreviewParameters?)?
}

@available(iOS 11.0, *)
public protocol UITableViewDropItem : NSObjectProtocol {

    
    // Retrieve drop data from the dragItem's itemProvider.
    var dragItem: UIDragItem { get }

    
    // If this drop item is also from this table view this index path will specify the location of the row it came from.
    // If the dragItem comes from some other source (e.g. another source inside or outside of the app), or if the source
    // table view is updated or reloaded after the drag begins, this index path will be nil.
    // This is useful for directly accessing the model object in your data source instead of using the item provider
    // to retrieve the data.
    var sourceIndexPath: IndexPath? { get }

    
    // May be useful for computing the UIDragPreviewTarget transform for UITableViewDropCoordinator dropItem:toTarget:
    // Returns CGSizeZero if the dragItem does not have a visible drop preview.
    var previewSize: CGSize { get }
}

@available(iOS 11.0, *)
public protocol UITableViewDropPlaceholderContext : UIDragAnimating {

    
    // The drag item this placeholder was created for.
    var dragItem: UIDragItem { get }

    
    // Exchange the placeholder for the final cell.
    // You are only responsible for updating your data source inside the block using the provided insertionIndexPath.
    // If the placeholder is no longer available (e.g. -reloadData has been called) the dataSourceUpdates block
    // will not be executed and this will return NO.
    func commitInsertion(dataSourceUpdates: (IndexPath) -> Void) -> Bool

    
    // If the placeholder is no longer needed or you wish to manually insert a cell for the drop data, you can
    // remove the placeholder via this method.
    // If the placeholder is no longer available (e.g. -reloadData has been called) this will return NO.
    func deletePlaceholder() -> Bool
}
,
extension UITableView: Chainable {}
