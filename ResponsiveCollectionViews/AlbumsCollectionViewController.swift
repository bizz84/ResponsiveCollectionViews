//
//  AlbumsCollectionViewController.swift
//  ResponsiveCollectionViews
//
//  Created by Andrea Bizzotto on 29/04/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

class AlbumsCollectionViewController: CollectionViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let AssetCollectionSegueIdentifier = "ShowAssets"

    var flowLayout: AlbumsCollectionFlowLayout!
    
    let albums = PhotosDataSource.sharedInstance.albums
    
    lazy var albumNames: [String] = {
        return Array(self.albums.keys).sort() { $0 < $1 }
    }()
    
    func updateSizeClassesLayout() {
        let gridWidth = ApplicationWindowSize.windowSize.width
        let sizeClass = AlbumsCollectionSizeClass(traitCollection: self.traitCollection)
        flowLayout = AlbumsCollectionFlowLayout(gridWidth: gridWidth, sizeClass: sizeClass)
        if let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.sectionInset = flowLayout.contentInset
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Needed to prevent autolayout break when navigating back
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateSizeClassesLayout()
        
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == AssetCollectionSegueIdentifier {
            
            if let indexPath = sender as? NSIndexPath, let destinationVC = segue.destinationViewController as? AssetCollectionViewController {
                    
                let albumName = albumNames[indexPath.row]
                let album = albums[albumName]!
                
                destinationVC.title = albumName
                destinationVC.albumPhotoFileNames = album
            }
        }
    }

    private func updateCell(cell: AlbumCollectionViewCell, indexPath: NSIndexPath) {
        
        let albumName = albumNames[indexPath.row]
        let album = albums[albumName]!
        
        cell.title = albumName
        cell.count = album.count
        cell.sizeClass = AlbumsCollectionSizeClass(traitCollection: self.traitCollection)

        if let firstPhotoName = album.first {
            
            cell.image = UIImage(named: firstPhotoName)
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return albums.count
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

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier(AssetCollectionSegueIdentifier, sender: indexPath)
    }
}
