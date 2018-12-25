//
//  TeacherView.swift
//  University_app
//
//  Created by Чингиз on 06.06.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit

class TeacherView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        subview()
        setup()
        rect()
        setuplayout()
    }
    let searchBar : UIImageView = UIImageView()
    let bannerImageView : UIImageView = UIImageView()
    let bannerMaskView : UIView = UIView()
    let avatarImageView : UIImageView = UIImageView()
    let nameLabel : UILabel = UILabel()
    
    let buttonContainerView2 : UIView = UIView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup()
    {
        bannerImageView.image = UIImage(named: "avatar")
        bannerImageView.contentMode = .scaleAspectFill
        bannerImageView.clipsToBounds = true
        bannerImageView.isUserInteractionEnabled=true
        bannerMaskView.backgroundColor = UIColor(white: 0.0, alpha: 0.4)
        
        // avatarImageView.image = UIImage(named: "avatar")!
        avatarImageView.layer.cornerRadius = 50.0
        avatarImageView.image = UIImage(named: "avatar")
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 2.0
        avatarImageView.clipsToBounds = true
        
        
        nameLabel.textColor = UIColor.white
        nameLabel.text = "hello"
        nameLabel.numberOfLines = 2
        nameLabel.font = UIFont(name: "HelveticaNeue-Light", size: 33)
        
    }
    
    
    func subview()
    {
        
        self.backgroundColor = UIColor.white
        self.addSubview(bannerImageView)
        bannerImageView.addSubview(bannerMaskView)
        bannerImageView.addSubview(avatarImageView)
        bannerImageView.addSubview(nameLabel)
        
    }
    func setuplayout ()
    {
        let isLandscape : Bool = UIDevice.current.orientation.isLandscape
        let bannerHeight : CGFloat = self.height * 0.22
        bannerImageView.anchorAndFillEdge(.top, xPad: 0, yPad: 0, otherSize: bannerHeight)
        bannerMaskView.fillSuperview()
        avatarImageView.anchorInCorner(.bottomLeft, xPad: 25, yPad: 25, width: 100, height: 100)
        nameLabel.alignAndFillWidth(align: .toTheRightCentered, relativeTo: avatarImageView, padding: 45, height: 120)
    }
    

   
    func rect() {
            let hex = AboutTeacher.image.dropFirst(2)
         print("hex",hex)
            if let hexdata = Data(hexString: hex) {
                let image = UIImage(data: hexdata)
                self.bannerImageView.image = image
                self.avatarImageView.image = image
            
        }
    }
}

