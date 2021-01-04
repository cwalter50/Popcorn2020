//
//  GameScene.swift
//  Popcorn
//
//  Created by  on 5/3/19.
//  Copyright © 2019 WikipetersonApps. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var popCornSprite : SKSpriteNode?
    var randomVector : CGVector?
    
    override func didMove(to view: SKView)
    {
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.isDynamic = true
        
        randomVector = CGVector(dx: Int(arc4random_uniform(200)), dy: Int(arc4random_uniform(200)))
        addPopCorn(location: CGPoint(x: 120, y: 120))
        addPopCorn(location: CGPoint(x: 250, y: 290))
        
        physicsBody?.categoryBitMask = 4
        
        
        physicsWorld.contactDelegate = self
    }
    
    var count = 0
    func didEnd(_ contact: SKPhysicsContact) {
        print("contact")
        
        if count < 50
        {
            
            count = count + 1
            addPopCorn(location: contact.contactPoint)
        }

        
    }
    
    func addPopCorn(location : CGPoint)
    {
        popCornSprite = SKSpriteNode(imageNamed: "popcorn1")
        popCornSprite!.size = CGSize(width: 50, height: 50)
        popCornSprite?.position = location
        addChild(popCornSprite!)
        
        popCornSprite?.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        popCornSprite?.physicsBody?.isDynamic = true
        popCornSprite?.physicsBody?.restitution = 1.1
        popCornSprite?.physicsBody?.allowsRotation = true
        popCornSprite?.physicsBody?.applyAngularImpulse(2)
        popCornSprite?.physicsBody?.applyForce(randomVector!)
        
        popCornSprite?.physicsBody?.categoryBitMask = 3
        popCornSprite?.physicsBody?.contactTestBitMask = 3
    }
    

}
