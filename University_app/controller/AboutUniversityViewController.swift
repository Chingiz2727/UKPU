//
//  AboutUniversityViewController.swift
//  University_app
//
//  Created by Чингиз on 24.05.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class AboutUniversityViewController: UIViewController {
    
    var about : AboutUniversityVIew!
    var tab : TabBarController!
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainView = AboutUniversityVIew(frame:view.frame)
        self.about = mainView
        view.addSubview(about)
        navigationItem.title = "Наш Университет"
        view.backgroundColor = UIColor.white
        about.facebookb.addTarget(self, action: #selector(go(sender:)), for: .touchUpInside)
        about.instagramb.addTarget(self, action: #selector(go(sender:)), for: .touchUpInside)
        about.twitterb.addTarget(self, action: #selector(go(sender:)), for: .touchUpInside)
        about.youtubeb.addTarget(self, action: #selector(go(sender:)), for: .touchUpInside)
        about.vkontakteb.addTarget(self, action: #selector(go(sender:)), for: .touchUpInside)
    }
    
   @objc func go(sender:UIButton){
        var instagramHooks:String?
       
        switch sender.tag {
        case 0:
            instagramHooks = "https://www.facebook.com/profile.php?id=100022144383784"
        case 1:
            instagramHooks = "https://www.instagram.com/swiu.kz/"
        case 2:
            instagramHooks = "https://vk.com/ukpu_kz"
        case 3:
            instagramHooks = "https://www.youtube.com/channel/UCkswfdAanGmYgufAU41XnQw"
        case 4:
            instagramHooks = ""
        default:
            break
        }
        let instagramUrl = NSURL(string: instagramHooks!)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
            UIApplication.shared.openURL(instagramUrl! as URL)
        } else {
            switch sender.tag {
            case 0:
                instagramHooks = "https://www.facebook.com/profile.php?id=100022144383784"
            case 1:
                instagramHooks = "https://www.instagram.com/swiu.kz/"
            case 2:
                instagramHooks = "https://vk.com/ukpu_kz"
            case 3:
                instagramHooks = "https://www.youtube.com/channel/UCkswfdAanGmYgufAU41XnQw"
            case 4:
                instagramHooks = ""
            default:
                break
            }
            UIApplication.shared.openURL(NSURL(string: instagramHooks!)! as URL)
        }
    }
}
