//
//  Game.swift
//  NLink
//
//  Created by cicloon on 6/3/15.
//  Copyright (c) 2015 cicloon. All rights reserved.
//

import Foundation

class Game {
    
    private var players: [Player] = []
    private var turn: Int = 0
    private var linksToWin: Int
    var board: Board
    
    init(numPlayers: Int, boardSize: Int, linksToWin: Int){
        self.board = Board(numRows: boardSize, numColumns: boardSize)
        self.linksToWin = linksToWin
        
        for i in 1...numPlayers{
            self.players.append( Player(name: "Player \(i)") )
        }
    }
    
    func playerTurn() -> Player{
        return self.players[self.turn]
    }
    
    func playInColumn(column: Int){
        if let row = self.board.firstFreeRowInColumn(column) {
            println("The raw value of row is \(row)")
            self.board.setPosition( Board.Position(row: row, column: column), player: self.playerTurn() )
            self.nextTurn()
        }
    }
    
    func checkPlayerVictory(player: Player, row: Int, column: Int) -> Bool{
        return false
    }
    
    private func nextTurn(){
        if self.turn < self.players.count - 1{
            self.turn++
        }
        else{
            self.turn = 0
        }
    }
    
    
}