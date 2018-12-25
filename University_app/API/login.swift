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
class Login: NSObject {
    class func login(email:String,password:String,completion:@escaping (_ type:String)->Void)
    {
        let mainUrl = MainParams().url
        let paramstring = [
            "login":email,
            "query":"select id,user_type_id from users where login='\(email)'",
            "passwd":password
        ]
        
        Alamofire.request(mainUrl!, method:.post , parameters: paramstring , encoding: JSONEncoding.default, headers: nil).responseJSON {
            
            response in
            if let data = response.data , let _ = String(data: data, encoding:.utf8)
            {
                let jes = JSON(data)
                guard (jes["result"].arrayObject as? [String]) != nil else {return}
                switch response.result
                {
                case.failure(let error): break
                    
                case.success(let value):
                    let json=JSON(value)
                    guard let dataarr = json["result"].arrayObject as? [String] else {return}
                 print(dataarr)
                    let type = dataarr[1]
                    completion(type)
                }
            }
            }.downloadProgress { (progress) in
        }
    }
}
