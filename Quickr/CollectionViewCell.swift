//
//  CollectionViewCell.swift
//  UI
//
//  Created by 김준우 on 2015. 6. 29..
//  Copyright (c) 2015년 김준우. All rights reserved.
//

import UIKit

class CollectionViewCell : UICollectionViewCell {
    var imageView: UIImageView!
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*2/3))
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        contentView.addSubview(imageView)
        
        self.contentView.layer.cornerRadius = frame.width / 2.0
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

