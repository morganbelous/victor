//
//  VideoCollectionViewCell.swift
//  Victor
//
//  Created by Morgan Belous on 9/6/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .blue
        
        // round corners
        self.contentView.layer.cornerRadius = 12.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }  
}
