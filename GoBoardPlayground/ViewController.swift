//
//  ViewController.swift
//  GoBoardPlayground
//
//  Created by Cheese Onhead on 2018-07-05.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import UIKit
import GoBoardKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        guard let view = view as? SKView else { return }
        
        let scene = GoBoardScene(size: view.bounds.size)
        
        view.presentScene(scene)
    }
}

