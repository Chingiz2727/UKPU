//
//  API.swift
//  University_app
//
//  Created by Чингиз on 21.05.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
@available(iOS 10.0, *)
class API: NSObject {
    class func login(email:String,password:String,completion:@escaping (_ fail:Bool,_ success:Bool)->Void)
    {
        let mainUrl = MainParams().url
        let paramstring = [
            "login":email,
            "query":"select id,user_type_id from users where login='\(email)'",
            "passwd":password
        ]
        print(paramstring)
        print(mainUrl)
        Alamofire.request(mainUrl!, method:.post , parameters: paramstring , encoding: JSONEncoding.default, headers: nil).responseJSON {
            
            response in
            if let data = response.data , let _ = String(data: data, encoding:.utf8)
            {
                let jes = JSON(data)
                print(jes)
                guard let dataarr = jes["result"].arrayObject as? [String] else {return}
            switch response.result
            {
            case.failure(let error):
                print(error)
                
                case.success(let value):
                let json=JSON(value)
                print(json)
                guard let dataarr = json["result"].arrayObject as? [String] else {return}
                if dataarr[0] != "" {
                    APItoken.saveapitoken(token: email, password: password)
                    
                    completion(false,true)
                }
                else {
                    completion(true,false)

                }
                
            }
        }
            }.downloadProgress { (progress) in
        }
}
}
