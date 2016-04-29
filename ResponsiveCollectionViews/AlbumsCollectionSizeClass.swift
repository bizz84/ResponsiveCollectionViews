//
//  AlbumsCollectionLayoutType.swift
//  CastPlayer
//
//  Created by Andrea Bizzotto on 28/04/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

enum AlbumsCollectionSizeClass: String {
    case Compact = "Compact"
    case Regular = "Regular"
    
    init(traitCollection: UITraitCollection) {
        
        self = traitCollection.horizontalSizeClass == .Regular &&
            traitCollection.verticalSizeClass == .Regular ? .Regular : .Compact
    }
}
