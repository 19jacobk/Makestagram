//
//  HomeViewController.swift
//  Makestagram
//
//  Created by Jacob Kim on 6/23/17.
//  Copyright © 2017 Jacob Kim. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    var posts = [Post]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserService.posts(for: User.current) { (posts) in
            self.posts = posts
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostImageCell", for: indexPath)
        cell.backgroundColor = .red
        
        return cell
    }
}
