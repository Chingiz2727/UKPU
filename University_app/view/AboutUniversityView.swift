//
//  MainPage.swift
//  University_app
//
//  Created by Чингиз on 05.05.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
import UIKit

class AboutUniversityVIew : UIView
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        subview()
        setup()
        setuplayout()
    }
    
    var tabbarcnt : UITabBarController!
    let bannerImageView : UIImageView = UIImageView()
    let bannerMaskView : UIView = UIView()
    let buttonContainerView2 : UIView = UIView()
    let facebookb : UIButton = UIButton()
    let instagramb : UIButton = UIButton()
    let twitterb : UIButton = UIButton()
    let vkontakteb : UIButton = UIButton()
    
    let youtubeb : UIButton = UIButton()
    
    
    let adresslabel : UILabel = {
        let adress = UILabel()
        adress.numberOfLines = 9
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)]
        let attributedString = NSMutableAttributedString(string: "Адрес:", attributes:attrs)
        let text = NSMutableAttributedString(string: "\nШымкент қаласы Токаева 27 'A'")
        attributedString.append(text)
        adress.font = UIFont.systemFont(ofSize: 15)
        adress.attributedText = attributedString
        return adress
    }()
    let Phone : UILabel = {
        let adress = UILabel()
        adress.numberOfLines = 2
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)]
        let attributedString = NSMutableAttributedString(string: "Телефон:", attributes:attrs)
        let text = NSMutableAttributedString(string: "\n8 (7252) 537 152 , 8 (7252) 536 782")
        attributedString.append(text)
        adress.font = UIFont.systemFont(ofSize: 15)
        adress.attributedText = attributedString
        return adress
    }()
    let Fax : UILabel = {
        let adress = UILabel()
        adress.numberOfLines = 2
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)]
        let attributedString = NSMutableAttributedString(string: "Факс:", attributes:attrs)
        let text = NSMutableAttributedString(string: "\n8 (8252) 530 040")
        attributedString.append(text)
        adress.font = UIFont.systemFont(ofSize: 15)
        
        adress.attributedText = attributedString
        return adress
    }()
    let Email : UILabel = {
        let adress = UILabel()
        adress.numberOfLines = 2
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)]
        let attributedString = NSMutableAttributedString(string: "Email:", attributes:attrs)
        let text = NSMutableAttributedString(string: "\nukpu_kaz@mail.ru")
        attributedString.append(text)
        adress.font = UIFont.systemFont(ofSize: 15)
        adress.attributedText = attributedString
        return adress
    }()
    let Site : UILabel = {
        let adress = UILabel()
        adress.numberOfLines = 2
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)]
        let attributedString = NSMutableAttributedString(string: "Сайт:", attributes:attrs)
        let text = NSMutableAttributedString(string: "\nwww.ukpu.kz")
        attributedString.append(text)
        adress.font = UIFont.systemFont(ofSize: 15)
        adress.attributedText = attributedString
        return adress
    }()
    

   
    let Social : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Біз әлеуметтік желідеміз:"
        return label
    }()
    var socialview : UIView = UIView()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup()
    {
        bannerImageView.image = UIImage(named: "login")
        bannerImageView.contentMode = .scaleAspectFill
        bannerImageView.clipsToBounds = true
        bannerMaskView.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        buttonContainerView2.backgroundColor = UIColor.clear
        
    }
    func subview()
    {
        self.backgroundColor = UIColor.white
        self.addSubview(bannerImageView)
        bannerImageView.addSubview(bannerMaskView)
        self.addSubview(buttonContainerView2)
        buttonContainerView2.addSubview(Phone)
        buttonContainerView2.addSubview(adresslabel)
        buttonContainerView2.addSubview(Fax)
        buttonContainerView2.addSubview(Email)
        buttonContainerView2.addSubview(Site)
        self.addSubview(Social)
        self.addSubview(socialview)
        socialview.addSubview(facebookb)
        socialview.addSubview(instagramb)
        socialview.addSubview(twitterb)
        socialview.addSubview(youtubeb)
        socialview.addSubview(vkontakteb)
    }
    func setuplayout ()
    {
        let bannerHeight : CGFloat = self.height * 0.27
        bannerImageView.anchorAndFillEdge(.top, xPad: 0, yPad: 0, otherSize: bannerHeight)
        buttonContainerView2.alignAndFillWidth(align: .underCentered, relativeTo: bannerImageView, padding: 0, height: 240)
        buttonContainerView2.groupAndFill(group: .vertical, views: [adresslabel,Phone,Email,Fax,Site], padding: 1)
        buttonContainerView2.setAnchor(top: bannerImageView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 15, paddingBottom: 0, paddingRight: 0)
     
       
        Social.setAnchor(top: Site.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        socialview.setAnchor(top: Social.bottomAnchor, left: facebookb.leftAnchor, bottom: facebookb.bottomAnchor, right: twitterb.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        facebookb.setAnchor(top: socialview.topAnchor, left: socialview.leftAnchor, bottom: nil, right: instagramb.leftAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, width: 30, height: 30)
        instagramb.setAnchor(top: socialview.topAnchor, left: facebookb.rightAnchor, bottom: nil, right: vkontakteb.leftAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, width: 30, height: 30)
        vkontakteb.setAnchor(top:socialview.topAnchor, left: instagramb.rightAnchor, bottom: nil, right: youtubeb.leftAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, width: 30, height: 30)
        youtubeb.setAnchor(top: socialview.topAnchor, left: vkontakteb.rightAnchor, bottom: nil, right: twitterb.leftAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, width: 30, height: 30)
        twitterb.setAnchor(top: socialview.topAnchor, left: youtubeb.rightAnchor, bottom: nil, right: socialview.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 30, height: 30)
        vkontakteb.setImage(UIImage(named: "vk"), for: .normal)
        youtubeb.setImage(UIImage(named: "youtube"), for: .normal)
        twitterb.setImage(UIImage(named: "twitter"), for: .normal)
        facebookb.setImage(UIImage(named: "facebook"), for: .normal)
        instagramb.setImage(UIImage(named: "instagram"), for: .normal)
        facebookb.tag = 0
        instagramb.tag = 1
        vkontakteb.tag = 2
        youtubeb.tag = 3
        twitterb.tag = 4
        
        vkontakteb.contentMode = .scaleAspectFit
        youtubeb.contentMode = .scaleAspectFit
        twitterb.contentMode = .scaleAspectFit
        facebookb.contentMode = .scaleAspectFit
        instagramb.contentMode = .scaleAspectFit
        let centerXLabel = socialview.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        NSLayoutConstraint.activate([centerXLabel])
    }
    
}
