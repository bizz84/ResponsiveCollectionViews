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
    
    let albums = PhotosDataSource.sharedInstance.albums

    override func viewDidLoad() {
        super.viewDidLoad()

        updateSizeClassesLayout()
    }
    
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

    private func updateCell(cell: AlbumCollectionViewCell, indexPath: NSIndexPath) {
        
        let albumNames = Array(albums.keys).sort() { $0 < $1 }
        let title = albumNames[indexPath.row]
        let album = albums[title]!
        
        cell.title = title
        cell.count = album.count
        cell.sizeClass = AlbumsCollectionSizeClass(traitCollection: self.traitCollection)

        if let firstPhotoName = album.first {
            
            if let bundlePath = NSBundle.mainBundle().pathForResource(firstPhotoName, ofType: "jpg") {
                cell.image = UIImage(contentsOfFile: bundlePath)
            }
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

}
