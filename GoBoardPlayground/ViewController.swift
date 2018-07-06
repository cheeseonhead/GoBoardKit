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

    @IBOutlet weak var sceneView: SKView!
    
    override func viewDidLoad() {
        let scene = GoBoardScene(size: view.bounds.size)
        
        sceneView.presentScene(scene)
    }
}

