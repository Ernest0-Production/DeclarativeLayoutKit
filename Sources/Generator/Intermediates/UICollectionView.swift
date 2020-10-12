import Foundation

extension UICollectionView {

    
    public typealias LayoutInteractiveTransitionCompletion = (Bool, Bool) -> Void

    public struct ScrollPosition : OptionSet {

        public init(rawValue: UInt)

        public static var top: UICollectionView.ScrollPosition { get }

        public static var centeredVertically: UICollectionView.ScrollPosition { get }

        public static var bottom: UICollectionView.ScrollPosition { get }

        public static var left: UICollectionView.ScrollPosition { get }

        public static var centeredHorizontally: UICollectionView.ScrollPosition { get }

        public static var right: UICollectionView.ScrollPosition { get }
    }

    @available(iOS 11.0, *)
    public enum ReorderingCadence : Int {

        case immediate = 0

        case fast = 1

        case slow = 2
    }
}

@available(iOS 9.0, *)
open class UICollectionViewFocusUpdateContext : UIFocusUpdateContext {

    
    open var previouslyFocusedIndexPath: IndexPath? { get }

    open var nextFocusedIndexPath: IndexPath? { get }
}

public protocol UICollectionViewDataSource : NSObjectProtocol {

    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int

    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell

    
    @available(iOS 6.0, *)
    optional func numberOfSections(in collectionView: UICollectionView) -> Int

    
    // The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
    @available(iOS 6.0, *)
    optional func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView

    
    @available(iOS 9.0, *)
    optional func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool

    @available(iOS 9.0, *)
    optional func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)

    
    //\/ Returns a list of index titles to display in the index view (e.g. [\"A\", \"B\", \"C\" ... \"Z\", \"#\"])
    @available(iOS 6.0, *)
    optional func indexTitles(for collectionView: UICollectionView) -> [String]?

    
    //\/ Returns the index path that corresponds to the given title \/ index. (e.g. \"B\",1)
    //\/ Return an index path with a single index to indicate an entire section, instead of a specific item.
    @available(iOS 6.0, *)
    optional func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath
}

public protocol UICollectionViewDataSourcePrefetching : NSObjectProtocol {

    
    // indexPaths are ordered ascending by geometric distance from the collection view
    @available(iOS 10.0, *)
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath])

    
    // indexPaths that previously were considered as candidates for pre-fetching, but were not actually used; may be a subset of the previous call to -collectionView:prefetchItemsAtIndexPaths:
    @available(iOS 10.0, *)
    optional func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath])
}

public protocol UICollectionViewDelegate : UIScrollViewDelegate {

    
    // Methods for notification of selection\/deselection and highlight\/unhighlight events.
    // The sequence of calls leading to selection from a user touch is:
    //
    // (when the touch begins)
    // 1. -collectionView:shouldHighlightItemAtIndexPath:
    // 2. -collectionView:didHighlightItemAtIndexPath:
    //
    // (when the touch lifts)
    // 3. -collectionView:shouldSelectItemAtIndexPath: or -collectionView:shouldDeselectItemAtIndexPath:
    // 4. -collectionView:didSelectItemAtIndexPath: or -collectionView:didDeselectItemAtIndexPath:
    // 5. -collectionView:didUnhighlightItemAtIndexPath:
    @available(iOS 6.0, *)
    optional func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool

