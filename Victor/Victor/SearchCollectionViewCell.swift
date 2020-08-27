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
        contentView.addSubview(nameLabel)
        
        bioLabel = UILabel()
        bioLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(bioLabel)
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .blue
        imageView.image = UIImage(named: "man")
        contentView.addSubview(imageView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.left.equalTo(contentView).offset(imagePadding)
            make.bottom.equalTo(contentView).offset(-imagePadding)
            make.width.equalTo(contentView.frame.width * 0.2)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView).offset(-textPadding)
            make.left.equalTo(imageView.snp.right).offset(textPadding)
        }
        
        bioLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView).offset(textPadding)
            make.left.equalTo(imageView.snp.right).offset(textPadding)
        }
    }
    
    func configure(for prof: Professional){
        nameLabel.text = prof.name
        bioLabel.text = prof.bio
        imageView.image = UIImage(named: prof.profileImageName)
    }
}
