//
//  AssetCollectionViewController.swift
//  ResponsiveCollectionViews
//
//  Created by Andrea Bizzotto on 29/04/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

class AssetCollectionViewController: CollectionViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var flowLayout: AssetCollectionFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func updateSizeClassesLayout() {
        let sizeClass = AlbumsCollectionSizeClass(traitCollection: self.traitCollection)
        let gridWidth = ApplicationWindowSize.windowSize.width
        //print("gridWidth: \(gridWidth)")
        flowLayout = AssetCollectionFlowLayout(gridWidth: gridWidth, sizeClass: sizeClass)
        if let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.sectionInset = ImageGridLayout.contentInset(sizeClass: sizeClass)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateSizeClassesLayout()
        
        collectionView.collectionViewLayout.invalidateLayout()
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0//assetsFetchResult.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(AssetCollectionViewCell.CellID, forIndexPath: indexPath)
        
//        let asset = assetForIndexPath(indexPath)
//        
//        assetCollectionViewCellController.updateCell(cell, asset: asset, indexPath: indexPath, imageSize: flowLayout.imageSize)
        
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
//        
//        assetCollectionViewCellController.endDisplayingCell(cell)
//    }
    
//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        
//    }
    
    // MARK: Grid Layout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return flowLayout.collectionView(collectionView, layout: collectionViewLayout, sizeForItemAtIndexPath: indexPath)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return flowLayout.collectionView(collectionView, layout: collectionViewLayout, minimumLineSpacingForSectionAtIndex: section)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return flowLayout.collectionView(collectionView, layout: collectionViewLayout, minimumInteritemSpacingForSectionAtIndex: section)
    }
}
