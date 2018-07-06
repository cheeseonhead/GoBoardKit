//
//  GridPositioner.swift
//  GoBoardKit
//
//  Created by Cheese Onhead on 2018-07-05.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

struct GridPositioner {
    let rows: Int
    let columns: Int
    
    func gridSize(fitting size: CGSize) -> CGSize {
        
        let rows = CGFloat(self.rows)
        let cols = CGFloat(self.columns)
        
        let availableWidth = size.width * (cols - 1) / cols
        let availableHeight = size.height * (rows - 1) / rows
        return CGSize(width: availableWidth, height: availableHeight)
    }
}
