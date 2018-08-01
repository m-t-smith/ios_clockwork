//
//  SpriteSheet.swift
//  Clockwork
//
//  Created by user142691 on 7/31/18.
//  Copyright © 2018 user142691. All rights reserved.
//

import Foundation
import SpriteKit

class SpriteSheet {
    let texture: SKTexture
    let row: Int
    let col: Int
    var margin: CGFloat = 0
    var spacing: CGFloat = 0
    var frameSize: CGSize {
       
        return CGSize(width: 64, height: 64)
        //return CGSize(width: (self.texture.size().width -
            //(self.margin*2+self.spacing*CGFloat(self.col-1)))/CGFloat(self.col),
                       //height: (self.texture.size().height -
            //(self.margin*2+self.spacing*CGFloat(self.row-1)))/CGFloat(self.row))
    }
    
    init(texture: SKTexture, row: Int, col: Int, spacing: CGFloat, margin: CGFloat) {
        self.texture = texture
        self.row = row
        self.col = col
        self.spacing = spacing
        self.margin = margin
        
    }
    
    convenience init(texture: SKTexture, row: Int, col: Int) {
        self.init(texture: texture, row: row, col: col, spacing: 0, margin: 0)
    
    }
    
    func getSpriteTexture(col: Int, row: Int) -> SKTexture? {
        if !(0...self.row ~= row && 0...self.col ~= col) {
            return nil
        }
        
        var textR = CGRect(x: self.margin + CGFloat(col) * (self.frameSize.width + self.spacing) - self.spacing,
                    y: self.margin + CGFloat(row) * (self.frameSize.width + self.spacing) - self.spacing,
                    width: self.frameSize.width, height: self.frameSize.height)
        
        textR = CGRect(x: textR.origin.x/self.texture.size().width, y: textR.origin.y/self.texture.size().height,
                       width: textR.size.width/self.texture.size().height,
                       height: textR.size.height/self.texture.size().height)
        
            return SKTexture(rect: textR, in: self.texture)
        
    }
}
