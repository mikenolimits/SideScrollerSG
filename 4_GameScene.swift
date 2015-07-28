//
//  4_GameScene.swift
//  SG_Template
//
//  Created by Michael Kantor on 7/21/15.
//  Copyright (c) 2015 Neil North. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene : SGScene{
    
    let user         : User   = Container.App.get("User") as! User
    //let background            = SKSpriteNode(imageNamed: "BG")
    
    
    var layerBackground01Static = SKNode()
    var layerBackground02Slow   = LayerBackground()
    var layerBackground03Fast   = LayerBackground()
    var layerGameWorld : SKNode?
    
    
    override func didMoveToView(view: SKView)
    {
        assignLayers()
        setupLayers()
    }
    
    func assignLayers()
    {
        addChild(layerBackground01Static)
        addChild(layerBackground02Slow)
        layerBackground02Slow.layerVelocity = CGPoint(x: -50.00, y: 0)
        addChild(layerBackground03Fast)

        layerBackground03Fast.layerVelocity = CGPoint(x: -100.00, y: 0.0)
        
    }
    
    func setupLayers()
    {
        
        //Static BG
        let background = SKSpriteNode(imageNamed: "BG001")
        background.posByCanvas(0.5, y: 0.5)
        background.zPosition = -1
        
        
        //Slow Trees
        
        let background2 = SKSpriteNode(imageNamed: "BG002")
        background2.posByCanvas(0.0, y: 0.0)
        background2.anchorPoint = CGPointZero
        background2.zPosition   = 1
        background2.name        = "A"

        
        let background3 = SKSpriteNode(imageNamed: "BG002")
        
        background2.posByCanvas(1.0, y: 0.0)
        background2.anchorPoint = CGPointZero
        background2.zPosition   = 1
        background2.name        = "B"
    
        
        //Fast Layers
        
        let background4         = SKSpriteNode(imageNamed: "BG003")
        background4.position    = CGPoint(x: 0.0, y: 0.0)
        background4.anchorPoint = CGPointZero
        background4.zPosition   = 2
        background4.name        = "A"
        
        let background5         = SKSpriteNode(imageNamed: "BG003")
        background4.position    = CGPoint(x: background4.size.width, y: 0.0)
        background4.anchorPoint = CGPointZero
        background4.zPosition   = 2
        background4.name        = "B"
        
        
        layerBackground01Static.addChild(background)
        layerBackground02Slow.addChild(background2)
        layerBackground02Slow.addChild(background3)
        layerBackground03Fast.addChild(background4)
        layerBackground03Fast.addChild(background5)
        
    }
    
    
    
    
    //Screen Stuff
    
    override func screenInteractionStarted(location: CGPoint) {
        
    }
    
    override func screenInteractionMoved(location: CGPoint) {
        
    }
    
    override func screenInteractionEnded(location: CGPoint) {
        
    }
    
    #if !os(iOS)
    
    override func handleKeyEvent(event : NSEvent, keyDown : Bool)
    {
        
        
    }
    
    #endif
    
    
    override func update(currentTime: NSTimeInterval)
    {
        if (user.lastUpdateTime > 0)
        {
            user.dt = currentTime - user.lastUpdateTime
        }
        else
        {
            user.dt = 0
        }
        user.lastUpdateTime = currentTime
        
        if(user.gameState == .gameActive)
        {
            //println(user.dt)
            
            layerBackground02Slow.update(user.dt, affectAllNodes: true, parallax: true)
            
            layerBackground03Fast.update(user.dt, affectAllNodes: true, parallax: true)
        }
        else
        {
            println("not set to active")
        }
    }
    
    
    func didBeginContact(delegate : SKPhysicsContact)
    {
        
    }
    
    func didEndContact(delegate : SKPhysicsContact)
    {
        
    }


    
}