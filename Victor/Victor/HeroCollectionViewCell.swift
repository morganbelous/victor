//
//  HeroCollectionViewCell.swift
//  Victor
//
//  Created by Morgan Belous on 8/31/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit
import SnapKit

class HeroCollectionViewCell: UICollectionViewCell {
    
    var nameLabel: UILabel!
    var bioLabel: UILabel!
    var heroImageView: UIImageView!
    var profileImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // round corners
        self.contentView.layer.cornerRadius = 12.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        heroImageView = UIImageView()
        heroImageView.contentMode = .scaleAspectFill
        heroImageView.clipsToBounds = true
        contentView.addSubview(heroImageView)
        
        nameLabel = UILabel()
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        nameLabel.textColor = .white
        contentView.addSubview(nameLabel)
        
        profileImageView = UIImageView()
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 12
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.borderColor = Constants.lightBlue.cgColor
        contentView.addSubview(profileImageView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        heroImageView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(contentView)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(50)
            make.bottom.equalTo(contentView).offset(-5)
            make.height.width.equalTo(contentView.frame.width * 0.24)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView).offset(-5)
            make.left.equalTo(profileImageView.snp.right).offset(10)
        }
    }
    
    func configure(for prof: Professional){
        nameLabel.text = prof.name
        profileImageView.image = UIImage(named: prof.profileImageName)
        heroImageView.image = UIImage(named: prof.heroImageName)
    } 
}
