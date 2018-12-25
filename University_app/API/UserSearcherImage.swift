//
//  TeacherSearcherImage.swift
//  University_app
//
//  Created by Чингиз on 23.07.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

@available(iOS 10.0, *)
@available(iOS 10.0, *)
class SearchImage {
    @available(iOS 10.0, *)
    class func Image(name:String) {
        let url = MainParams().url
    UserApi.users { (userinfo) in
        let login = userinfo.login
        let passwd = userinfo.password
        let query = "select photo from user_photo inner join users on user_photo.user_id = users.id where users.login = '\(name)'"
            let params = [
                "login":APItoken.getapictoken()!,
                "query": query ,
                "passwd" : APItoken.getPassword()
            ]
      
        Alamofire.request(url!, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { (response) in
            if response.data != nil {
                switch response.result {
                case.failure(let error):
                    print(error)
                case.success(let value):
                    
                    let json = JSON(value)
                    print(query)
                    print(params)
                    print(json)
                    guard let dataarr = json["result"].arrayObject as? [String]  else {
                        return
                    }
                  
                    
                }
            }
        })
    }
    }
}
