//
//  APItoken.swift
//  University_app
//
//  Created by Чингиз on 21.05.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class APItoken: UINavigationController {
    let window = UIApplication.shared.keyWindow

    override func viewDidLoad() {
        super.viewDidLoad()
        restartapp()
    }
     func restartapp() {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        guard UIApplication.shared.keyWindow != nil else {return}
        if APItoken.getapictoken() != nil {
        Login.login(email: APItoken.getapictoken()!, password: APItoken.getPassword()!) { (type) in
            print(type)
            if type == "2"{
                self.window?.rootViewController =  TabBarController()
            }
            else {
                
                self.window?.rootViewController =  TeacherTabBar()
            }
        }
        }
        else {
            self.window?.rootViewController = LoginController()
        }
    }
    class func saveapitoken(token:String,password:String)
    {
        let def = UserDefaults.standard
        def.set(token, forKey: "user-tken")
        def.set(password, forKey: "passwrd")
        def.synchronize()
//        self.restartapp()
    }

    
    class func getapictoken() -> String?
    {
        let def = UserDefaults.standard
        return def.object(forKey: "user-tken") as? String
    }
    class func getPassword() -> String?
    {
        let def = UserDefaults.standard
        return def.object(forKey: "passwrd") as? String
    }
    
}
