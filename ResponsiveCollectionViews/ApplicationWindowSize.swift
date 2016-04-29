//
//  ApplicationWindowSize.swift
//  CastPlayer
//
//  Created by Andrea Bizzotto on 28/04/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

class ApplicationWindowSize: NSObject {

    class var windowSize: CGSize {
        
        if let delegate = UIApplication.sharedApplication().delegate, let window = delegate.window {
            return window!.frame.size
        }
        return UIScreen.mainScreen().bounds.size
    }
}
