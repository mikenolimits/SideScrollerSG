//
//  1_MainMenu.swift
//  SG_Template
//
//  Created by Michael Kantor on 7/21/15.
//  Copyright (c) 2015 Neil North. All rights reserved.
//

import Foundation

import SpriteKit

#if !os(iOS)
   import AppKit
#endif

class MainMenu : SGScene
{
    let label       = SKLabelNode(fontNamed: "MarketFelt-Wide")
    let background  = SKSpriteNode(imageNamed: "BG")
    let exitBtn     = SKLabelNode(fontNamed: "MarketFelt-Wide")
    let title       = SKSpriteNode(imageNamed: "TOTSG01")
    let user        : User   = Container.App.get("User") as! User
    
    override func didMoveToView(view: SKView)
    {
        user.currentLevel    = "Main Menu"
        
        background.posByCanvas(0.5, y: 0.5)
        background.xScale    = 1.2
        background.yScale    = 1.2
        background.zPosition = -1
        
    
        label.posByScreen(0.5, y: 0.3)
        label.text      = "PLAY"
        label.fontSize  = 56
        label.fontColor = SKColor.whiteColor()
        label.name      = "playGame"
        label.zPosition = 10
        label.color     = SKColor.blueColor()
        
        
        title.posByCanvas(0.5, y: 1.5)
        title.xScale    = 0.5
        title.yScale    = 0.5
        title.zPosition = 15
        title.runAction(SKAction.moveTo(CGPoint(screenX: 0.5, screenY: 0.7), duration: 1.2))

        
        
        addChild(background)
        addChild(label)
        addChild(title)
        
        #if !os(iOS)
            exitBtn.posByScreen(0.5, y: 0.1)
            exitBtn.fontSize = 56
            exitBtn.text     = "Exit"
            exitBtn.fontColor = SKColor.whiteColor()
            exitBtn.zPosition = 10
            exitBtn.name      = "exitGame"
            addChild(exitBtn)
        #endif
        
    }
    
    override func screenInteractionStarted(location: CGPoint) {
        for node in nodesAtPoint(location)
        {
            if node.isKindOfClass(SKNode)
            {
                let possibleButton = node as! SKNode
                
                if (possibleButton.name == "playGame")
                {
                    label.text = "Loading...."
                    
                    let playGame = GameScene(size : scene!.size)
                    playGame.scaleMode = scaleMode
                    let transition = SKTransition.fadeWithDuration(0.6)
                    view?.presentScene(playGame,transition : transition)
                    
                }
                    
                else if (possibleButton.name == "exitGame")
                {
                    #if !os(iOS)
                        
                    NSApplication.sharedApplication().terminate(self)
                        
                    #endif
                }
                
            }
        }
    }
}