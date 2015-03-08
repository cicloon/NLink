//
//  PlayerTests.swift
//  NLink
//
//  Created by cicloon on 6/3/15.
//  Copyright (c) 2015 cicloon. All rights reserved.
//


import UIKit
import XCTest

import NLink

class PlayerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPlayerConstructor() {
        let player = Player(name: "test player")
        XCTAssertEqual(player.name,"test player")
    }
    
}