    @available(iOS 6.0, *)
    optional func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath)

    @available(iOS 6.0, *)
    optional func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath)

    @available(iOS 6.0, *)
    optional func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool

    @available(iOS 6.0, *)
    optional func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool // called when the user taps on an already-selected item in multi-select mode

    @available(iOS 6.0, *)
    optional func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)

    @available(iOS 6.0, *)
    optional func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)

    
    @available(iOS 8.0, *)
    optional func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)

    @available(iOS 8.0, *)
    optional func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath)

    @available(iOS 6.0, *)
    optional func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath)

    @available(iOS 6.0, *)
    optional func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath)

    
    // These methods provide support for copy\/paste actions on cells.
    // All three should be implemented if any are.
    @available(iOS, introduced: 6.0, deprecated: 13.0)
    optional func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool

    @available(iOS, introduced: 6.0, deprecated: 13.0)
    optional func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool

    @available(iOS, introduced: 6.0, deprecated: 13.0)
    optional func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?)

    
    // support for custom transition layout
    @available(iOS 7.0, *)
    optional func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout

    
    // Focus
    @available(iOS 9.0, *)
    optional func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool

    @available(iOS 9.0, *)
    optional func collectionView(_ collectionView: UICollectionView, shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool

    @available(iOS 9.0, *)
    optional func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator)

    @available(iOS 9.0, *)
    optional func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath?

    
    @available(iOS 9.0, *)
    optional func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath

    
    @available(iOS 9.0, *)
    optional func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint // customize the content offset to be applied during transition or update animations

    
    // Editing
    /* Asks the delegate to verify that the given item is editable.
     *
     * @param collectionView The collection view object requesting this information.
     * @param indexPath An index path locating an item in `collectionView`.
     *
     * @return `YES` if the item is editable; otherwise, `NO`. Defaults to `YES`.
     */
    @available(iOS 14.0, *)
    optional func collectionView(_ collectionView: UICollectionView, canEditItemAt indexPath: IndexPath) -> Bool

    
    // Spring Loading
    
    /* Allows opting-out of spring loading for an particular item.
     *
     * If you want the interaction effect on a different subview of the spring loaded cell, modify the context.targetView property.
     * The default is the cell.
     *
     * If this method is not implemented, the default is YES.
     */
    @available(iOS 11.0, *)
    optional func collectionView(_ collectionView: UICollectionView, shouldSpringLoadItemAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool

    
    // Multiple Selection
    
    /* Allows a two-finger pan gesture to automatically enable allowsMultipleSelection and start selecting multiple cells.
     *
     * After a multi-select gesture is recognized, this method will be called before allowsMultipleSelection is automatically
     * set to YES to allow the user to select multiple contiguous items using a two-finger pan gesture across the constrained
     * scroll direction.
     *
     * If the collection view has no constrained scroll direction (i.e., the collection view scrolls both horizontally and vertically),
     * then this method will not be called and the multi-select gesture will be disabled.
     *
     * If this method is not implemented, the default is NO.
     */
    @available(iOS 13.0, *)
    optional func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool

    
    /* Called right after allowsMultipleSelection is set to YES if -collectionView:shouldBeginMultipleSelectionInteractionAtIndexPath:
     * returned YES.
     *
     * In your app, this would be a good opportunity to update the state of your UI to reflect the fact that the user is now selecting
     * multiple items at once; such as updating buttons to say \"Done\" instead of \"Select\"\/\"Edit\", for instance.
     */
    @available(iOS 13.0, *)
    optional func collectionView(_ collectionView: UICollectionView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath)

    
    /* Called when the multi-select interaction ends.
     *
     * At this point, the collection view will remain in multi-select mode, but this delegate method is called to indicate that the
     * multiple selection gesture or hardware keyboard interaction has ended.
     */
    @available(iOS 13.0, *)
    optional func collectionViewDidEndMultipleSelectionInteraction(_ collectionView: UICollectionView)

    
    /**
     * @abstract Called when the interaction begins.
     *
     * @param collectionView  This UICollectionView.
     * @param indexPath       IndexPath of the item for which a configuration is being requested.
     * @param point           Location in the collection view's coordinate space
     *
     * @return A UIContextMenuConfiguration describing the menu to be presented. Return nil to prevent the interaction from beginning.
     *         Returning an empty configuration causes the interaction to begin then fail with a cancellation effect. You might use this
     *         to indicate to users that it's possible for a menu to be presented from this element, but that there are no actions to
     *         present at this particular time.
     */
    @available(iOS 13.0, *)
    optional func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration?

    
    /**
     * @abstract Called when the interaction begins. Return a UITargetedPreview describing the desired highlight preview.
     *
     * @param collectionView  This UICollectionView.
     * @param configuration   The configuration of the menu about to be displayed by this interaction.
     */
    @available(iOS 13.0, *)
    optional func collectionView(_ collectionView: UICollectionView, previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview?

    
    /**
     * @abstract Called when the interaction is about to dismiss. Return a UITargetedPreview describing the desired dismissal target.
     * The interaction will animate the presented menu to the target. Use this to customize the dismissal animation.
     *
     * @param collectionView  This UICollectionView.
     * @param configuration   The configuration of the menu displayed by this interaction.
     */
    @available(iOS 13.0, *)
    optional func collectionView(_ collectionView: UICollectionView, previewForDismissingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview?

    
    /**
     * @abstract Called when the interaction is about to \"commit\" in response to the user tapping the preview.
     *
     * @param collectionView  This UICollectionView.
     * @param configuration   Configuration of the currently displayed menu.
     * @param animator        Commit animator. Add animations to this object to run them alongside the commit transition.
     */
    @available(iOS 13.0, *)
    optional func collectionView(_ collectionView: UICollectionView, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating)

    
    /**
     * @abstract Called when the collection view is about to display a menu.
     *
     * @param collectionView  This UICollectionView.
     * @param configuration   The configuration of the menu about to be displayed.
     * @param animator        Appearance animator. Add animations to run them alongside the appearance transition.
     */
    @available(iOS 13.2, *)
    optional func collectionView(_ collectionView: UICollectionView, willDisplayContextMenu configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?)

    
    /**
     * @abstract Called when the collection view's context menu interaction is about to end.
     *
     * @param collectionView  This UICollectionView.
     * @param configuration   Ending configuration.
     * @param animator        Disappearance animator. Add animations to run them alongside the disappearance transition.
     */
    @available(iOS 13.2, *)
    optional func collectionView(_ collectionView: UICollectionView, willEndContextMenuInteraction configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?)
}

@available(iOS 6.0, *)
open class UICollectionView : UIScrollView, UIDataSourceTranslating {

    
    public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout)

    public init?(coder: NSCoder)

    
    open var collectionViewLayout: UICollectionViewLayout

    weak open var delegate: UICollectionViewDelegate?

    weak open var dataSource: UICollectionViewDataSource?

    
    @available(iOS 10.0, *)
    weak open var prefetchDataSource: UICollectionViewDataSourcePrefetching?

    @available(iOS 10.0, *)
    open var isPrefetchingEnabled: Bool

    
    @available(iOS 11.0, *)
    weak open var dragDelegate: UICollectionViewDragDelegate?

    @available(iOS 11.0, *)
    weak open var dropDelegate: UICollectionViewDropDelegate?

    
    /* To enable intra-app drags on iPhone, set this to YES.
     * You can also force drags to be disabled for this collection view by setting this to NO.
     * By default, For iPad this will return YES and iPhone will return NO.
     */
    @available(iOS 11.0, *)
    open var dragInteractionEnabled: Bool

    
    /* Reordering cadence affects how easily reordering occurs while dragging around a reorder-capable drop destination.
     * Default is UICollectionViewReorderingCadenceImmediate.
     */
    @available(iOS 11.0, *)
    open var reorderingCadence: UICollectionView.ReorderingCadence

    
    open var backgroundView: UIView? // will be automatically resized to track the size of the collection view and placed behind all cells and supplementary views.

    
    // For each reuse identifier that the collection view will use, register either a class or a nib from which to instantiate a cell.
    // If a nib is registered, it must contain exactly 1 top level object which is a UICollectionViewCell.
    // If a class is registered, it will be instantiated via alloc\/initWithFrame:
    open func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String)

    open func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String)

    
    open func register(_ viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: String)

    open func register(_ nib: UINib?, forSupplementaryViewOfKind kind: String, withReuseIdentifier identifier: String)

    
    open func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell

    open func dequeueReusableSupplementaryView(ofKind elementKind: String, withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionReusableView

    
    // These properties control whether items can be selected, and if so, whether multiple items can be simultaneously selected.
    open var allowsSelection: Bool // default is YES

    open var allowsMultipleSelection: Bool // default is NO

    
    open var indexPathsForSelectedItems: [IndexPath]? { get } // returns nil or an array of selected index paths

    open func selectItem(at indexPath: IndexPath?, animated: Bool, scrollPosition: UICollectionView.ScrollPosition)

    open func deselectItem(at indexPath: IndexPath, animated: Bool)

    
    // Returns YES if the collection view is reordering or has drop placeholders.
    @available(iOS 11.0, *)
    open var hasUncommittedUpdates: Bool { get }

    
    // Note: -reloadData will discard any uncommitted updates (e.g. placeholders)
    open func reloadData() // discard the dataSource and delegate data and requery as necessary

    
    open func setCollectionViewLayout(_ layout: UICollectionViewLayout, animated: Bool) // transition from one layout to another

    @available(iOS 7.0, *)
    open func setCollectionViewLayout(_ layout: UICollectionViewLayout, animated: Bool, completion: ((Bool) -> Void)? = nil)

    
    @available(iOS 7.0, *)
    open func startInteractiveTransition(to layout: UICollectionViewLayout, completion: UICollectionView.LayoutInteractiveTransitionCompletion? = nil) -> UICollectionViewTransitionLayout

    @available(iOS 7.0, *)
    open func finishInteractiveTransition()

    @available(iOS 7.0, *)
    open func cancelInteractiveTransition()

    
    // Information about the current state of the collection view.
    
    open var numberOfSections: Int { get }

    open func numberOfItems(inSection section: Int) -> Int

    
    open func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes?

    open func layoutAttributesForSupplementaryElement(ofKind kind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes?

    
    open func indexPathForItem(at point: CGPoint) -> IndexPath?

    open func indexPath(for cell: UICollectionViewCell) -> IndexPath?

    
    open func cellForItem(at indexPath: IndexPath) -> UICollectionViewCell?

    open var visibleCells: [UICollectionViewCell] { get }

    open var indexPathsForVisibleItems: [IndexPath] { get }

    
    @available(iOS 9.0, *)
    open func supplementaryView(forElementKind elementKind: String, at indexPath: IndexPath) -> UICollectionReusableView?

    @available(iOS 9.0, *)
    open func visibleSupplementaryViews(ofKind elementKind: String) -> [UICollectionReusableView]

    @available(iOS 9.0, *)
    open func indexPathsForVisibleSupplementaryElements(ofKind elementKind: String) -> [IndexPath]

    
    // Interacting with the collection view.
    
    open func scrollToItem(at indexPath: IndexPath, at scrollPosition: UICollectionView.ScrollPosition, animated: Bool)

    
    // These methods allow dynamic modification of the current set of items in the collection view
    open func insertSections(_ sections: IndexSet)

    open func deleteSections(_ sections: IndexSet)

    open func reloadSections(_ sections: IndexSet)

    open func moveSection(_ section: Int, toSection newSection: Int)

    
    open func insertItems(at indexPaths: [IndexPath])

    open func deleteItems(at indexPaths: [IndexPath])

    open func reloadItems(at indexPaths: [IndexPath])

    open func moveItem(at indexPath: IndexPath, to newIndexPath: IndexPath)

    
    open func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil) // allows multiple insert\/delete\/reload\/move calls to be animated simultaneously. Nestable.

    
    // Support for reordering
    @available(iOS 9.0, *)
    open func beginInteractiveMovementForItem(at indexPath: IndexPath) -> Bool // returns NO if reordering was prevented from beginning - otherwise YES

    @available(iOS 9.0, *)
    open func updateInteractiveMovementTargetPosition(_ targetPosition: CGPoint)

    @available(iOS 9.0, *)
    open func endInteractiveMovement()

    @available(iOS 9.0, *)
    open func cancelInteractiveMovement()

    
    // Support for Focus
    @available(iOS 9.0, *)
    open var remembersLastFocusedIndexPath: Bool // defaults to NO. If YES, when focusing on a collection view the last focused index path is focused automatically. If the collection view has never been focused, then the preferred focused index path is used.

    
    // When enabled, the collection view ensures that selection is automatically triggered when focus moves to a cell.
    @available(iOS 14.0, *)
    open var selectionFollowsFocus: Bool

    
    // Drag & Drop
    
    /* YES if a drag session is currently active. A drag session begins after items are \"lifted\" from the collection view.
     */
    @available(iOS 11.0, *)
    open var hasActiveDrag: Bool { get }

    
    /* YES if collection view is currently tracking a drop session.
     */
    @available(iOS 11.0, *)
    open var hasActiveDrop: Bool { get }

    
    // Editing
    
    /* Controls the editing state for the receiver.
     */
    @available(iOS 14.0, *)
    open var isEditing: Bool

    
    /* Controls whether an item can be selected when the receiver is editing.
     * Defaults to NO.
     */
    @available(iOS 14.0, *)
    open var allowsSelectionDuringEditing: Bool

    
    /* Controls whether multiple item selection can occur when the receiver is editing.
     * Defaults to NO.
     */
    @available(iOS 14.0, *)
    open var allowsMultipleSelectionDuringEditing: Bool
}

