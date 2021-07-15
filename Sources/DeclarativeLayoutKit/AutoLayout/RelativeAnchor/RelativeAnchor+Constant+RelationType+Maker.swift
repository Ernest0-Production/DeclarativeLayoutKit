//
//  File.swift
//  
//
//  Created by Ernest Babayan on 14.07.2021.
//

import UIKit


public extension AfterBuildModificator where Model == NSLayoutXAxisAnchor, Result == NSLayoutConstraint {
    var orLess: AfterBuildModificator<WithCustomRelationType<NSLayoutXAxisAnchor>, NSLayoutConstraint> {
        self.map(\.orLess)
    }
    
    var orGreater: AfterBuildModificator<WithCustomRelationType<NSLayoutXAxisAnchor>, NSLayoutConstraint> {
        self.map(\.orGreater)
    }
}

public extension AfterBuildModificator where Model == NSLayoutYAxisAnchor, Result == NSLayoutConstraint {
    var orLess: AfterBuildModificator<WithCustomRelationType<NSLayoutYAxisAnchor>, NSLayoutConstraint> {
        self.map(\.orLess)
    }
    
    var orGreater: AfterBuildModificator<WithCustomRelationType<NSLayoutYAxisAnchor>, NSLayoutConstraint> {
        self.map(\.orGreater)
    }
}

public extension AutoLayoutItemConvertible {
    func leftAnchor(_ secondAnchorModificator: AfterBuildModificator<WithCustomRelationType<NSLayoutXAxisAnchor>, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAcnhor: WithCustomRelationType<NSLayoutXAxisAnchor>) in
                makeRelativeConstraint(firstAnchor: view.leftAnchor, secondAnchor: secondAcnhor)
            })
        })
    }
    
    func rightAnchor(_ secondAnchorModificator: AfterBuildModificator<WithCustomRelationType<NSLayoutXAxisAnchor>, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAcnhor: WithCustomRelationType<NSLayoutXAxisAnchor>) in
                makeRelativeConstraint(firstAnchor: view.rightAnchor, secondAnchor: secondAcnhor)
            })
        })
    }

    func leadingAnchor(_ secondAnchorModificator: AfterBuildModificator<WithCustomRelationType<NSLayoutXAxisAnchor>, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAcnhor: WithCustomRelationType<NSLayoutXAxisAnchor>) in
                makeRelativeConstraint(firstAnchor: view.leadingAnchor, secondAnchor: secondAcnhor)
            })
        })
    }

    func trailingAnchor(_ secondAnchorModificator: AfterBuildModificator<WithCustomRelationType<NSLayoutXAxisAnchor>, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAcnhor: WithCustomRelationType<NSLayoutXAxisAnchor>) in
                makeRelativeConstraint(firstAnchor: view.trailingAnchor, secondAnchor: secondAcnhor)
            })
        })
    }

    func topAnchor(_ secondAnchorModificator: AfterBuildModificator<WithCustomRelationType<NSLayoutYAxisAnchor>, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAcnhor: WithCustomRelationType<NSLayoutYAxisAnchor>) in
                makeRelativeConstraint(firstAnchor: view.topAnchor, secondAnchor: secondAcnhor)
            })
        })
    }

    func bottomAnchor(_ secondAnchorModificator: AfterBuildModificator<WithCustomRelationType<NSLayoutYAxisAnchor>, NSLayoutConstraint>) -> AutoLayoutItem {
        asAutoLayoutItem().layout({ (view: UIView) in
            secondAnchorModificator.build({ (secondAcnhor: WithCustomRelationType<NSLayoutYAxisAnchor>) in
                makeRelativeConstraint(firstAnchor: view.bottomAnchor, secondAnchor: secondAcnhor)
            })
        })
    }
}
