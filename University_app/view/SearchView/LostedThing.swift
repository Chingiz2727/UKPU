//
//  LostedThing.swift
//  University_app
//
//  Created by Чингиз on 10.08.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit

class LostedThing: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        subview()
        setup()
        setuplayout()
    }
    let searchBar : UIImageView = UIImageView()
    let bannerImageView : UIImageView = UIImageView()
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
        
        // avatarImageView.image = UIImage(named: "avatar")!
     
   
        
    }
    
    
    func subview()
    {
        
        self.backgroundColor = UIColor.white
        self.addSubview(bannerImageView)
        
    }
    func setuplayout ()
    {
        let isLandscape : Bool = UIDevice.current.orientation.isLandscape
        let bannerHeight : CGFloat = self.height * 0.3
        let avatarHeightMultipler : CGFloat = isLandscape ? 0.75 : 0.43
        bannerImageView.anchorAndFillEdge(.top, xPad: 0, yPad: 0, otherSize: bannerHeight)
}
}
