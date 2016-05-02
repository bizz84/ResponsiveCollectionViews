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
            [ "name": "48URC0M7Y2", "albums": ["Family"], "favorite": true ],
            [ "name": "2PWXL32KN4", "albums": ["Travels"] ],
            [ "name": "R0BZTCYBM6", "albums": ["Family"], "favorite": true ],
            [ "name": "47431FB037", "albums": ["Travels"] ],
            [ "name": "565R8RA63A", "albums": ["Travels"] ],
            [ "name": "B666HPWJV3", "albums": ["Travels", "On the Road"] ],
            [ "name": "T0HUGD2ORR", "albums": ["Family"] ],
            [ "name": "DYJL1VHVG0", "albums": ["Travels"] ],
            [ "name": "OZ6XCZ9Q0R", "albums": ["Travels", "On the Road"] ],
            [ "name": "RVYCCXWSLI", "albums": ["Travels", "On the Road"] ],
            [ "name": "2RZ7ALY977", "albums": ["Nature", "Holidays"] ],
            [ "name": "8Z2QWLCH72", "albums": ["Nature", "Holidays"] ],
            [ "name": "9Z7ZIEY28T", "albums": ["Nature"], "favorite": true ],
            [ "name": "GLC6K587ZH", "albums": ["Nature"] ],
            [ "name": "KKZVVYRNZG", "albums": ["Nature"] ],
            [ "name": "40E8956DFC", "albums": ["Nature"] ],
            [ "name": "9P5EDI0D26", "albums": ["Nature"] ],
            [ "name": "B6LL39821V", "albums": ["Nature"], "favorite": true ],
            [ "name": "HAM087SSHZ", "albums": ["Nature"], "favorite": true ],
            [ "name": "ZJE4KHCDWE", "albums": ["Nature"], "favorite": true ],
            [ "name": "6EJBLMF3IA", "albums": ["Sports"] ],
            [ "name": "8ODE0WIMD9", "albums": ["Sports", "Hobbies"] ],
            [ "name": "AZN1QXU0U1", "albums": ["Sports"] ],
            [ "name": "E9YYU6IFR7", "albums": ["Sports"] ],
            [ "name": "IRLZ7O8P2H", "albums": ["Sports"] ],
            [ "name": "LACLP35NO9", "albums": ["Sports", "Rhone Alps Trip 2016"] ],
            [ "name": "QDMXFFWXDE", "albums": ["Sports", "Training"] ],
            [ "name": "T4LLIX5GEX", "albums": ["Sports"] ],
            [ "name": "6HDDX29OXM", "albums": ["Sports"] ],
            [ "name": "A4DYF4H2G6", "albums": ["Sports"] ],
            [ "name": "B4A32E0320", "albums": ["Sports"] ],
            [ "name": "FRMK9PDFXE", "albums": ["Sports", "Hobbies"] ],
            [ "name": "KY1D706OSN", "albums": ["Sports", "Rhone Alps Trip 2016"] ],
            [ "name": "PSM2H8G7R3", "albums": ["Sports", "Rhone Alps Trip 2016"] ],
            [ "name": "RSP6NAGL6B", "albums": ["Sports", "Family"] ],
            [ "name": "UXABHNPY7B", "albums": ["Sports", "Training"], "favorite": true ],
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
