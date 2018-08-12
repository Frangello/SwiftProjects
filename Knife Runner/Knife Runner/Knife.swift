//
//  Knife.swift
//  Knife Runner
//
//  Created by Ligia Frangello on 8/12/18.
//  Copyright © 2018 Ligia Frangello. All rights reserved.
//

import Foundation
import SpriteKit

class Knife : SKNode {
    
    init(image : SKSpriteNode){
        super.init()
        
        //Decide which side of the x axis the knife will spawn
        let randomNumber = arc4random_uniform(2)
        let x: CGFloat = randomNumber == 0 ? 1 : -1
        
        //Decide where knife will spawn
        self.position = CGPoint(x: (CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width))) * x),
                                y: UIScreen.main.bounds.height)
        
        //Set the size of the node, match size of the physics body
        self.setScale(0.3)
        
        //Add phyisics body to the node
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "knife"),
                                         size: CGSize(width: image.size.width * 0.3,
                                                      height: image.size.height * 0.3))
        
        self.physicsBody?.categoryBitMask = KnifeCategory
        self.physicsBody?.contactTestBitMask = FloorCategory
        self.physicsBody?.collisionBitMask = PersonCategory
        
        //Adjusts how fast the object fall
        self.physicsBody?.linearDamping = 5
        //Adjusts how bouncy the object is
        self.physicsBody?.restitution = 0
        
        //Add the image to the object
        self.addChild(image)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}