@available(iOS 14.0, tvOS 14.0, *)
extension UICollectionView {

    public struct CellRegistration<Cell, Item> where Cell : UICollectionViewCell {

        public typealias Handler = (Cell, IndexPath, Item) -> Void

        public init(handler: @escaping UICollectionView.CellRegistration<Cell, Item>.Handler)

        public init(cellNib: UINib, handler: @escaping UICollectionView.CellRegistration<Cell, Item>.Handler)
    }

    public struct SupplementaryRegistration<Supplementary> where Supplementary : UICollectionReusableView {

        public typealias Handler = (Supplementary, String, IndexPath) -> Void

        public init(elementKind: String, handler: @escaping UICollectionView.SupplementaryRegistration<Supplementary>.Handler)

        public init(supplementaryNib: UINib, elementKind: String, handler: @escaping UICollectionView.SupplementaryRegistration<Supplementary>.Handler)
    }

    public func dequeueConfiguredReusableCell<Cell, Item>(using registration: UICollectionView.CellRegistration<Cell, Item>, for indexPath: IndexPath, item: Item?) -> Cell where Cell : UICollectionViewCell

    public func dequeueConfiguredReusableSupplementary<Supplementary>(using registration: UICollectionView.SupplementaryRegistration<Supplementary>, for indexPath: IndexPath) -> Supplementary where Supplementary : UICollectionReusableView
}

