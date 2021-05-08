//
//  GameScene.swift
//  Hack_A_Pong
//
//  Created by Laura Maher on 5/8/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var paddleLeft : SKSpriteNode?
    private var paddleRight : SKSpriteNode?
    private var ball: SKSpriteNode?
    private var spinnyNode: SKShapeNode?
    var score = 0
    
    override func didMove(to view: SKView) {
        
        // Get nodes from scene and store it for use later
        self.paddleLeft = self.childNode(withName: "//paddleLeft") as? SKSpriteNode
        self.paddleRight = self.childNode(withName: "//paddleRight") as? SKSpriteNode
        self.ball = self.childNode(withName: "//ball") as? SKSpriteNode
        
//        let ball = SKSpriteNode(texture: SKTexture(imageNamed: "yarnBall"), size: CGSize(width: 40, height: 40))
//        ball.position = CGPoint(x: frame.midX, y: frame.midY)
//        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
//        addChild(ball)
        
        if let ball = self.ball {
            ball.physicsBody?.velocity = CGVector(dx: 700.0, dy: 400.0)
            
        }
        
      
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    //        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
    //            n.position = pos
    //            n.strokeColor = SKColor.blue
    //            self.addChild(n)
    //        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self))
            let firstTouch = touches.first
            let touchPosition = firstTouch?.location(in: self)
            
            self.paddleLeft?.position = CGPoint(x: CGFloat(self.paddleLeft?.position.x ?? 0), y: CGFloat(touchPosition?.y ?? 0))
        }
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
