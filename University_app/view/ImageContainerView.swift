//
//  ImageContainerView.swift
//  University_app
//
//  Created by Чингиз on 22.05.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
import Neon
class ImageContainerView: UIView {
    let imageView : UIImageView = UIImageView()
    let label : UILabel = UILabel()
    
    convenience init() {
        self.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 0
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor(white: 0.68, alpha: 1.0).cgColor
        self.clipsToBounds = true
        self.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        self.addSubview(imageView)
        label.textAlignment = .left
        label.isUserInteractionEnabled = true
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.anchorAndFillEdge(.top, xPad: 0, yPad: 0, otherSize: height * 0.6)
        imageView.anchorToEdge(.left, padding: 10, width: 30, height: 30)
        label.anchorAndFillEdge(.left, xPad: 10, yPad: 10, otherSize: self.height)
        label.alignAndFillHeight(align: .underMatchingLeft, relativeTo: imageView, padding: 0, width: 120)
        label.anchorToEdge(.left, padding: 60, width: self.width, height: self.height)
        
    }
}