// _______________________________________________________________________________________________________________
// Drag & Drop

extension UICollectionView : UISpringLoadedInteractionSupporting {
}

@available(iOS 11.0, *)
public protocol UICollectionViewDragDelegate : NSObjectProtocol {

    
    /* Provide items to begin a drag associated with a given indexPath.
     * If an empty array is returned a drag session will not begin.
     */
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem]

    
    /* Called to request items to add to an existing drag session in response to the add item gesture.
     * You can use the provided point (in the collection view's coordinate space) to do additional hit testing if desired.
     * If not implemented, or if an empty array is returned, no items will be added to the drag and the gesture
     * will be handled normally.
     */
    optional func collectionView(_ collectionView: UICollectionView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem]

    
    /* Allows customization of the preview used for the item being lifted from or cancelling back to the collection view.
     * If not implemented or if nil is returned, the entire cell will be used for the preview.
     */
    optional func collectionView(_ collectionView: UICollectionView, dragPreviewParametersForItemAt indexPath: IndexPath) -> UIDragPreviewParameters?

    
    /* Called after the lift animation has completed to signal the start of a drag session.
     * This call will always be balanced with a corresponding call to -collectionView:dragSessionDidEnd:
     */
    optional func collectionView(_ collectionView: UICollectionView, dragSessionWillBegin session: UIDragSession)

    
    /* Called to signal the end of the drag session.
     */
    optional func collectionView(_ collectionView: UICollectionView, dragSessionDidEnd session: UIDragSession)

    
    /* Controls whether move operations (see UICollectionViewDropProposal.operation) are allowed for the drag session.
     * If not implemented this will default to YES.
     */
    optional func collectionView(_ collectionView: UICollectionView, dragSessionAllowsMoveOperation session: UIDragSession) -> Bool

    
    /* Controls whether the drag session is restricted to the source application.
     * If YES the current drag session will not be permitted to drop into another application.
     * If not implemented this will default to NO.
     */
    optional func collectionView(_ collectionView: UICollectionView, dragSessionIsRestrictedToDraggingApplication session: UIDragSession) -> Bool
}

