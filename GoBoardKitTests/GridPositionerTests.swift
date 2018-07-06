//
//  GridPositionerTests.swift
//  GoBoardKitTests
//
//  Created by Cheese Onhead on 2018-07-05.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import XCTest
@testable import GoBoardKit

class GridPositionerTests: XCTestCase {
    
    var sut: GridPositioner!
    
    override func setUp() {
        super.setUp()
        
        sut = GridPositioner(rows: 10, columns: 5)
    }
    
    func testCorrectSize() {
        let fittingSize = CGSize(width: 200, height: 100)
        
        let result = sut.gridSize(fitting: fittingSize)
        XCTAssertEqual(result.width, 200 * 4 / 5)
        XCTAssertEqual(result.height, 100 * 9 / 10)
    }
}
