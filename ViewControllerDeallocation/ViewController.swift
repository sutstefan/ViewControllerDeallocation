//
//  ViewController.swift
//  ViewControllerDeallocation
//
//  Created by Stefan Sut on 12/13/17.
//  Copyright © 2017 Stefan Sut. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        _checkDeallocation()
    }

}

