//
//  AssetCollectionFlowLayout.swift
//  CastPlayer
//
//  Created by Andrea Bizzotto on 09/12/2015.
//  Copyright © 2015 musevisions. All rights reserved.
//

import UIKit

class AssetCollectionFlowLayout: NSObject, UICollectionViewDelegateFlowLayout {
    
    var imageSize: CGSize {
        
        return CGSize.retinaSquare(imageGridLayout.squareCellSize)
    }
    
    let sizeClass: AlbumsCollectionSizeClass
    
    let edgeInsets: UIEdgeInsets

    let imageGridLayout: AssetCollectionImageGridLayout
    
    init(gridWidth: CGFloat, sizeClass: AlbumsCollectionSizeClass) {
        self.sizeClass = sizeClass
        self.edgeInsets = sizeClass == .Regular ? UIEdgeInsetsMake(15, 15, 15, 15) : UIEdgeInsetsZero
        let desiredCellSize: CGFloat = sizeClass == .Regular ? 145.0 : 100.0
        imageGridLayout = AssetCollectionImageGridLayout(sizeClass: sizeClass, edgeInsets: edgeInsets, gridWidth: gridWidth, desiredCellSize: desiredCellSize)
    }
    
    // MARK: Grid Layout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize.square(imageGridLayout.squareCellSize)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return imageGridLayout.spacingBetweenCells
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return imageGridLayout.spacingBetweenCells
    }
}
