//
//  ImageGridLayout.swift
//  CastPlayer
//
//  Created by Andrea Bizzotto on 09/12/2015.
//  Copyright © 2015 musevisions. All rights reserved.
//

import UIKit

struct AssetCollectionImageGridLayout {

    let spacingBetweenCells: CGFloat
    
    let squareCellSize: CGFloat
    
    let cellsPerRow: Int
    
    init(sizeClass: AlbumsCollectionSizeClass, edgeInsets: UIEdgeInsets, gridWidth: CGFloat, desiredCellSize: CGFloat) {
  
        spacingBetweenCells = sizeClass == .Regular ? 20.0 : 1.0
        
        let availableGridWidth = gridWidth - edgeInsets.left - edgeInsets.right
        cellsPerRow = Int(round(availableGridWidth / desiredCellSize))

        let gridWidthMinusSpacing = availableGridWidth - spacingBetweenCells * CGFloat(cellsPerRow - 1)
        
        squareCellSize = floor(gridWidthMinusSpacing / CGFloat(cellsPerRow))
    }
}