@available(iOS 11.0, *)
public protocol UICollectionViewDropDelegate : NSObjectProtocol {

    
    /* Called when the user initiates the drop.
     * Use the dropCoordinator to specify how you wish to animate the dropSession's items into their final position as
     * well as update the collection view's data source with data retrieved from the dropped items.
     * If the supplied method does nothing, default drop animations will be supplied and the collection view will
     * revert back to its initial pre-drop session state.
     */
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator)

    
    /* If NO is returned no further delegate methods will be called for this drop session.
     * If not implemented, a default value of YES is assumed.
     */
    optional func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool

    
    /* Called when the drop session begins tracking in the collection view's coordinate space.
     */
    optional func collectionView(_ collectionView: UICollectionView, dropSessionDidEnter session: UIDropSession)

    
    /* Called frequently while the drop session being tracked inside the collection view's coordinate space.
     * When the drop is at the end of a section, the destination index path passed will be for a item that does not yet exist (equal
     * to the number of items in that section), where an inserted item would append to the end of the section.
     * The destination index path may be nil in some circumstances (e.g. when dragging over empty space where there are no cells).
     * Note that in some cases your proposal may not be allowed and the system will enforce a different proposal.
     * You may perform your own hit testing via -[UIDropSession locationInView]
     */
    optional func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal

    
    /* Called when the drop session is no longer being tracked inside the collection view's coordinate space.
     */
    optional func collectionView(_ collectionView: UICollectionView, dropSessionDidExit session: UIDropSession)

    
    /* Called when the drop session completed, regardless of outcome. Useful for performing any cleanup.
     */
    optional func collectionView(_ collectionView: UICollectionView, dropSessionDidEnd session: UIDropSession)

    
    /* Allows customization of the preview used for the item being dropped.
     * If not implemented or if nil is returned, the entire cell will be used for the preview.
     *
     * This will be called as needed when animating drops via -[UICollectionViewDropCoordinator dropItem:toItemAtIndexPath:]
     * (to customize placeholder drops, please see UICollectionViewDropPlaceholder.previewParametersProvider)
     */
    optional func collectionView(_ collectionView: UICollectionView, dropPreviewParametersForItemAt indexPath: IndexPath) -> UIDragPreviewParameters?
}
extension UICollectionViewDropProposal {

    
    @available(iOS 11.0, *)
    public enum Intent : Int {

        
        case unspecified = 0

        
        case insertAtDestinationIndexPath = 1

        
        case insertIntoDestinationIndexPath = 2
    }
}

