//
//  LayerBackground.swift
//  SG_Template
//
//  Created by Michael Kantor on 7/25/15.
//  Copyright (c) 2015 Neil North. All rights reserved.
//

import Foundation
import SpriteKit

class LayerBackground : Layer{
    
    
    
    override func updateNodes(delta: CFTimeInterval, childNumber: Int, childNode: SKNode)
    {

        
        if let node = childNode as? SKSpriteNode, name = node.name
        {
            if (node.position.x <= (-(node.size.width - 2)))
            {
                println("IT IS!")
                if let nodeB = childNodeWithName("B") where name == "A"
                {
                    println("IS A")
                    node.position = CGPoint(x: nodeB.position.x + node.size.width - 2 , y: node.position.y)
                }
                if let nodeA = childNodeWithName("A") where name == "B"
                {
                    println("IS B")
                    node.position = CGPoint(x: nodeA.position.x + node.size.width - 2 , y: node.position.y)
                    
                }
            }
        }
    }
}