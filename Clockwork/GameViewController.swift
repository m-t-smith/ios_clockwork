//
//  GameViewController.swift
//  Clockwork
//
//  Created by user142691 on 7/31/18.
//  Copyright © 2018 user142691. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view = SKView()
        
        var skView: SKView {
            return view as! SKView
        }
        
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        let myWidth: CGFloat =  UIScreen.main.bounds.width
        let myHeight: CGFloat = UIScreen.main.bounds.height
        let mySize = CGSize(width: myWidth,
                            height: myHeight)
        let myFontSize: CGFloat = 50
        let sstext = SKTexture(imageNamed: "spritesheet4")
        
        let scene = GameScene(size: mySize)
        
        let ss = SpriteSheet(texture: sstext, row: 4, col: 8)
        
        
        let label = SKLabelNode(fontNamed: "AmericanTypewriter-CondensedLight")
        label.text = "Clockwork Labyrinth"
        label.color = SKColor.white
        label.colorBlendFactor = 1.0
        label.fontSize = myFontSize
        label.position = CGPoint(x: scene.size.width / 2,
                                 y: scene.size.height - myFontSize)
        
        let background = SKSpriteNode(color: SKColor.black,
                                      size: CGSize(width: myWidth*2,
                                                   height: myHeight*2))
        let player = SKSpriteNode(texture: ss.getSpriteTexture(col: 1,
                                                               row: 4))
        player.position = CGPoint(x: scene.size.width / 2 ,
                                  y: scene.size.height / 4)
        scene.addChild(background)
        scene.addChild(player)
        scene.addChild(label)
        
        scene.animatePlayer(player: player, ss: ss)
        
        skView.presentScene(scene)
    }
    

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