@available(iOS 11.0, *)
open class UICollectionViewDropProposal : UIDropProposal {

    
    public init(operation: UIDropOperation, intent: UICollectionViewDropProposal.Intent)

    
    /* The default is UICollectionViewDropIntentUnspecified.
     */
    open var intent: UICollectionViewDropProposal.Intent { get }
}

@available(iOS 11.0, *)
public protocol UICollectionViewDropCoordinator : NSObjectProtocol {

    
    /* Ordered list of items available for this drop.
     */
    var items: [UICollectionViewDropItem] { get }

    
    /* The last hit-tested index path known during the drop session.
     * If this is nil, the proposal's intent will be .unspecified
     */
    var destinationIndexPath: IndexPath? { get }

    
    /* The current drop proposal at the time of the drop.
     */
    var proposal: UICollectionViewDropProposal { get }

    
    var session: UIDropSession { get }

    
    /* Animate the dragItem to an automatically inserted placeholder item.
     *
     * A placeholder cell will be created for the reuse identifier and inserted at the specified indexPath without requiring a dataSource update.
     *
     * The cellUpdateHandler will be called whenever the placeholder cell becomes visible; -collectionView:cellForItemAtIndexPath: will not be called
     * for the placeholder.
     *
     * Once the dragItem data is available, you can exchange the temporary placeholder cell with the final cell using
     * the placeholder context method -commitInsertionWithDataSourceUpdates:
     *
     * UICollectionViewDropPlaceholderContext also conforms to UIDragAnimating to allow adding alongside animations and completion handlers.
     */
    func drop(_ dragItem: UIDragItem, to placeholder: UICollectionViewDropPlaceholder) -> UICollectionViewDropPlaceholderContext

    
    /* Animate the dragItem to a newly inserted item at the specified index path.
     * You must call -performBatchUpdates:completion: to update your data source and insert a new item into the collection view prior to calling this method.
     *
     * To tweak the appearance of the preview being dropping (e.g. supply a clipping path), see -collectionView:dropPreviewParametersForItemAtIndexPath:
     */
    func drop(_ dragItem: UIDragItem, toItemAt indexPath: IndexPath) -> UIDragAnimating

    
    /* Animate the dragItem to a rect inside an existing item.
     * The rect is in the coordinate space of the cell at this index path.
     * The item will be animated with an aspect fit scale transform to fit inside the rect. Use a rect with zero size to shrink the item to a single point.
     */
    func drop(_ dragItem: UIDragItem, intoItemAt indexPath: IndexPath, rect: CGRect) -> UIDragAnimating

    
    /* Animate the dragItem to a location specified by the UIDragPreviewTarget.
     */
    func drop(_ dragItem: UIDragItem, to target: UIDragPreviewTarget) -> UIDragAnimating
}

