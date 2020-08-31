//
//  ProfileViewController.swift
//  Victor
//
//  Created by Morgan Belous on 8/17/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var name: String!
    var username: String!
    var profileImageName: String!
    
    var imageView: UIImageView!
    var nameLabel: UILabel!
    
    var blueView: UIView!
    
    var followingCollectionView: UICollectionView!
    let followingCellReuseIdentifier = "profCellReuseIdentifier"
    
    var followings: [Professional] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Constants.lightBlue
        
        let jack = Professional(name: "Jack", username: "jack123", bio: "I'm a soccer player", profileImageName: "man")
        let morgan = Professional(name: "Morgan", username: "morgan326", bio: "I'm a volleyball player", profileImageName: "woman")
        let sam = Professional(name: "Sam", username: "sam125", bio: "I'm a tennis player", profileImageName: "woman2")
        
        followings = [jack, morgan, sam, jack, morgan, sam]
        
        imageView = UIImageView()
        imageView.image = UIImage(named: "woman")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = Constants.darkBlue.cgColor
            view.addSubview(imageView)

        nameLabel = UILabel()
        nameLabel.text = "user name"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 0.4))
        view.addSubview(nameLabel)
        
        blueView = UIView()
        blueView.backgroundColor = Constants.darkBlue
        blueView.layer.cornerRadius = 20
        view.addSubview(blueView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        followingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        followingCollectionView.dataSource = self
        followingCollectionView.delegate = self
        followingCollectionView.register(HeroCollectionViewCell.self, forCellWithReuseIdentifier: followingCellReuseIdentifier)
        followingCollectionView.backgroundColor = .white
        followingCollectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        view.addSubview(followingCollectionView)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(Constants.aboveImagePadding)
            make.width.equalTo(view.frame.width * 0.2)
            make.height.equalTo(imageView.snp.width)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(Constants.smallPadding)
            make.centerX.equalTo(view)
        }
        
        blueView.snp.makeConstraints { make in
            make.width.equalTo(view)
            make.height.equalTo(120)
            make.top.equalTo(nameLabel.snp.bottom).offset(45)
        }
        
        followingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(blueView.snp.bottom).offset(20)
            make.left.right.equalTo(view)
            make.height.equalTo(120)
        }
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return followings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = followingCollectionView.dequeueReusableCell(withReuseIdentifier: followingCellReuseIdentifier, for: indexPath) as! HeroCollectionViewCell
        let prof = followings[indexPath.item]
        cell.configure(for: prof)
        return cell
        
    }
}

extension ProfileViewController: UICollectionViewDelegate {}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 175.0
        let height = 100.0
        return CGSize(width: width, height: height)
    }
}
