//
//  PostHeaderCell.swift
//  Makestagram
//
//  Created by Jacob Kim on 6/27/17.
//  Copyright © 2017 Jacob Kim. All rights reserved.
//

import Foundation
import UIKit

class PostHeaderCell: UITableViewCell {
   
    static let height: CGFloat = 50
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func optionsButtonTapped(_ sender: Any) {
        print("options button tapped")
    }
}
