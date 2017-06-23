//
//  Storyboard+Utility.swift
//  Makestagram
//
//  Created by Jacob Kim on 6/23/17.
//  Copyright © 2017 Jacob Kim. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    enum MGType: String {
        case main
        case login
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    convenience init (type: MGType, bundle: Bundle? = nil) {
        self.init(name: type.filename, bundle: bundle)
    }
    
    static func initialViewController (for type: MGType) -> UIViewController {
        let storyboard = UIStoryboard(type: type)
    }
}
