//
//  PostService.swift
//  Makestagram
//
//  Created by Jacob Kim on 6/26/17.
//  Copyright © 2017 Jacob Kim. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseDatabase

struct PostService {
    
    static func create(for image: UIImage) {
        let imageRef = StorageReference.newPostImageReference()
        StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
            guard let downloadURL = downloadURL else {
                return
            }
            
            let urlString = downloadURL.absoluteString
            let aspectHeight = image.aspectHeight
            Post.create(forURLString: urlString, aspectHeight: aspectHeight)
        }
    }
}
