//
//  PaymentCollectionViewCell.swift
//  University_app
//
//  Created by Чингиз on 1/8/19.
//  Copyright © 2019 Чингиз. All rights reserved.
//

import UIKit

class PaymentCollectionViewCell: UICollectionViewCell {
    var first_t = UILabel()
    var img = UIImageView()
    var money = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        addview()
    }
    
    func addview() {
        self.addSubview(first_t)
        self.addSubview(img)
        self.addSubview(money)
        first_t.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 5)
        img.setAnchor(top: first_t.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,width: 40,height: 40)
        let centerimg = img.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        NSLayoutConstraint.activate([centerimg])
        money.setAnchor(top: img.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 5)
        money.textAlignment = .center
        first_t.textAlignment = .center
        money.font = UIFont.boldSystemFont(ofSize: 15)
        self.layer.borderWidth = 0.6
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
