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
        super.didMove(to: view)
        scaleMode = .resizeFill
        
        let grid = SKSpriteNode.gridNode(fittingSize: size, rows: 19, cols: 19)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        grid.position = CGPoint(x: 0, y: 0)
        addChild(grid)
    }
}

extension SKSpriteNode {
    static func gridNode(fittingSize size: CGSize, rows: Int, cols: Int) -> SKSpriteNode {
        let textureSize = self.textureSize(fitting: size, rows: rows, cols: cols)
        let texture = SKTexture.gridTexture(fittingSize: textureSize, rows: rows, cols: cols)
        
        return SKSpriteNode(texture: texture, color: .red, size: texture.size())
    }
    
    private static func textureSize(fitting size: CGSize, rows: Int, cols: Int) -> CGSize {
        
        let rows = CGFloat(rows)
        let cols = CGFloat(cols)
        
        let availableWidth = size.width * (cols - 1) / cols
        let availableHeight = size.height * (rows - 1) / rows
        return CGSize(width: availableWidth, height: availableHeight)
    }
}
