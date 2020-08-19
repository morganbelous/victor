//
//  SearchCollectionViewCell.swift
//  Victor
//
//  Created by Morgan Belous on 8/19/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    var nameLabel: UILabel!
    var bioLabel: UILabel!
    var imageView: UIImageView!
    
    var imagePadding: CGFloat! = 20
    var textPadding: CGFloat! = 10
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        nameLabel = UILabel()
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        bioLabel = UILabel()
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(bioLabel)
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        imageView.image = UIImage(named: "man")
        contentView.addSubview(imageView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: imagePadding),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: imagePadding),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -imagePadding),
            imageView.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.2)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -textPadding),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: textPadding)
        ])
        
        NSLayoutConstraint.activate([
            bioLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: textPadding),
            bioLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: textPadding)
        ])
    }
    
    func configure(user: User){
        nameLabel.text = user.name
        bioLabel.text = user.bio
        imageView.image = UIImage(named: user.profileImageName)
    }
}
