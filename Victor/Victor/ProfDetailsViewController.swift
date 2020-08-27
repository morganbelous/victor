//
//  ProfDetailsViewController.swift
//  Victor
//
//  Created by Morgan Belous on 8/27/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit
import SnapKit

class ProfDetailsViewController: UIViewController {
    
    var profName: String
    var profUsername: String
    var profProfileImageName: String
    
    var nameLabel: UILabel!
    
    init(profName: String, profUsername: String, profBio: String, profProfileImageName: String) {
        self.profName = profName
        self.profUsername = profUsername
        self.profProfileImageName = profProfileImageName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        nameLabel = UILabel()
        nameLabel.text = profName
        view.addSubview(nameLabel)
        
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        nameLabel.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        
        
    }
}
