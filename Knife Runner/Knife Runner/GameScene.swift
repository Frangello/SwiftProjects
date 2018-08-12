//
//  GameScene.swift
//  Knife Runner
//
//  Created by Ligia Frangello on 8/12/18.
//  Copyright © 2018 Ligia Frangello. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let person = Person(image: SKSpriteNode(imageNamed: "coward"))
    let floor = Floor()
   
    override func didMove(to view: SKView) {
        self.addChild(floor)
        self.addChild(person)
    }
    
    override func sceneDidLoad() {
        //Delegates contact delegate to self so didBegin func works
        self.physicsWorld.contactDelegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.person.move(touchLocation: (touches.first?.location(in: self))!)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.person.move(touchLocation: (touches.first?.location(in: self))!)
    }
    
    override func update(_ currentTime: TimeInterval) {
        spawnKnife()
    }
    
    func spawnKnife(){
        let knife = Knife(image: SKSpriteNode(imageNamed: "knife"))
        self.addChild(knife)
    }
    
    //Deletes knifes after it contacted the floor
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == KnifeCategory) && (contact.bodyB.categoryBitMask == FloorCategory){
            contact.bodyA.node?.removeFromParent()
        }
        else if(contact.bodyA.categoryBitMask == FloorCategory) && (contact.bodyB.categoryBitMask == KnifeCategory){
            contact.bodyB.node?.removeFromParent()
        }
    }
    
}
