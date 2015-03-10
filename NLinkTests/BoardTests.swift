//
//  BoardTests.swift
//  NLink
//
//  Created by cicloon on 6/3/15.
//  Copyright (c) 2015 cicloon. All rights reserved.
//

import UIKit
import XCTest

import NLink

class BoardTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBoardConstructor() {
        let board = Board(numRows: 5, numColumns: 5)
        XCTAssertNotNil(board, "should not be nil")
        
        let initialPosition = board.getPosition( Board.Position(row: 0, column: 0))!
        let lastPosition = board.getPosition( Board.Position(row: 4, column: 4))!
        
        XCTAssertTrue( initialPosition.isEmpty , "initial position should be empty")
        XCTAssertTrue( lastPosition.isEmpty  , "last position should be empty")
    }

    func testSetPosition(){
        let board = Board(numRows: 5, numColumns: 5)
        let player = Player(name: "testPlayer")
        
        board.setPosition(Board.Position(row: 1, column: 1), player: player)
        
        let positionType = board.getPosition( Board.Position(row: 1, column: 1))!
        
        XCTAssertTrue( checkPlayerOfPosition(positionType, player: player), "the player should be assigned to the specified position")
    }
    
    
    func testFirstFreeRowInColumn(colum: Int){
        let board = Board(numRows: 5, numColumns: 5)
        let player = Player(name: "testPlayer")
        
        board.setPosition(Board.Position(row: 0, column: 1), player: player )
        board.setPosition(Board.Position(row: 1, column: 1), player: player )
        board.setPosition(Board.Position(row: 0, column: 2), player: player)
        board.setPosition(Board.Position(row: 1, column: 2), player: player)
        board.setPosition(Board.Position(row: 2, column: 2), player: player )
        board.setPosition(Board.Position(row: 3, column: 2), player: player)
        board.setPosition(Board.Position(row: 4, column: 2), player: player)
        
        XCTAssertEqual(board.firstFreeRowInColumn(1)!, 2, "should be the third row")
        XCTAssertEqual(board.firstFreeRowInColumn(0)!, 0, "should be the first row")

        XCTAssertNil(board.firstFreeRowInColumn(2), "should be nil")
        XCTAssertEqual(board.firstFreeRowInColumn(2)!, 2, "should be the first row")
    }
    
    
    func testCheckLinkInPositionWithHorizontalLink(){
        let board = Board(numRows: 5, numColumns: 5)
        let player = Player(name: "testPlayer")
        
        board.setPosition(Board.Position(row: 0, column: 1), player: player)
        board.setPosition(Board.Position(row: 0, column: 2), player: player)
        board.setPosition(Board.Position(row: 0, column: 3), player: player)
        
        var victory = false
        
        victory = board.checkLinkInPosition(Board.Position(row: 0, column: 1), player: player, linksToWin: 3)
        
        XCTAssertTrue(victory, "the player should win checking the position 0, 1")

        victory = board.checkLinkInPosition(Board.Position(row: 0, column: 2), player: player, linksToWin: 3)
        
        XCTAssertTrue(victory, "the player should win checking the position 0, 2")
        
        victory = board.checkLinkInPosition(Board.Position(row: 0, column: 3), player: player, linksToWin: 3)
        
        XCTAssertTrue(victory, "the player should win checking the position 0, 3")
        
    }
    
    func testCheckLinkInPositionWithVerticalLink(){
        let board = Board(numRows: 5, numColumns: 5)
        let player = Player(name: "testPlayer")
        
        board.setPosition(Board.Position(row: 0, column: 1), player: player)
        board.setPosition(Board.Position(row: 1, column: 1), player: player)
        board.setPosition(Board.Position(row: 2, column: 1), player: player)
        
        var victory = false
        
        victory = board.checkLinkInPosition(Board.Position(row: 0, column: 1), player: player, linksToWin: 3)
        
        XCTAssertTrue(victory, "the player should win checking the position 0, 1")
        
        victory = board.checkLinkInPosition(Board.Position(row: 1, column: 1), player: player, linksToWin: 3)
        
        XCTAssertTrue(victory, "the player should win checking the position 1, 1")
        
        victory = board.checkLinkInPosition(Board.Position(row: 2, column: 1), player: player, linksToWin: 3)
        
        XCTAssertTrue(victory, "the player should win checking the position 2, 1")
    }
    
    func testCheckLinkInPositionWithFirstDiagonalLink(){
        let board = Board(numRows: 5, numColumns: 5)
        let player = Player(name: "testPlayer")
        
        board.setPosition(Board.Position(row: 0, column: 0), player: player)
        board.setPosition(Board.Position(row: 1, column: 1), player: player)
        board.setPosition(Board.Position(row: 2, column: 2), player: player)
        
        var victory = false
        
        victory = board.checkLinkInPosition(Board.Position(row: 0, column: 0), player: player, linksToWin: 3)
        
        XCTAssertTrue(victory, "the player should win checking the position 0, 0")
        
        victory = board.checkLinkInPosition(Board.Position(row: 1, column: 1), player: player, linksToWin: 3)
        
        XCTAssertTrue(victory, "the player should win checking the position 1, 1")
        
        victory = board.checkLinkInPosition(Board.Position(row: 2, column: 2), player: player, linksToWin: 3)
        
        XCTAssertTrue(victory, "the player should win checking the position 2, 2")
    }

    func testCheckLinkInPositionWithSecondDiagonalLink(){
        let board = Board(numRows: 5, numColumns: 5)
        let player = Player(name: "testPlayer")
        
        board.setPosition(Board.Position(row: 2, column: 0), player: player)
        board.setPosition(Board.Position(row: 1, column: 1), player: player)
        board.setPosition(Board.Position(row: 0, column: 2), player: player)
        
        var victory = false
        
        victory = board.checkLinkInPosition(Board.Position(row: 2, column: 0), player: player, linksToWin: 3)
        
        XCTAssertTrue(victory, "the player should win checking the position 2, 0")
        
        victory = board.checkLinkInPosition(Board.Position(row: 1, column: 1), player: player, linksToWin: 3)
        
        XCTAssertTrue(victory, "the player should win checking the position 1, 1")
        
        victory = board.checkLinkInPosition(Board.Position(row: 0, column: 2), player: player, linksToWin: 3)
        
        XCTAssertTrue(victory, "the player should win checking the position 0, 2")
    }
    
    
    private func checkPlayerOfPosition(position: Board.PositionType, player: Player) -> Bool {
        
        var isPlayer = false
        
        switch position{
        case .PlayerSlug(let enumPlayer):
            isPlayer = (enumPlayer.name == player.name)
        case .Empty:
            isPlayer = false
        }
        
        return isPlayer
    }
    
    
}

