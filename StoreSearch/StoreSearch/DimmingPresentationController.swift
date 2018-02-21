//
//  DimmingPresentationController.swift
//  StoreSearch
//
//  Created by Campbell Graham on 21/2/18.
//  Copyright © 2018 someIndustry. All rights reserved.
//

import UIKit

class DimmingPresentationController: UIPresentationController {
    
    lazy var dimmingView = GradientView(frame: CGRect.zero)
    
    override var shouldRemovePresentersView: Bool {
        return false
    }
    
    override func presentationTransitionWillBegin() {
        dimmingView.frame = containerView!.bounds
        containerView?.insertSubview(dimmingView, at: 0)
    }
}
