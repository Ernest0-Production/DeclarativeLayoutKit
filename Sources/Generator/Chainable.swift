//
//  Chainable.swift
//  
//
//  Created by Ernest0N on 20.09.2020.
//

protocol Chainable {}

extension UIKit.UIView: Chainable {}
extension UIKit.UILabel: Chainable {}
extension UIKit.UIImageView: Chainable {}
extension UIKit.UIStackView: Chainable {}
extension UIKit.UIToolbar: Chainable {}
extension UIKit.UITabBar: Chainable {}

// MARK: UIScrollView

extension UIKit.UIScrollView: Chainable {}
extension UIKit.UITextView: Chainable {}
extension UIKit.UITableView: Chainable {}
extension UIKit.UICollectionView: Chainable {}


// MARK: UIControl

extension UIKit.UIControl: Chainable {}
extension UIKit.UITextField: Chainable {}
extension UIKit.UIButton: Chainable {}
extension UIKit.UISlider: Chainable {}
extension UIKit.UISwitch: Chainable {}
extension UIKit.UIPickerView: Chainable {}
extension UIKit.UIDatePicker: Chainable {}
extension UIKit.UIStepper: Chainable {}
extension UIKit.UIPageControl: Chainable {}
