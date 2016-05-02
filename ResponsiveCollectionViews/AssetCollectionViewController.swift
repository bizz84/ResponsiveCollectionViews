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

    var albumPhotoFileNames: [ String ] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func updateSizeClassesLayout() {
        let gridWidth = ApplicationWindowSize.windowSize.width
        let sizeClass = AlbumsCollectionSizeClass(traitCollection: self.traitCollection)
        flowLayout = AssetCollectionFlowLayout(gridWidth: gridWidth, sizeClass: sizeClass)
        if let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.sectionInset = flowLayout.edgeInsets
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateSizeClassesLayout()
        
        collectionView.collectionViewLayout.invalidateLayout()
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return albumPhotoFileNames.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(AssetCollectionViewCell.CellID, forIndexPath: indexPath) as! AssetCollectionViewCell
        
        let imageName = albumPhotoFileNames[indexPath.row]
        cell.image = UIImage(named: imageName)
        
        return cell
    }
    
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
