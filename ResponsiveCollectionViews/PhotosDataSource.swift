//
//  PhotosDataSource.swift
//  ResponsiveCollectionViews
//
//  Created by Andrea Bizzotto on 02/05/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

class PhotosDataSource {

    static let sharedInstance = PhotosDataSource()
    
    let albums: [ String: [String] ]
    
    private init() {
        
        let photosData: [ [ String: AnyObject ] ] = [
            [ "name": "48URC0M7Y2.jpg", "albums": ["Family"], "favorite": true ],
            [ "name": "2PWXL32KN4.jpg", "albums": ["Travels"] ],
            [ "name": "R0BZTCYBM6.jpg", "albums": ["Family"], "favorite": true ],
            [ "name": "47431FB037.jpg", "albums": ["Travels"] ],
            [ "name": "565R8RA63A.jpg", "albums": ["Travels"] ],
            [ "name": "B666HPWJV3.jpg", "albums": ["Travels", "On the Road"] ],
            [ "name": "T0HUGD2ORR.jpg", "albums": ["Family"] ],
            [ "name": "DYJL1VHVG0.jpg", "albums": ["Travels"] ],
            [ "name": "OZ6XCZ9Q0R.jpg", "albums": ["Travels", "On the Road"] ],
            [ "name": "RVYCCXWSLI.jpg", "albums": ["Travels", "On the Road"] ],
            [ "name": "2RZ7ALY977.jpg", "albums": ["Nature", "Holidays"] ],
            [ "name": "8Z2QWLCH72.jpg", "albums": ["Nature", "Holidays"] ],
            [ "name": "9Z7ZIEY28T.jpg", "albums": ["Nature"], "favorite": true ],
            [ "name": "GLC6K587ZH.jpg", "albums": ["Nature"] ],
            [ "name": "KKZVVYRNZG.jpg", "albums": ["Nature"] ],
            [ "name": "40E8956DFC.jpg", "albums": ["Nature"] ],
            [ "name": "9P5EDI0D26.jpg", "albums": ["Nature"] ],
            [ "name": "B6LL39821V.jpg", "albums": ["Nature"], "favorite": true ],
            [ "name": "HAM087SSHZ.jpg", "albums": ["Nature"], "favorite": true ],
            [ "name": "ZJE4KHCDWE.jpg", "albums": ["Nature"], "favorite": true ],
            [ "name": "6EJBLMF3IA.jpg", "albums": ["Sports"] ],
            [ "name": "8ODE0WIMD9.jpg", "albums": ["Sports", "Hobbies"] ],
            [ "name": "AZN1QXU0U1.jpg", "albums": ["Sports"] ],
            [ "name": "E9YYU6IFR7.jpg", "albums": ["Sports"] ],
            [ "name": "IRLZ7O8P2H.jpg", "albums": ["Sports"] ],
            [ "name": "LACLP35NO9.jpg", "albums": ["Sports", "Rhone Alps Trip 2016"] ],
            [ "name": "QDMXFFWXDE.jpg", "albums": ["Sports", "Training"] ],
            [ "name": "T4LLIX5GEX.jpg", "albums": ["Sports"] ],
            [ "name": "6HDDX29OXM.jpg", "albums": ["Sports"] ],
            [ "name": "A4DYF4H2G6.jpg", "albums": ["Sports"] ],
            [ "name": "B4A32E0320.jpg", "albums": ["Sports"] ],
            [ "name": "FRMK9PDFXE.jpg", "albums": ["Sports", "Hobbies"] ],
            [ "name": "KY1D706OSN.jpg", "albums": ["Sports", "Rhone Alps Trip 2016"] ],
            [ "name": "PSM2H8G7R3.jpg", "albums": ["Sports", "Rhone Alps Trip 2016"] ],
            [ "name": "RSP6NAGL6B.jpg", "albums": ["Sports", "Family"] ],
            [ "name": "UXABHNPY7B.jpg", "albums": ["Sports", "Training"], "favorite": true ],
        ]
        
        var albums: [ String: [String] ] = [ "All Photos" : [] ]
        for photo in photosData {
            
            if let photoFileName = photo["name"] as? String, let albumNames = photo["albums"] as? [ String ] {
                
                for albumName in albumNames {
                    
                    PhotosDataSource.insert(photoFileName: photoFileName, inAlbums: &albums, albumName: albumName)
                }
                albums["All Photos"]!.append(photoFileName)
            }
        }
        self.albums = albums
        
        print("\(albums)")
    }
    
    class func insert(photoFileName photoFileName: String, inout inAlbums albums: [ String: [String] ], albumName: String) {
        
        if var album = albums[albumName] {
            album.append(photoFileName)
            albums[albumName] = album
        }
        else {
            albums[albumName] = [ photoFileName ]
        }
    }
}
