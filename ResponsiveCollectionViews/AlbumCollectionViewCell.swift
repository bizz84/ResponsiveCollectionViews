//
//  AlbumCell.swift
//  CastPlayer
//
//  Created by Andrea Bizzotto on 06/12/2015.
//  Copyright © 2015 musevisions. All rights reserved.
//

import Foundation
import UIKit

extension AlbumsCollectionSizeClass {
    
    var cellReuseID: String {
        return "AlbumCollectionViewCell-\(self.rawValue)"
    }
}

class AlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var imageView: UIImageView!

    @IBOutlet private var imageViewSub1: UIImageView!

    @IBOutlet private var imageViewSub2: UIImageView!

    @IBOutlet private var titleLabel: UILabel!
    
    @IBOutlet private var countLabel: UILabel!
    
    lazy var numberFormatter: NSNumberFormatter = {
        
        var numberFormatter = NSNumberFormatter()
        numberFormatter.formatterBehavior = .Behavior10_4
        numberFormatter.numberStyle = .DecimalStyle
        return numberFormatter
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let backgroundColor = UIColor(white: 217.0/255.0, alpha: 1.0)
        imageView.backgroundColor = backgroundColor
        imageViewSub1.backgroundColor = backgroundColor
        imageViewSub2.backgroundColor = backgroundColor
    }
    
    var sizeClass: AlbumsCollectionSizeClass!
    
    override var highlighted: Bool {
        didSet {
            self.contentView.backgroundColor = highlighted && sizeClass == .Compact ? UIColor(white: 217.0/255.0, alpha: 1.0) : nil
        }
    }
    
    var image: UIImage? {
        didSet {
            imageView.image = image
            imageViewSub1.image = image
            imageViewSub2.image = image
        }
    }
    
    var count: Int = 0 {
        didSet {
            countLabel.text = numberFormatter.stringFromNumber(count)
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
}
