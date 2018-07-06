//
//  SKTexture+Grid.swift
//  GoBoardKit
//
//  Created by Cheese Onhead on 2018-07-05.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation
import SpriteKit

private enum Style {
    static var lineWidth: CGFloat = 1.0
    
    static var offSet: CGFloat {
        return Style.lineWidth
    }
}

extension SKTexture {
    static func gridTexture(fittingSize: CGSize, rows: Int, cols: Int) -> SKTexture? {
        let spacing = minSpacing(for: fittingSize, rows: rows, cols: cols)
        let gridSize = size(for: spacing, rows: rows, cols: cols)
        
        // Add 1 to the height and width to ensure the borders are within the sprite
        UIGraphicsBeginImageContext(gridSize)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        let bezierPath = UIBezierPath()
        
        // Draw horizontal lines
        for i in 0 ... rows {
            let y = spacing * CGFloat(i) + Style.offSet
            bezierPath.move(to: CGPoint(x: 0, y: y))
            bezierPath.addLine(to: CGPoint(x: gridSize.width, y: y))
        }
        
        // Draw vertical lines
        for i in 0 ... cols {
            let x = spacing * CGFloat(i) + Style.offSet
            bezierPath.move(to: CGPoint(x: x, y: 0))
            bezierPath.addLine(to: CGPoint(x: x, y: gridSize.height))
        }
        
        SKColor.black.setStroke()
        bezierPath.lineWidth = Style.lineWidth
        bezierPath.stroke()
        context.addPath(bezierPath.cgPath)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return SKTexture(image: image!)
    }
    
    private class func minSpacing(for fittingSize: CGSize, rows: Int, cols: Int) -> CGFloat {
        // Calculate the spacing
        let horizontalSpacing = fittingSize.width / CGFloat(cols - 1)
        let verticalSpacing = fittingSize.height / CGFloat(rows - 1)
        
        return min(horizontalSpacing, verticalSpacing)
    }
    
    private class func size(for spacing: CGFloat, rows: Int, cols: Int) -> CGSize {
        let horizontalLength = spacing * CGFloat(cols - 1)
        let verticalLength = spacing * CGFloat(rows - 1)
        
        return CGSize(width: horizontalLength + 2 * Style.lineWidth, height: verticalLength + 2 * Style.lineWidth)
    }
}
