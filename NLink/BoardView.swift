//
//  BoardView.swift
//  NLink
//
//  Created by cicloon on 20/3/15.
//  Copyright (c) 2015 cicloon. All rights reserved.
//

import UIKit

protocol BoardViewDelegate: class {
    func boardRowsForBoardView(sender: BoardView) -> Int
    func boardColumnsForBoardView(sender: BoardView) -> Int
}


@IBDesignable
class BoardView: UIView {

    @IBInspectable
    var numColumns: Int = 10 {
        didSet { setNeedsDisplay() }
    }
    
    @IBInspectable
    var numRows: Int = 10 {
        didSet { setNeedsDisplay() }
    }
    
//    init(numRows: Int, numColumns: Int){
//        self.numRows = numRows
//        self.numColumns = numColumns
//        super.init()
//    }
//
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    weak var dataSource: BoardViewDelegate?
    
    override func drawRect(rect: CGRect) {
        drawGrid()
    }
    
    private func drawGrid(){
        println("\(bounds.width) \(bounds.height)")
        
        var numColumns = dataSource?.boardColumnsForBoardView(self) ?? 10
        var numRows = dataSource?.boardRowsForBoardView(self) ?? 10
        
        let positionWidth = bounds.width / CGFloat(numColumns)
        let positionHeight = bounds.height / CGFloat(numRows)
        
        println("\(positionWidth) \(positionHeight)")
        
        let yInit = bounds.origin.y
        let yEnd = bounds.origin.y + bounds.height
        
        let xInit = bounds.origin.x
        let xEnd = bounds.origin.x + bounds.width
        
        println("\(yInit) \(yEnd)")
        
        
        var verticalXPosition = positionWidth
        var path = UIBezierPath()
        for i in 1...numColumns-1{
            path.moveToPoint(CGPoint(x: verticalXPosition, y: yInit))
            path.addLineToPoint(CGPoint(x:verticalXPosition, y: yEnd))
            verticalXPosition += positionWidth
        }
        
        var horizontalYPosition = positionHeight
        for i in 1...numRows-1{
            path.moveToPoint(CGPoint(x: xInit, y: horizontalYPosition))
            path.addLineToPoint(CGPoint(x: xEnd, y: horizontalYPosition))
            horizontalYPosition += positionHeight
        }
        
        
        UIColor.blackColor().setStroke()
        
        path.stroke()
    }


}