@available(iOS 11.0, *)
open class UICollectionViewPlaceholder : NSObject {

    
    public init(insertionIndexPath: IndexPath, reuseIdentifier: String)

    
    /* Called whenever the placeholder cell is visible to update the contents of the cell.
     */
    open var cellUpdateHandler: ((UICollectionViewCell) -> Void)?
}

@available(iOS 11.0, *)
open class UICollectionViewDropPlaceholder : UICollectionViewPlaceholder {

    
    /* If specified, will be used to modify the appearance (e.g. visiblePath to supply a \"cut out\" region of the placeholder cell) of the animating dropped item.
     * Handler will be called as-needed.
     */
    open var previewParametersProvider: ((UICollectionViewCell) -> UIDragPreviewParameters?)?
}

@available(iOS 11.0, *)
public protocol UICollectionViewDropItem : NSObjectProtocol {

    
    var dragItem: UIDragItem { get }

    
    /* If this drop item is also from this collection view this indexPath will specify the location of the item.
     * If the dragItem comes from some other source (e.g. another source inside or outside of the app), it will be nil.
     * This is useful for directly accessing the model objects in the data source instead of using the item provider
     * to retrieve the data.
     */
    var sourceIndexPath: IndexPath? { get }

    
    /* May be useful for computing the UIDragPreviewTarget transform for UICollectionViewDropCoordinator dropItem:toTarget:
     * Returns CGSizeZero if the dragItem does not have a visible drop preview.
     */
    var previewSize: CGSize { get }
}

@available(iOS 11.0, *)
public protocol UICollectionViewDropPlaceholderContext : UIDragAnimating {

    
    /* Retrieve drop data from the dragItem's itemProvider.
     */
    var dragItem: UIDragItem { get }

    
    /* Exchange the placeholder for the final cell.
     * You are only responsible for updating your data source inside the block using the provided insertionIndexPath.
     * If the placeholder is no longer available (e.g. -reloadData has been called) the dataSourceUpdates block
     * will not be executed and this will return NO.
     */
    func commitInsertion(dataSourceUpdates: (IndexPath) -> Void) -> Bool

    
    /* If the placeholder is no longer needed or you wish to manually insert a cell for the drop data, you can
     * remove the placeholder via this method.
     * If the placeholder is no longer available (e.g. -reloadData has been called) this will return NO.
     */
    func deletePlaceholder() -> Bool

    
    /* Call this method to request an update of the placeholder cell's content via the updateCellHandler.
     * This will only be called if the placeholder is visible. If the placeholder becomes visible via scrolling,
     * the updateCellHandler will automatically be called.
     */
    func setNeedsCellUpdate()
}
,
extension UICollectionView: Chainable {}
