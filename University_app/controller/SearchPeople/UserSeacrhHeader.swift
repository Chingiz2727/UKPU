//
//  UserSeacrhHeader.swift
//  University_app
//
//  Created by Чингиз on 23.07.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit
class UserSearchHeader:UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        subview()
        setup()
        setuplayout()
    }
    let searchBar : UIImageView = UIImageView()
    let bannerImageView : UIImageView = UIImageView()
    let bannerMaskView : UIView = UIView()
    let nameLabel : UILabel = UILabel()
    
    let buttonContainerView2 : UIView = UIView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup()
    {
        bannerImageView.image = UIImage(named: "login")
        bannerImageView.contentMode = .scaleAspectFill
        bannerImageView.clipsToBounds = true
        bannerImageView.isUserInteractionEnabled=true
        bannerMaskView.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
   
        nameLabel.textColor = UIColor.white
        nameLabel.text = "Новости"
        nameLabel.numberOfLines = 2
        nameLabel.font = UIFont(name: "HelveticaNeue-Light", size: 33)
        
    }
    
    
    func subview()
    {
        self.backgroundColor = UIColor.white
        self.addSubview(bannerImageView)
        bannerImageView.addSubview(bannerMaskView)
        bannerImageView.addSubview(nameLabel)
        
    }
    func setuplayout ()
    {
        let isLandscape : Bool = UIDevice.current.orientation.isLandscape
        let bannerHeight : CGFloat = self.height * 0.22
        bannerImageView.anchorAndFillEdge(.top, xPad: 0, yPad: 0, otherSize: bannerHeight)
        bannerMaskView.fillSuperview()
        nameLabel.alignAndFillWidth(align: .toTheRightCentered, relativeTo: self.bannerMaskView, padding: 45, height: 120)
        nameLabel.setAnchor(top: bannerMaskView.bottomAnchor, left: bannerMaskView.leftAnchor, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 40, paddingBottom: 0, paddingRight: 0)
    }
    
}
