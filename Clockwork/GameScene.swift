//
//  GameScene.swift
//  Clockwork
//
//  Created by user142691 on 7/31/18.
//  Copyright © 2018 user142691. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label2 : SKLabelNode?
    private var label3 : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        self.label2 = SKLabelNode(text: "New Game")
        self.label3 = SKLabelNode(text: "Load Game")
        if let label2 = self.label2 {
            label2.color = SKColor.blue
            label2.alpha = 0.0
            label2.run(SKAction.fadeIn(withDuration: 1.5))
            label2.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
            self.addChild(label2)
        }
        let label3 =  self.label3
        label3?.color = .purple
        label3?.alpha = 0.0
        label3?.run(SKAction.fadeIn(withDuration: 1.5))
        label3?.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 1.7)
        self.addChild((label3)!)
        
        
    }
    
    func animatePlayer(player : SKSpriteNode, ss : SpriteSheet) {
        
        var walkforward : [SKTexture] = []
        
        walkforward.append(ss.getSpriteTexture(col: 0,
                                               row: 4)!)
        walkforward.append(ss.getSpriteTexture(col: 1,
                                               row: 4)!)
        
        player.run(.scale(to: 1.3, duration: 0.1))
        
        player.run(.repeatForever(.sequence([.animate(with: walkforward,
            timePerFrame: 0.5), .scale(to: 1.7, duration: 0.2)])))
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        if let label2 = self.label2 {
            
            label2.run(.sequence([.wait(forDuration: 1.0),
                                .fadeOut(withDuration: 1.0)]))
            
            label3?.run(.fadeOut(withDuration: 1.3))
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
}
