//
//  UploadViewController.swift
//  Victor
//
//  Created by Morgan Belous on 8/18/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit
import SnapKit

class UploadViewController: UIViewController {
    
    var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple
        
        button = UIButton()
        button.setTitle("dismiss", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        view.addSubview(button)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        button.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    
    @objc func dismissVC(){
        dismiss(animated: true, completion: nil)
    }
}
