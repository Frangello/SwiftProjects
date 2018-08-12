//
//  Floor.swift
//  Knife Runner
//
//  Created by Ligia Frangello on 8/12/18.
//  Copyright © 2018 Ligia Frangello. All rights reserved.
//

import Foundation
import SpriteKit

class Floor : SKNode {
    
    override init(){
        super.init()
        
        self.position = CGPoint(x: 0, y: 0)
        
        //Add phyisics body to the node
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: UIScreen.main.bounds.width * 2, height: 10))
        
        self.physicsBody?.categoryBitMask = FloorCategory
        self.physicsBody?.contactTestBitMask = KnifeCategory
        self.physicsBody?.collisionBitMask = PersonCategory
        
        self.physicsBody?.isDynamic = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }

}
