//
//  GoBoardScene.swift
//  GoBoardKit
//
//  Created by Cheese Onhead on 2018-07-05.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation
import SpriteKit

public class GoBoardScene: SKScene {
    
    // MARK: - Private SK
    private var grid: SKSpriteNode!
    
    // MARK: - Private properties
    private let positioner: GridPositioner
    
    public required init(rows: Int, columns: Int) {
        positioner = GridPositioner(rows: rows, columns: columns)
        super.init(size: CGSize(width: 2000, height: 2000))
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func didMove(to view: SKView) {
        super.didMove(to: view)
        scaleMode = .resizeFill
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        grid = SKSpriteNode.gridNode(size: positioner.gridSize(fitting: size), rows: positioner.rows, cols: positioner.columns)
        grid.position = CGPoint(x: 0, y: 0)
        addChild(grid)
        
        let test = SKShapeNode(circleOfRadius: 1)
        test.position = CGPoint.zero
        test.fillColor = .red
        grid.addChild(test)
    }
    
    open override func didChangeSize(_ oldSize: CGSize) {
        super.didChangeSize(oldSize)
        
        guard grid != nil else { return }
        
        grid.scale(to: positioner.gridSize(fitting: size))
    }
}

extension SKSpriteNode {
    static func gridNode(size: CGSize, rows: Int, cols: Int) -> SKSpriteNode {
        let texture = SKTexture.gridTexture(fittingSize: size, rows: rows, cols: cols)
        
        return SKSpriteNode(texture: texture, color: .red, size: texture.size())
    }
}
