//
//  AssetCell.swift
//  CastPlayer
//
//  Created by Andrea Bizzotto on 08/12/2015.
//  Copyright © 2015 musevisions. All rights reserved.
//

import UIKit
import Photos

class AssetCollectionViewCell: UICollectionViewCell {

    static var CellID = "AssetCollectionViewCell"

    @IBOutlet private var imageView: UIImageView!
    
    @IBOutlet private var activityIndicatorOverlay: UIView!
    
    @IBOutlet private var activityIndicatorView: UIActivityIndicatorView!
    
    var loading: Bool = false {
        didSet {
            activityIndicatorOverlay.hidden = !loading
            if loading {
                activityIndicatorView.startAnimating()
            }
            else {
                activityIndicatorView.stopAnimating()
            }
        }
    }
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    var imageRequestID: PHImageRequestID?
}
