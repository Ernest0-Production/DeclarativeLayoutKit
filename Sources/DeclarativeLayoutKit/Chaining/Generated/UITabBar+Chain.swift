// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public extension UITabBar {
    @discardableResult
    func delegate(_ newValue: UITabBarDelegate?) -> Self {
        delegate = newValue
        return self
    }

    @discardableResult
    func items(_ newValue: [UITabBarItem]?) -> Self {
        items = newValue
        return self
    }

    @discardableResult
    func selectedItem(_ newValue: UITabBarItem?) -> Self {
        selectedItem = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func barTintColor(_ newValue: UIColor?) -> Self {
        barTintColor = newValue
        return self
    }

    @available(iOS 10.0, *)
    @discardableResult
    func unselectedItemTintColor(_ newValue: UIColor?) -> Self {
        unselectedItemTintColor = newValue
        return self
    }

    @available(iOS, introduced: 5.0, deprecated: 8.0)
    @discardableResult
    func selectedImageTintColor(_ newValue: UIColor?) -> Self {
        selectedImageTintColor = newValue
        return self
    }

    @available(iOS 5.0, *)
    @discardableResult
    func backgroundImage(_ newValue: UIImage?) -> Self {
        backgroundImage = newValue
        return self
    }

    @available(iOS 5.0, *)
    @discardableResult
    func selectionIndicatorImage(_ newValue: UIImage?) -> Self {
        selectionIndicatorImage = newValue
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func shadowImage(_ newValue: UIImage?) -> Self {
        shadowImage = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func itemPositioning(_ newValue: UITabBar.ItemPositioning) -> Self {
        itemPositioning = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func itemWidth(_ newValue: CGFloat) -> Self {
        itemWidth = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func itemSpacing(_ newValue: CGFloat) -> Self {
        itemSpacing = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func barStyle(_ newValue: UIBarStyle) -> Self {
        barStyle = newValue
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func isTranslucent(_ newValue: Bool) -> Self {
        isTranslucent = newValue
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func standardAppearance(_ newValue: UITabBarAppearance) -> Self {
        standardAppearance = newValue
        return self
    }

}
