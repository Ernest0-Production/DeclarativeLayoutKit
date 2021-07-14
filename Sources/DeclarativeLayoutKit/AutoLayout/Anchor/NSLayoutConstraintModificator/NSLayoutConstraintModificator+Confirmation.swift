//
//  File.swift
//  
//
//  Created by Ernest Babayan on 11.07.2021.
//

import UIKit


//extension NSLayoutXAxisAnchor: NSLayoutConstraintModificatorConvertible {
//    public func asNSLayoutConstraintModificator() -> NSLayoutConstraintModificator<HorizontalRelativeAutoLayoutAnchor> {
//        NSLayoutConstraintModificator(model: HorizontalRelativeAutoLayoutAnchor(target: self))
//    }
//}
//
//extension NSLayoutYAxisAnchor: NSLayoutConstraintModificatorConvertible {
//    public func asNSLayoutConstraintModificator() -> NSLayoutConstraintModificator<VerticalRelativeAutoLayoutAnchor> {
//        NSLayoutConstraintModificator(model: VerticalRelativeAutoLayoutAnchor(target: self))
//    }
//}
//
//extension NSLayoutDimension: NSLayoutConstraintModificatorConvertible {
//    public func asNSLayoutConstraintModificator() -> NSLayoutConstraintModificator<DimensionAutoLayoutAnchor> {
//        NSLayoutConstraintModificator(model: DimensionAutoLayoutAnchor(target: self))
//    }
//}
//
//extension RelativeAutoLayoutAnchor: NSLayoutConstraintModificatorConvertible {}
//
//extension DimensionAutoLayoutAnchor: NSLayoutConstraintModificatorConvertible {}
//
//extension ConstantDimensionAutoLayoutAnchor: NSLayoutConstraintModificatorConvertible {}
//
//extension SelfRelatedAutoLayoutAnchor: NSLayoutConstraintModificatorConvertible {}
//
//public extension NSLayoutConstraintModificator {
//    static func to<TargetType, AnchorType>(
//        _ targetPath: @escaping SelfRelatedAutoLayoutAnchor<TargetType, AnchorType>.TargetPath
//    ) -> NSLayoutConstraintModificator<SelfRelatedAutoLayoutAnchor<TargetType, AnchorType>> {
//        NSLayoutConstraintModificator<SelfRelatedAutoLayoutAnchor<TargetType, AnchorType>>(
//            model: SelfRelatedAutoLayoutAnchor<TargetType, AnchorType>.to(targetPath)
//        )
//    }
//}
