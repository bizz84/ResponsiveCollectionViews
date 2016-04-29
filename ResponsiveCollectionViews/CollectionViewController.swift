//
//  CastCollectionViewController.swift
//  CastPlayer
//
//  Created by Andrea Bizzotto on 13/02/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!

    private var currentIndexPath: NSIndexPath?
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        let visibleIndexPaths = collectionView.indexPathsForVisibleItems()
        if visibleIndexPaths.count > 0 {
            currentIndexPath = visibleIndexPaths[visibleIndexPaths.count / 2]
        }
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        if previousTraitCollection != nil {
            
            collectionView.reloadData()
        }
        super.traitCollectionDidChange(previousTraitCollection)
        
        if let currentIndexPath = currentIndexPath {
            collectionView.scrollToItemAtIndexPath(currentIndexPath, atScrollPosition: .CenteredVertically, animated: false)
            self.currentIndexPath = nil
        }
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        collectionView.reloadData()
    }
}
