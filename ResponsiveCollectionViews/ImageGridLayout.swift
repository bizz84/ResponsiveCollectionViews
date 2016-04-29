//
//  ImageGridLayout.swift
//  CastPlayer
//
//  Created by Andrea Bizzotto on 09/12/2015.
//  Copyright © 2015 musevisions. All rights reserved.
//

import UIKit

struct ImageGridLayout {

    let spacingBetweenCells: CGFloat
    
    let squareCellSize: CGFloat
    
    let cellsPerRow: Int
    
    let sizeClass: AlbumsCollectionSizeClass
    
    init(sizeClass: AlbumsCollectionSizeClass, gridWidth: CGFloat, desiredCellSize: CGFloat) {
        
        self.sizeClass = sizeClass

        spacingBetweenCells = sizeClass == .Regular ? 20.0 : 1.0
        
        let contentInset = ImageGridLayout.contentInset(sizeClass: sizeClass)

        let availableGridWidth = gridWidth - contentInset.left - contentInset.right
        cellsPerRow = Int(round(availableGridWidth / desiredCellSize))

        let gridWidthMinusSpacing = availableGridWidth - spacingBetweenCells * CGFloat(cellsPerRow - 1)
        
        squareCellSize = floor(gridWidthMinusSpacing / CGFloat(cellsPerRow))
    }
    
    static func contentInset(sizeClass sizeClass: AlbumsCollectionSizeClass) -> UIEdgeInsets {
        return sizeClass == .Regular ? UIEdgeInsetsMake(15, 15, 15, 15) : UIEdgeInsetsZero
    }
}

