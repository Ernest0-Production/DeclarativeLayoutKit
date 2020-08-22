//
//  File.swift
//  
//
//  Created by Бабаян Эрнест on 22.08.2020.
//

import UIKit


public extension UIScrollView {
    @discardableResult
    func contentInset(_ contentInset: UIEdgeInsets) -> Self {
        self.contentInset = contentInset
        
        return self
    }
    
    @discardableResult
    func contentSize(_ contentSize: CGSize) -> Self {
        self.contentSize = contentSize
        
        return self
    }
    
    @discardableResult
    func showsVerticalScrollIndicator(_ value: Bool) -> Self {
        self.showsVerticalScrollIndicator = value
        
        return self
    }
    
    @discardableResult
     func showsHorizontalScrollIndicator(_ value: Bool) -> Self {
         self.showsHorizontalScrollIndicator = value
         
         return self
     }
    
    @discardableResult
    func isDirectionalLockEnabled(_ isDirectionalLockEnabled: Bool) -> Self {
        self.isDirectionalLockEnabled = isDirectionalLockEnabled
        return self
    }
    
    @discardableResult
    func bounces(_ bounces: Bool) -> Self {
        self.bounces = bounces
        return self
    }
    
    @discardableResult
    func alwaysBounceVertical(_ alwaysBounceVertical: Bool) -> Self {
        self.alwaysBounceVertical = alwaysBounceVertical
        return self
    }
    
    @discardableResult
    func alwaysBounceHorizontal(_ alwaysBounceHorizontal: Bool) -> Self {
        self.alwaysBounceHorizontal = alwaysBounceHorizontal
        return self
    }
    
    @discardableResult
    func isPagingEnabled(_ isPagingEnabled: Bool) -> Self {
        self.isPagingEnabled = isPagingEnabled
        return self
    }
    
    @discardableResult
    func isScrollEnabled(_ isScrollEnabled: Bool) -> Self {
        self.isScrollEnabled = isScrollEnabled
        return self
    }
    
    @discardableResult
    func indicatorStyle(_ indicatorStyle: UIScrollView.IndicatorStyle) -> Self {
        self.indicatorStyle = indicatorStyle
        return self
    }
    
    @discardableResult
    func scrollIndicatorInsets(_ scrollIndicatorInsets: UIEdgeInsets) -> Self {
        self.scrollIndicatorInsets = scrollIndicatorInsets
        return self
    }
    
    @discardableResult
    func decelerationRate(_ decelerationRate: UIScrollView.DecelerationRate) -> Self {
        self.decelerationRate = decelerationRate
        return self
    }
    
    @discardableResult
    func indexDisplayMode(_ indexDisplayMode: UIScrollView.IndexDisplayMode) -> Self {
        self.indexDisplayMode = indexDisplayMode
        return self
    }
    
    @discardableResult
    func delaysContentTouches(_ delaysContentTouches: Bool) -> Self {
        self.delaysContentTouches = delaysContentTouches
        return self
    }
    
    @discardableResult
    func canCancelContentTouches(_ canCancelContentTouches: Bool) -> Self {
        self.canCancelContentTouches = canCancelContentTouches
        return self
    }
    
    @discardableResult
    func minimumZoomScale(_ minimumZoomScale: CGFloat) -> Self {
        self.minimumZoomScale = minimumZoomScale
        return self
    }
    
    @discardableResult
    func maximumZoomScale(_ maximumZoomScale: CGFloat) -> Self {
        self.maximumZoomScale = maximumZoomScale
        return self
    }
    
    @discardableResult
    func zoomScale(_ zoomScale: CGFloat, animated: Bool) -> Self {
        self.setZoomScale(zoomScale, animated: animated)
        return self
    }
    
    @discardableResult
    func bouncesZoom(_ bouncesZoom: Bool) -> Self {
        self.bouncesZoom = bouncesZoom
        return self
    }
    
    @discardableResult
    func scrollsToTop(_ scrollsToTop: Bool) -> Self {
        self.scrollsToTop = scrollsToTop
        return self
    }
    
    @discardableResult
    func keyboardDismissMode(_ keyboardDismissMode: UIScrollView.KeyboardDismissMode) -> Self {
        self.keyboardDismissMode = keyboardDismissMode
        return self
    }
    
    @discardableResult
    func refreshControl(_ refreshControl: UIRefreshControl?) -> Self {
        self.refreshControl = refreshControl
        return self
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
