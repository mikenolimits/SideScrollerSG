import SpriteKit

class Layer: SKNode {
    
    var layerVelocity = CGPointZero
    
    //MARK: Loop
    func update(delta:CFTimeInterval,affectAllNodes:Bool,parallax:Bool) {
        
        if affectAllNodes {
            updateLayer(delta)
            for (childNumber, child) in enumerate(children) {
                if parallax {
                    updateNodesParallax(delta, childNumber: childNumber, childNode: child as! SKNode)
                } else {
                    updateNodes(delta, childNumber: childNumber,childNode: child as! SKNode)
                }
            }
        } else {
            updateLayer(delta)
        }
    }
    
    func updateNodes(delta:CFTimeInterval,childNumber:Int,childNode:SKNode) {
        
        // Overridden by subclasses
        
    }
    
    func updateNodesParallax(delta:CFTimeInterval,childNumber:Int,childNode:SKNode) {
        var offset = layerVelocity * CGFloat(delta)
        childNode.position += offset
        updateNodes(delta, childNumber: childNumber, childNode: childNode)
    }
    
    func updateLayer(delta:CFTimeInterval) {
        
        // Overridden by subclasses
        
    }
    
    
}
