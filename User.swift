//
//  User.swift
//  SG_Template
//
//  Created by Michael Kantor on 7/24/15.
//  Copyright (c) 2015 Neil North. All rights reserved.
//

import Foundation


class User
{
    var currentLevel   : String?
    var gameState      : GameState
    var lastUpdateTime : NSTimeInterval
    var dt             : NSTimeInterval
    
    func setLevel(level : String)
    {
        self.currentLevel = level
    }
    
    init()
    {
        self.gameState      = .gameActive
        self.lastUpdateTime = 0
        self.dt             = 0
    }
    
}