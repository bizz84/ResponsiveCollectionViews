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

    static let CellID = "AssetCollectionViewCell"

    @IBOutlet private var imageView: UIImageView!
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
}
