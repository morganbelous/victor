//
//  SearchViewController.swift
//  Victor
//
//  Created by Morgan Belous on 8/18/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var searchCollectionView: UICollectionView!
    let userCellReuseIdentifier = "userCellReuseIdentifier"
    
    var users: [User] = []
    
    var headerPadding: CGFloat! = 75

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 123/255, green: 160/255, blue: 167/255, alpha: 1.0)
    
        let jack = User(name: "Jack", username: "jack123", bio: "I'm jack", profileImageName: "man")
        let morgan = User(name: "Morgan", username: "morgan326", bio: "I'm morgan", profileImageName: "woman")
        let sam = User(name: "Sam", username: "sam125", bio: "I'm sam", profileImageName: "woman")
        
        users = [jack, morgan, sam, jack, morgan, sam]
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        
        searchCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        searchCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: userCellReuseIdentifier)
        searchCollectionView.translatesAutoresizingMaskIntoConstraints = false
        searchCollectionView.backgroundColor = .white
//        searchCollectionView.layer.cornerRadius = 50.0
//        searchCollectionView.layer.borderWidth = 1.0
//        searchCollectionView.layer.borderColor = UIColor.clear.cgColor
//        searchCollectionView.layer.masksToBounds = true
        view.addSubview(searchCollectionView)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            searchCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: headerPadding),
            searchCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            searchCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userCellReuseIdentifier, for: indexPath) as! SearchCollectionViewCell
        cell.configure(user: users[indexPath.item])
        return cell
    }
}


extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = width  * 0.3
        return CGSize(width: width, height: height)
    }
}
