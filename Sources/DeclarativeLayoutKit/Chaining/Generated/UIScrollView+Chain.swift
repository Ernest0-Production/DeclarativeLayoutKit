// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public extension UIScrollView {
    @discardableResult
    func contentOffset(_ newValue: CGPoint) -> Self {
        contentOffset = newValue
        return self
    }

    @discardableResult
    func contentSize(_ newValue: CGSize) -> Self {
        contentSize = newValue
        return self
    }

    @discardableResult
    func contentInset(_ newValue: UIEdgeInsets) -> Self {
        contentInset = newValue
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func contentInsetAdjustmentBehavior(_ newValue: UIScrollView.ContentInsetAdjustmentBehavior) -> Self {
        contentInsetAdjustmentBehavior = newValue
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func automaticallyAdjustsScrollIndicatorInsets(_ newValue: Bool) -> Self {
        automaticallyAdjustsScrollIndicatorInsets = newValue
        return self
    }

    @discardableResult
    func delegate(_ newValue: UIScrollViewDelegate?) -> Self {
        delegate = newValue
        return self
    }

    @discardableResult
    func isDirectionalLockEnabled(_ newValue: Bool) -> Self {
        isDirectionalLockEnabled = newValue
        return self
    }

    @discardableResult
    func bounces(_ newValue: Bool) -> Self {
        bounces = newValue
        return self
    }

    @discardableResult
    func alwaysBounceVertical(_ newValue: Bool) -> Self {
        alwaysBounceVertical = newValue
        return self
    }

    @discardableResult
    func alwaysBounceHorizontal(_ newValue: Bool) -> Self {
        alwaysBounceHorizontal = newValue
        return self
    }

    @discardableResult
    func isPagingEnabled(_ newValue: Bool) -> Self {
        isPagingEnabled = newValue
        return self
    }

    @discardableResult
    func isScrollEnabled(_ newValue: Bool) -> Self {
        isScrollEnabled = newValue
        return self
    }

    @discardableResult
    func showsVerticalScrollIndicator(_ newValue: Bool) -> Self {
        showsVerticalScrollIndicator = newValue
        return self
    }

    @discardableResult
    func showsHorizontalScrollIndicator(_ newValue: Bool) -> Self {
        showsHorizontalScrollIndicator = newValue
        return self
    }

    @discardableResult
    func indicatorStyle(_ newValue: UIScrollView.IndicatorStyle) -> Self {
        indicatorStyle = newValue
        return self
    }

    @available(iOS 11.1, *)
    @discardableResult
    func verticalScrollIndicatorInsets(_ newValue: UIEdgeInsets) -> Self {
        verticalScrollIndicatorInsets = newValue
        return self
    }

    @available(iOS 11.1, *)
    @discardableResult
    func horizontalScrollIndicatorInsets(_ newValue: UIEdgeInsets) -> Self {
        horizontalScrollIndicatorInsets = newValue
        return self
    }

    @discardableResult
    func scrollIndicatorInsets(_ newValue: UIEdgeInsets) -> Self {
        scrollIndicatorInsets = newValue
        return self
    }

    @available(iOS 3.0, *)
    @discardableResult
    func decelerationRate(_ newValue: UIScrollView.DecelerationRate) -> Self {
        decelerationRate = newValue
        return self
    }

    @discardableResult
    func indexDisplayMode(_ newValue: UIScrollView.IndexDisplayMode) -> Self {
        indexDisplayMode = newValue
        return self
    }

    @discardableResult
    func delaysContentTouches(_ newValue: Bool) -> Self {
        delaysContentTouches = newValue
        return self
    }

    @discardableResult
    func canCancelContentTouches(_ newValue: Bool) -> Self {
        canCancelContentTouches = newValue
        return self
    }

    @discardableResult
    func minimumZoomScale(_ newValue: CGFloat) -> Self {
        minimumZoomScale = newValue
        return self
    }

    @discardableResult
    func maximumZoomScale(_ newValue: CGFloat) -> Self {
        maximumZoomScale = newValue
        return self
    }

    @available(iOS 3.0, *)
    @discardableResult
    func zoomScale(_ newValue: CGFloat) -> Self {
        zoomScale = newValue
        return self
    }

    @discardableResult
    func bouncesZoom(_ newValue: Bool) -> Self {
        bouncesZoom = newValue
        return self
    }

    @discardableResult
    func scrollsToTop(_ newValue: Bool) -> Self {
        scrollsToTop = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func keyboardDismissMode(_ newValue: UIScrollView.KeyboardDismissMode) -> Self {
        keyboardDismissMode = newValue
        return self
    }

    @available(iOS 10.0, *)
    @discardableResult
    func refreshControl(_ newValue: UIRefreshControl?) -> Self {
        refreshControl = newValue
        return self
    }

}
