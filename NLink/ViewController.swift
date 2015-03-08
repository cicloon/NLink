//
//  ViewController.swift
//  NLink
//
//  Created by cicloon on 28/2/15.
//  Copyright (c) 2015 cicloon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func boardStart(sender: AnyObject) {
        var board = Board(numRows: 5, numColumns: 5)
        
    }
}

