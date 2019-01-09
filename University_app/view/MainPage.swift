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
class MainPage: UITableViewCell {
  
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        subview()
        setup()
        returnimg()
        setuplayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var photouploading : (() -> Void)?
    let photobutton : UIButton = UIButton()
    let searchBar : UIImageView = UIImageView()
    let bannerImageView : UIImageView = UIImageView()
    let bannerMaskView : UIView = UIView()
    var avatarImageView = UIImageView()
    let nameLabel : UILabel = UILabel()
    let photoupload : UIImageView = UIImageView()
    let buttonContainerView2 : UIView = UIView()
   

    func setup()
    {
    
        bannerMaskView.backgroundColor = UIColor(white: 0.0, alpha: 0.4)
        
        avatarImageView.frame = CGRect(x: 20, y: 50, width: 100, height: 100)

        avatarImageView.layer.borderWidth = 1.0
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width/2
        avatarImageView.image = UIImage(named: "avatar")

        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.masksToBounds = true
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill
      
        
        nameLabel.textColor = UIColor.white
        nameLabel.text = "user"
        nameLabel.numberOfLines = 2
        nameLabel.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        
    }
    @objc func upload(){
        photouploading?()
    }
    
    func subview()
    {
        self.backgroundColor = UIColor.white
        self.addSubview(bannerImageView)
        bannerImageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
       
        bannerImageView.addSubview(bannerMaskView)
        bannerImageView.addSubview(avatarImageView)
        bannerImageView.addSubview(nameLabel)
        bannerImageView.contentMode = .scaleAspectFill
        bannerImageView.layer.masksToBounds = true
        bannerImageView.clipsToBounds = true
        self.addSubview(photobutton)
        let image = UIImage(named: "photo")
        photobutton.setImage(image!, for: .normal)
         bannerMaskView.setAnchor(top: bannerImageView.topAnchor, left: bannerImageView.leftAnchor, bottom: bannerImageView.bottomAnchor, right: bannerImageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        photobutton.setAnchor(top: nil, left: nil, bottom: bannerImageView.bottomAnchor, right: bannerImageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 7, paddingRight: 7, width: 30, height: 30)
    }
    func setuplayout ()
    {
        let isLandscape : Bool = UIDevice.current.orientation.isLandscape
        let bannerHeight : CGFloat = self.height * 0.4
        let avatarHeightMultipler : CGFloat = isLandscape ? 0.75 : 0.43
        nameLabel.setAnchor(top: avatarImageView.topAnchor, left: avatarImageView.rightAnchor, bottom: nil, right: bannerImageView.rightAnchor, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
     
      }
    @objc func button() {
        print("coool")
    }
    
    func returnimg() {
        UserApi.users { (userinfo) in
            if userinfo.userimage != nil {
                Alamofire.request("http://89.40.60.206\(userinfo.userimage!)").responseData { (response) in
                    self.avatarImageView.image = UIImage(data: response.data!)
                    self.bannerImageView.image = UIImage(data: response.data!)
                }
                self.nameLabel.text = userinfo.name!
            }
        
            }
        }
    }

