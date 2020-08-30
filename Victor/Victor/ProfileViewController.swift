//
//  ProfileViewController.swift
//  Victor
//
//  Created by Morgan Belous on 8/17/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var followingCollectionView: UICollectionView!
    let followingCellReuseIdentifier = "profCellReuseIdentifier"
    
    var followings: [Professional] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }
}
