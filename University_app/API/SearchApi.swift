//
//  SearchApi.swift
//  University_app
//
//  Created by Чингиз on 15.06.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
@available(iOS 10.0, *)
class Search : NSObject {
    
    @available(iOS 10.0, *)
    @available(iOS 10.0, *)
    class func insertion(phone:String ,lostthingname:String,description:String,place:String,image:String,createdby:String,completion: @escaping(_ sucess:Bool?)->())
{
    let url = MainParams().url
    guard let user = APItoken.getapictoken() else {return}
    let login = (APItoken.getapictoken() as! NSString).integerValue
    UserApi.users { (userinfo) in

        let query =  "insert into lost_and_found (id,phone,lost_thing_name,description,place,created_by,finder_id,created,photo,deleted) values (nextval('s_lost_and_found'),'\(phone)','\(lostthingname)','\(description)','\(place)','\(userinfo.id!.dropFirst(1))','\(userinfo.id!.dropFirst(1))',now(),'\(image)','true')"
    let params = [
        "login" : user,
        "query" : query,
        "passwd": APItoken.getPassword()
        ]
    Alamofire.request(url!, method: .post, parameters: params, encoding: JSONEncoding.default , headers: nil).responseJSON { response in
        if let data = response.data
        {
            switch response.result
            {
            case.failure(let error):
            print(error)
            completion(false)
            case.success(let value):
            let json = JSON(value)
            print(json)
            completion(true)
            }
        }
    }
}
    }
}
