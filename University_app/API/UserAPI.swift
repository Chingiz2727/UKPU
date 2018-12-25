//
//  UserAPI.swift
//  University_app
//
//  Created by Чингиз on 14.06.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

@available(iOS 10.0, *)
class UserApi {
    class func users(completion: @escaping (UserInfo)->()) {
        let mainUrl = MainParams().url
       guard let api_token = APItoken.getapictoken() else {return}
        let pass = APItoken.getPassword()
        let paramstring = [
            "login":api_token,
            "query":"select usr.id, usr.first_name,usr.last_name, usr.middle_name,usr.email,usr.user_type_id,usr.birth_date, usr.phone_mobile, photo.file_name from users usr left join user_photo photo on photo.user_id = usr.id where usr.login = '\(api_token)' and usr.deleted = false and usr.locked = false",
            "passwd":pass
            ]
  
        let userinfo = UserInfo()
        _ = [UserInfo]()
        Alamofire.request(mainUrl!, method:.post , parameters: paramstring , encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            if response.data != nil
            {
                switch response.result
                {
                case.failure(let error):
                    print(error)
                case.success(let value):
                    let json = JSON(value)
                    print(json)
                    guard let dataarr =  json["result"].arrayObject as? [Any] else {return}
                    if dataarr.count > 0 {
                        
                        UserId.id = dataarr[0] as? String
                        userinfo.id = dataarr[0] as? String
                        userinfo.name = dataarr[1] as? String
                        userinfo.surname = dataarr[2] as? String
                        userinfo.middlename = dataarr[3] as? String
                        userinfo.email = dataarr[4] as? String
                        userinfo.usertypeid = dataarr[5] as? String
                        userinfo.birthdate = dataarr[6]  as? String
                        userinfo.phone = dataarr[7]  as? String
                        userinfo.userimage = dataarr[8] as? String
                    }
                    print(dataarr)
                    completion(userinfo)
                }
            }
            }.downloadProgress { (progress) in
        }
 }
}
