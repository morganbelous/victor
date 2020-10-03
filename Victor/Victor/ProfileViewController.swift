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
    var whiteView: UIView!
    
    var followingButton: UIButton!
    var followingNumberLabel: UILabel!
    var followingLabel: UILabel!
    var likesButton: UIButton!
    var likesNumberLabel: UILabel!
    var likesLabel: UILabel!
    
    var followingTitle: UILabel!
    var bookmarksTitle: UILabel!
    let titlePadding: Int = 15
    
    var followingCollectionView: UICollectionView!
    let followingCellReuseIdentifier = "profCellReuseIdentifier"
    
    var bookmarksCollectionView: UICollectionView!
    let bookmarkCellReuseIdentifier = "bookmarkCellReuseIdentifier"
    
    let collectionViewHeight: Int = 120

    var followings: [Professional] = []
    var bookmarks: [Video] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Constants.lightBlue
        
        let jack = Professional(name: "Jack", username: "jack123", bio: "I'm a soccer player", profileImageName: "man", heroImageName: "soccer")
        let morgan = Professional(name: "Morgan", username: "morgan326", bio: "I'm a volleyball player", profileImageName: "woman", heroImageName: "volleyball")
        let sam = Professional(name: "Sam", username: "sam125", bio: "I'm a tennis player", profileImageName: "woman2", heroImageName: "tennis")
        
        let soccerVideo = Video(name: "soccervideo", caption: "video of jack playing soccer", likes: 10, userWhoPosted: "jack")
        let vbVideo = Video(name: "vbvideo", caption: "video of morgan playing volleyball", likes: 5, userWhoPosted: "morgan")
        let tennisVideo = Video(name: "tennisvideo", caption: "video of sam playing tennis", likes: 14, userWhoPosted: "sam")
        
        followings = [jack, morgan, sam, jack, morgan, sam]
        bookmarks = [soccerVideo, vbVideo, tennisVideo, soccerVideo, vbVideo, tennisVideo]
        
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
        
        followingButton = UIButton()
        followingButton.setImage(UIImage(named: "smile"), for: .normal)
        followingButton.layer.cornerRadius = 10
        followingButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        followingButton.backgroundColor = Constants.lightGray
        view.addSubview(followingButton)
        
        followingNumberLabel = UILabel()
        followingNumberLabel.text = "32"
        followingNumberLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(followingNumberLabel)
        
        followingLabel = UILabel()
        followingLabel.text = "Following"
        followingLabel.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(followingLabel)
        
        likesNumberLabel = UILabel()
        likesNumberLabel.text = "21"
        likesNumberLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(likesNumberLabel)
        
        likesLabel = UILabel()
        likesLabel.text = "Likes"
        likesLabel.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(likesLabel)
        
        likesLabel = UILabel()
        likesLabel.text = "Likes"
        likesLabel.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(likesLabel)
    
        likesButton = UIButton()
        likesButton.setImage(UIImage(named: "heart"), for: .normal)
        likesButton.layer.cornerRadius = 10
        likesButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        likesButton.backgroundColor = Constants.lightGray
        view.addSubview(likesButton)
        
        whiteView = UIView()
        whiteView.backgroundColor = .white
        view.addSubview(whiteView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        followingTitle = UILabel()
        followingTitle.text = "Following"
        followingTitle.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(followingTitle)
        
        followingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        followingCollectionView.dataSource = self
        followingCollectionView.delegate = self
        followingCollectionView.register(HeroCollectionViewCell.self, forCellWithReuseIdentifier: followingCellReuseIdentifier)
        followingCollectionView.backgroundColor = .white
        followingCollectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        view.addSubview(followingCollectionView)
        
        bookmarksTitle = UILabel()
        bookmarksTitle.text = "Bookmarks"
        bookmarksTitle.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(bookmarksTitle)
        
        bookmarksCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        bookmarksCollectionView.dataSource = self
        bookmarksCollectionView.delegate = self
        // FIX CELL TYPE HERE
        bookmarksCollectionView.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: bookmarkCellReuseIdentifier)
        bookmarksCollectionView.backgroundColor = .white
        bookmarksCollectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        view.addSubview(bookmarksCollectionView)
        
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
        
        followingButton.snp.makeConstraints { make in
            make.right.equalTo(followingLabel.snp.left).offset(-Constants.mediumPadding)
            make.centerY.equalTo(blueView.snp.centerY)
            make.width.height.equalTo(50)
        }
        
        followingNumberLabel.snp.makeConstraints { make in
            make.left.equalTo(followingLabel)
            make.centerY.equalTo(followingButton).offset(-Constants.smallPadding)
        }
        
        followingLabel.snp.makeConstraints { make in
            make.right.equalTo(view.snp.centerX).offset(-Constants.largePadding)
            make.centerY.equalTo(followingButton).offset(Constants.mediumPadding)
        }
        
        whiteView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(blueView.snp.bottom)
        }
        
        followingTitle.snp.makeConstraints { make in
            make.left.equalTo(view).offset(titlePadding)
            make.top.equalTo(whiteView.snp.top).offset(titlePadding)
        }
        
        followingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(whiteView.snp.top).offset(35)
            make.left.right.equalTo(view)
            make.height.equalTo(collectionViewHeight)
        }
        
        bookmarksTitle.snp.makeConstraints { make in
            make.left.equalTo(view).offset(titlePadding)
            make.top.equalTo(followingCollectionView.snp.bottom).offset(10)
        }
        
        bookmarksCollectionView.snp.makeConstraints { make in
            make.top.equalTo(followingCollectionView.snp.bottom).offset(35)
            make.left.right.equalTo(view)
            make.height.equalTo(collectionViewHeight)
        }
        
        likesButton.snp.makeConstraints { make in
            make.left.equalTo(view.snp.centerX).offset(Constants.largePadding)
            make.centerY.equalTo(blueView.snp.centerY)
            make.width.height.equalTo(50)
        }
        
        likesNumberLabel.snp.makeConstraints { make in
            make.left.equalTo(likesButton.snp.right).offset(Constants.mediumPadding)
            make.centerY.equalTo(likesButton).offset(-Constants.smallPadding)
        }
        
        likesLabel.snp.makeConstraints { make in
            make.left.equalTo(likesNumberLabel)
            make.centerY.equalTo(likesButton).offset(Constants.mediumPadding)
        }
    }
    
    @objc func pushProfDetailsViewController(){
        if let indexPath = self.followingCollectionView.indexPathsForSelectedItems?.first{
            let prof = followings[indexPath.row]
            let detailsViewController = ProfDetailsViewController(profName: prof.name, profUsername: prof.username, profBio: prof.bio, profProfileImageName: prof.profileImageName)
            navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.followingCollectionView {
            return followings.count
        } else {
            return bookmarks.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.followingCollectionView {
            let profCell = followingCollectionView.dequeueReusableCell(withReuseIdentifier: followingCellReuseIdentifier, for: indexPath) as! HeroCollectionViewCell
            let prof = followings[indexPath.item]
            profCell.configure(for: prof)
            return profCell
        } else {
            let videoCell = bookmarksCollectionView.dequeueReusableCell(withReuseIdentifier: bookmarkCellReuseIdentifier, for: indexPath) as! VideoCollectionViewCell
            let bookmark = bookmarks[indexPath.item]
            //videoCell.configure(for: bookmark)
            return videoCell
        }  
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.followingCollectionView {
            pushProfDetailsViewController()
        } else {
            // push to video here
        }
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
