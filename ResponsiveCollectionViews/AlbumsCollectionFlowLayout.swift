//
//  AlbumsCollectionFlowLayout.swift
//  CastPlayer
//
//  Created by Andrea Bizzotto on 28/04/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

class AlbumsCollectionFlowLayout: NSObject, UICollectionViewDelegateFlowLayout {

    let regularLayoutEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20)
    let compactLayoutCellHeight: CGFloat = 90
    let regularLayoutCellWidth: CGFloat = 200
    var regularLayoutCellHeight: CGFloat {
        return regularLayoutCellWidth + 50
    }

    let gridWidth: CGFloat
    
    let sizeClass: AlbumsCollectionSizeClass
    
    init(gridWidth: CGFloat, sizeClass: AlbumsCollectionSizeClass) {
    
        self.gridWidth = gridWidth
        
        self.sizeClass = sizeClass
    }
    
    var contentInset: UIEdgeInsets {
        return sizeClass == .Regular ? UIEdgeInsetsMake(20, 20, 20, 20) : UIEdgeInsetsZero
    }
    
    // MARK: Grid Layout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return sizeClass == .Regular ? CGSizeMake(regularLayoutCellWidth, regularLayoutCellHeight) : CGSizeMake(gridWidth, compactLayoutCellHeight)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0.0
    }
}
