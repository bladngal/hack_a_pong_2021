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
    private var scoreLeft : SKLabelNode?
    private var scoreRight : SKLabelNode?
    var leftScore = 0
    var rightScore = 0
    
    
    override func didMove(to view: SKView) {
        
        // Get nodes from scene and store it for use later
        self.paddleLeft = self.childNode(withName: "//paddleLeft") as? SKSpriteNode
        self.paddleRight = self.childNode(withName: "//paddleRight") as? SKSpriteNode
        self.scoreLeft = self.childNode(withName: "//scoreLeft") as? SKLabelNode
        self.scoreRight = self.childNode(withName: "//scoreRight") as? SKLabelNode
        
        self.ball = self.childNode(withName: "//ball") as? SKSpriteNode
        if let ball = self.ball {
            ball.physicsBody?.velocity = CGVector(dx: -700.0, dy: 400.0)
            
        }

    }
    
    
    func updateLeftScore() {
        scoreLeft?.text = "\(leftScore)"
    }
    
    func updateRightScore() {
        print("in updateRightScore()")
        scoreRight?.text = "\(rightScore)"
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
    
    
    // doesn't work yet
    func spawnBall() {
        //self.ball = self.childNode(withName: "//ball") as? SKSpriteNode
        if let ball = self.childNode(withName: "//ball") as? SKSpriteNode {
            ball.position = CGPoint(x: frame.midX, y: frame.midY)
            ball.physicsBody?.velocity = CGVector(dx: 700.0, dy: 400.0)
            
            //self.ball = ball
            addChild(ball)
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if let paddleLeft = self.paddleLeft {
            if let paddleRight = self.paddleRight {
                if let screenPosition = ball?.position.x {
                    let leftEdgePosition = paddleLeft.position.x - 20
                    let rightEdgePosition = paddleRight.position.x + 20
                
                    print("screenPosition: \(screenPosition)")
                    
                    if screenPosition < leftEdgePosition {
                        rightScore += 1
                        //rightScore = 6
                        print("rightScore: \(rightScore)")
                        updateRightScore()
                        //scoreRight?.text = "\(rightScore)"
                        ball?.removeFromParent()
                        ball = nil
                        spawnBall()
                    
                    } else if screenPosition > rightEdgePosition {
                        leftScore += 1
                        updateLeftScore()
                        ball?.removeFromParent()
                        ball = nil
                    }
                }
            }
        }
        
            
        
    }
}
