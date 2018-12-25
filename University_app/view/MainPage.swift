//
//  MainPage.swift
//  University_app
//
//  Created by Чингиз on 05.05.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


@available(iOS 10.0, *)
class MainPage: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        subview()
        setup()
        returnimg()
        setuplayout()
    }
    var photouploading : (() -> Void)?
    let photobutton : UIButton = UIButton()
    let searchBar : UIImageView = UIImageView()
    let bannerImageView : UIImageView = UIImageView()
    let bannerMaskView : UIView = UIView()
    var avatarImageView = UIImageView(frame: CGRect(x: 30, y: 80, width: 120, height: 120))
    let nameLabel : UILabel = UILabel()
    let photoupload : UIImageView = UIImageView()
    let buttonContainerView2 : UIView = UIView()
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup()
    {
    
        bannerMaskView.backgroundColor = UIColor(white: 0.0, alpha: 0.4)
        avatarImageView.layer.borderWidth = 1.0
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width/2
        avatarImageView.image = UIImage(named: "avatar")
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.masksToBounds = false
        avatarImageView.clipsToBounds = true
//        avatarImageView.contentMode = .scaleAspectFill
      
        
        nameLabel.textColor = UIColor.white
        nameLabel.text = "hello"
        nameLabel.numberOfLines = 2
        nameLabel.font = UIFont(name: "HelveticaNeue-Light", size: 33)
        
    }
    @objc func upload(){
        photouploading?()
    }
    
    func subview()
    {
        self.backgroundColor = UIColor.white
        self.addSubview(bannerImageView)
        bannerImageView.addSubview(bannerMaskView)
        bannerImageView.addSubview(avatarImageView)
        bannerImageView.addSubview(nameLabel)
        bannerImageView.addSubview(photobutton)
    }
    func setuplayout ()
    {
        let isLandscape : Bool = UIDevice.current.orientation.isLandscape
        let bannerHeight : CGFloat = self.height * 0.4
        let avatarHeightMultipler : CGFloat = isLandscape ? 0.75 : 0.43
        let avatarSize = bannerHeight * avatarHeightMultipler * 0.94
        bannerImageView.anchorAndFillEdge(.top, xPad: 0, yPad: 0, otherSize: bannerHeight)
        bannerMaskView.fillSuperview()
      //  photoupload.setAnchor(top: nil, left: nil, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 20, width: 30, height: 30)
//        avatarImageView.setAnchor(top: nil, left: bannerImageView.leftAnchor, bottom: bannerImageView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 20, paddingRight: 0)
        
        nameLabel.setAnchor(top: avatarImageView.topAnchor, left: avatarImageView.rightAnchor, bottom: nil, right: bannerImageView.rightAnchor, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
       
      }
    @objc func button() {
        print("coool")
    }
    
    func returnimg() {
        UserApi.users { (userinfo) in
            if userinfo.userimage != nil {
                Alamofire.request("http://89.40.60.206\(userinfo.userimage!)").responseData { (response) in
                    print(response.data)
                    self.avatarImageView.image = UIImage(data: response.data!)
                    self.bannerImageView.image = UIImage(data: response.data!)
                }
            }
        
            }
        }
    }

