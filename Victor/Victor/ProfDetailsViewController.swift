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
    
    var imageView: UIImageView!
    var nameLabel: UILabel!
    
    var followButton: UIButton!
    var isFollowing: Bool! = false
    
    var blueView: UIView!
    
    var followersButton: UIButton!
    var followersNumberLabel: UILabel!
    var followersLabel: UILabel!
    var videosButton: UIButton!
    var videosNumberLabel: UILabel!
    var videosLabel: UILabel!
    
    let aboveImagePadding: Int = 30
    let smallPadding: Int = 5
    let mediumPadding: Int = 10
    let largePadding: Int = 20
    
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
        
        view.backgroundColor = UIColor(red: 133/255, green: 176/255, blue: 183/255, alpha: 1.0)
    
        imageView = UIImageView()
        imageView.image = UIImage(named: profProfileImageName)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor(red: 70/255, green: 94/255, blue: 95/255, alpha: 1.0).cgColor
        view.addSubview(imageView)
        
        nameLabel = UILabel()
        nameLabel.text = profName
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 0.4))
        view.addSubview(nameLabel)
        
        followButton = UIButton()
        followButton.setTitle("Follow", for: .normal)
        followButton.setTitleColor(.black, for: .normal)
        followButton.backgroundColor = .white
        followButton.layer.cornerRadius = 10
        followButton.addTarget(self, action: #selector(toggleFollow), for: .touchUpInside)
        view.addSubview(followButton)
        
        blueView = UIView()
        blueView.backgroundColor = UIColor(red: 70/255, green: 94/255, blue: 95/255, alpha: 1.0)
        blueView.layer.cornerRadius = 20
        view.addSubview(blueView)
        
        followersButton = UIButton()
        followersButton.setImage(UIImage(named: "smile"), for: .normal)
        followersButton.layer.cornerRadius = 10
        followersButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        followersButton.backgroundColor = UIColor(red: 176/255, green: 186/255, blue: 188/255, alpha: 1.0)
        view.addSubview(followersButton)
        
        followersNumberLabel = UILabel()
        followersNumberLabel.text = "100"
        followersNumberLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(followersNumberLabel)
        
        followersLabel = UILabel()
        followersLabel.text = "Followers"
        followersLabel.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(followersLabel)
        
        videosNumberLabel = UILabel()
        videosNumberLabel.text = "25"
        videosNumberLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(videosNumberLabel)
        
        videosLabel = UILabel()
        videosLabel.text = "Videos"
        videosLabel.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(videosLabel)
        
        videosButton = UIButton()
        videosButton.setImage(UIImage(named: "play"), for: .normal)
        videosButton.layer.cornerRadius = 10
        videosButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        videosButton.backgroundColor = UIColor(red: 176/255, green: 186/255, blue: 188/255, alpha: 1.0)
        view.addSubview(videosButton)
        
        setupConstraints()
    }

    func setupConstraints(){
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(aboveImagePadding)
            make.width.equalTo(view.frame.width * 0.2)
            make.height.equalTo(imageView.snp.width)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(smallPadding)
            make.centerX.equalTo(view)
        }
        
        followButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(nameLabel.snp.bottom).offset(smallPadding)
            make.width.equalTo(200)
        }
        
        blueView.snp.makeConstraints { make in
            make.width.equalTo(view)
            make.height.equalTo(120)
            make.top.equalTo(nameLabel.snp.bottom).offset(45)
        }
        
        followersButton.snp.makeConstraints { make in
            make.right.equalTo(followersLabel.snp.left).offset(-mediumPadding)
            make.centerY.equalTo(blueView.snp.centerY)
            make.width.height.equalTo(50)
        }
        
        followersNumberLabel.snp.makeConstraints { make in
            make.left.equalTo(followersLabel)
            make.centerY.equalTo(followersButton).offset(-smallPadding)
        }
        
        followersLabel.snp.makeConstraints { make in
            make.right.equalTo(view.snp.centerX).offset(-largePadding)
            make.centerY.equalTo(followersButton).offset(mediumPadding)
        }
        
        videosButton.snp.makeConstraints { make in
            make.left.equalTo(view.snp.centerX).offset(largePadding)
            make.centerY.equalTo(blueView.snp.centerY)
            make.width.height.equalTo(50)
        }
        
        videosNumberLabel.snp.makeConstraints { make in
            make.left.equalTo(videosButton.snp.right).offset(mediumPadding)
            make.centerY.equalTo(videosButton).offset(-smallPadding)
        }
        
        videosLabel.snp.makeConstraints { make in
            make.left.equalTo(videosNumberLabel)
            make.centerY.equalTo(videosButton).offset(mediumPadding)
        }
    }
    
    @objc func toggleFollow(){
        isFollowing ? followButton.setTitle("Follow", for: .normal) : followButton.setTitle("Following", for: .normal)
        isFollowing.toggle()
    }
}
