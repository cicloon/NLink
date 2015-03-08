//
//  GameTests.swift
//  NLink
//
//  Created by cicloon on 6/3/15.
//  Copyright (c) 2015 cicloon. All rights reserved.
//

import UIKit
import XCTest

import NLink

class GameTests: XCTestCase {
        
    func testGameConstructor(){
        let game = Game(numPlayers: 2, boardSize: 10, linksToWin: 3)
        XCTAssertNotNil(game, "should not be nil")
    }
    
    func testPlayerTurn(){
        let game = Game(numPlayers: 2, boardSize: 10, linksToWin: 3)
        let player = game.playerTurn()

        XCTAssertEqual(player.name, "Player 1", "should be equals")
        
    }
    
    func testPlayInColumn(){
        let game = Game(numPlayers: 2, boardSize: 10, linksToWin: 3)
        let player = game.playerTurn()
        
        game.playInColumn(2)
        let positionType = game.board.getPosition(Board.Position(row: 9, column: 2) )!
        let secondPlayer = game.playerTurn()
        
        XCTAssertTrue(checkPlayerOfPosition(positionType, player: player), "should be equals")
        XCTAssertEqual(secondPlayer.name, "Player 2", "the player should be Player 2")
    }

    func testCheckPlayerVictory(){
        let game = Game(numPlayers: 2, boardSize: 10, linksToWin: 3)
        let player = game.playerTurn()
        
//        game.board.setPosition(player, row: 9, column: 0)
//        game.board.setPosition(player, row: 9, column: 1)
//        game.board.setPosition(player, row: 9, column: 2)
//        
//        XCTassertTrue( game.checkPlayerVictory(player, row: 9, column: 2), "the player should win in this position")
//
//        XCTassertTrue( game.checkPlayerVictory(player, row: 9, column: 1), "the player should win in this position")
//        
//        XCTassertTrue( game.checkPlayerVictory(player, row: 9, column: 0), "the player should win in this position")
    }
    
    private func checkPlayerOfPosition(positionType: Board.PositionType, player: Player) -> Bool {
        
        var isPlayer = false
        
        switch positionType{
        case .PlayerSlug(let enumPlayer):
            isPlayer = (enumPlayer.name == player.name)
        case .Empty:
            isPlayer = false
        }
        
        return isPlayer
    }
    
    
}
