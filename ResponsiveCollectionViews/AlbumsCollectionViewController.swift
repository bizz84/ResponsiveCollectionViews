//
//  AlbumsCollectionViewController.swift
//  ResponsiveCollectionViews
//
//  Created by Andrea Bizzotto on 29/04/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

class AlbumsCollectionViewController: CollectionViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var flowLayout: AlbumsCollectionFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func updateCell(cell: AlbumCollectionViewCell, indexPath: NSIndexPath) {
        
//        let collection = dataSource.collections[indexPath.row]
//        
//        cell.title = collection.assetCollection.localizedTitle
//        cell.count = collection.fetchResult.count
//        cell.sizeClass = AlbumsCollectionSizeClass(traitCollection: self.traitCollection)
//        
//        if let asset = collection.firstAsset {
//            
//            cell.image = nil
//            
//            PhotosController.requestSquareImage(asset: asset, targetSize: self.imageSize) { result in
//                
//                cell.image = result
//            }
//        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0//self.photosAccessAuthorized ? dataSource.collections.count : 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let sizeClass = AlbumsCollectionSizeClass(traitCollection: self.traitCollection)
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(sizeClass.cellReuseID, forIndexPath: indexPath) as! AlbumCollectionViewCell
        
        updateCell(cell, indexPath: indexPath)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return flowLayout.collectionView(collectionView, layout: collectionViewLayout, sizeForItemAtIndexPath: indexPath)
    }

}
