//
//  CGSizeSquare.swift
//  CastPlayer
//
//  Created by Andrea Bizzotto on 08/12/2015.
//  Copyright © 2015 musevisions. All rights reserved.
//

import UIKit

extension CGSize {

    static func square(squareSize: CGFloat) -> CGSize {
        
        return CGSizeMake(squareSize, squareSize)
    }

    static func retinaSquare(squareSize: CGFloat) -> CGSize {
        
        let screenScale = UIScreen.mainScreen().scale
        return CGSizeMake(screenScale * squareSize, screenScale * squareSize)
    }
}
