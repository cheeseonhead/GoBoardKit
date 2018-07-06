//
//  GoBoardScene.swift
//  GoBoardKit
//
//  Created by Cheese Onhead on 2018-07-05.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation
import SpriteKit

open class GoBoardScene: SKScene {
    
    open override func didMove(to view: SKView) {
        let size = view.bounds.size
        
        guard let texture = SKTexture.gridTexture(fittingSize: size, rows: 19, cols: 19) else { return }
        let node = SKSpriteNode(texture: texture, color: .red, size: texture.size())
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.position = CGPoint(x: 0, y: 0)
        addChild(node)
    }
    
}
