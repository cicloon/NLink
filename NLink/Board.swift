//
//  Board.swift
//  NLink
//
//  Created by cicloon on 2/3/15.
//  Copyright (c) 2015 cicloon. All rights reserved.
//

import Foundation

class Board {
    
    enum PositionType {
        case PlayerSlug(Player)
        case Empty()
        
        var isEmpty: Bool{
            get{
                var isEmpty = false
                switch self{
                    case .PlayerSlug: isEmpty =  false
                    case .Empty: isEmpty = true
                }
                return isEmpty
            }
        }
    }
    
    struct Position {
        let row: Int
        let column: Int
        
        func newPositionFromDirection(dir: Direction) -> Position{
            let newRow = self.row + dir.vertical
            let newColumn = self.column + dir.horizontal
            return Position(row: newRow, column: newColumn)
        }
    }
    

    struct Direction{
        let horizontal: Int
        let vertical: Int
        
        func getAllDirections() -> [Direction]{
            var directions = [Direction]()
            
            for i in -1...1{
                for j in -1...1{
                    directions.append( Direction(horizontal: i, vertical: j) )
                }
            }
            return directions
        }
    }
    
    
    var numColumns = 10
    var numRows = 10
    
    private var positions: [ [PositionType] ]
    

    
    init(numRows: Int, numColumns: Int){
        self.numRows = numRows
        self.numColumns = numColumns
        
        self.positions = [[PositionType]](count: self.numRows, repeatedValue:
            [PositionType](count: self.numColumns, repeatedValue: PositionType.Empty()  )
        )
        println("initialized board")
    }
    
    func setPosition(position: Position,  player: Player){
        if position.row >= 0 && position.row < self.numRows && position.column >= 0 && position.column < self.numColumns{
            
            self.positions[position.row][position.column] = PositionType.PlayerSlug(player)
        }
    }
    
    func getPosition(position: Position) -> PositionType? {
        if position.row < self.numColumns && position.column < self.numRows {
            return self.positions[position.row][position.column]
        }
        else {
            return nil
        }
    }
    
    func firstFreeRowInColumn(column: Int) -> Int? {        
        var i = numRows
        while( i >= 0){
            i--
            var positionType = self.getPosition( Position(row: i, column: column))!
            if (positionType.isEmpty) {
                return i
            }
        }
        return nil
    }
    
    func checkLinkInPosition(position: Position, player: Player, linksToWin: Int) -> Bool{
        return false        
    }
    
    private func linksInDirection(dir: Direction, position: Position, player: Player) -> Int{
    
//        if let position = getPosition(row, column: column){
//            switch position{
//            case .PlayerSlug(let positionPlayer) {
//                if positionPlayer == player {
//                    return 1 +
//                }
//            }
//                
//                case .Empty()
//            }
//        }
        return 0
    }
    
    

}
