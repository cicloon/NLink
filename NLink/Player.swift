//
//  Player.swift
//  NLink
//
//  Created by cicloon on 2/3/15.
//  Copyright (c) 2015 cicloon. All rights reserved.
//

import Foundation

class Player {
    
    var name = "Undefined"
    private var color = ""
    
    init(name: String){
        self.name = name
        
    }
 
    func getName() -> String{
        return self.name
    }
    
    
}