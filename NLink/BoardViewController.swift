//
//  BoardViewController.swift
//  NLink
//
//  Created by cicloon on 20/3/15.
//  Copyright (c) 2015 cicloon. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController, BoardViewDelegate {
    
    
    @IBOutlet weak var boardView: BoardView!{
        didSet{ boardView.dataSource = self  }
    }
    
    
    var board: Board{
        return Board(numRows: 10, numColumns: 10)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func boardColumnsForBoardView(sender: BoardView) -> Int {
        return board.numColumns
    }
    
    func boardRowsForBoardView(sender: BoardView) -> Int {
        return board.numRows
    }
    
    func updateUI(){
        boardView.setNeedsDisplay()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
