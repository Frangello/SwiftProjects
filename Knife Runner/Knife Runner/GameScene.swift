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
    var count = 0
    
    var scoreLabel: SKLabelNode!
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
   
    override func didMove(to view: SKView) {
        self.addChild(floor)
        self.addChild(person)
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = "Score: 0"
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.position = CGPoint(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 50)
        self.addChild(scoreLabel)
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
        count += 1
        spawnKnife()
    }
    
    func spawnKnife(){
        if(count == 15){
            let knife = Knife(image: SKSpriteNode(imageNamed: "knife"))
            self.addChild(knife)
            count = 0
        }
    }
    
    //Deletes knifes after it contacted the floor
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == KnifeCategory) && (contact.bodyB.categoryBitMask == PersonCategory){
            score -= 10
        }
        else if(contact.bodyA.categoryBitMask == PersonCategory) && (contact.bodyB.categoryBitMask == KnifeCategory){
            score -= 10
        }
        
        if (contact.bodyA.categoryBitMask == KnifeCategory) && (contact.bodyB.categoryBitMask == FloorCategory){
            contact.bodyA.node?.removeFromParent()
            score += 1
        }
        else if(contact.bodyA.categoryBitMask == FloorCategory) && (contact.bodyB.categoryBitMask == KnifeCategory){
            contact.bodyB.node?.removeFromParent()
            score += 1
        }
    }
    
}
