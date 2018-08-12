//
//  Coward.swift
//  Knife Runner
//
//  Created by Ligia Frangello on 8/12/18.
//  Copyright © 2018 Ligia Frangello. All rights reserved.
//

import Foundation
import SpriteKit

class Person : SKNode {
    
    init(image : SKSpriteNode){
        super.init()
        
        self.position = CGPoint(x: UIScreen.main.bounds.width/2, y: 50)
        self.xScale = 0.08
        self.yScale = 0.08
        
        //Add phyisics body to the node
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "coward"),
                                         size: CGSize(width: image.size.width * 0.08,
                                                      height: image.size.height * 0.08))
        
        self.physicsBody?.categoryBitMask = PersonCategory
        self.physicsBody?.contactTestBitMask = FloorCategory
        self.physicsBody?.collisionBitMask = FloorCategory
        
        self.physicsBody?.isDynamic = false
        
        //Add the image to the object
        self.addChild(image)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    func move(touchLocation : CGPoint) {
        if self.calculateAccumulatedFrame().contains(touchLocation){
            self.position.x = touchLocation.x
        }
    }
}
