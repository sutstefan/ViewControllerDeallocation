//
//  UIViewController+DeallocationCheck.swift
//  ViewControllerDeallocation
//
//  Created by Stefan Sut on 12/13/17.
//  Copyright © 2017 Stefan Sut. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public func _checkDeallocation(after delay: TimeInterval = 2.0) {
        let rootParentViewController = _rootParentViewController
        
        if isMovingFromParentViewController || rootParentViewController.isBeingDismissed {
            let selfType = type(of: self)
            let disappearance = isMovingFromParentViewController ? "removed from its parent" : "dismissed"
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: { [weak self] in
                assert(self == nil, "\(selfType) not deallocated after being \(disappearance)")
            })
        }
    }
    
    private var _rootParentViewController: UIViewController {
        var root = self
        while let parent = root.parent { root = parent }
        return root
    }
    
}
