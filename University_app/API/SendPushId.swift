//
//  SendPushId.swift
//  University_app
//
//  Created by Чингиз on 05.09.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class SendPushId {
    
    class func send(login:String,push_id:String) {
        let params = [
            "user_login":login,
            "push_id":push_id,
            "login":"system",
            "passwd": "fda0f1f49f35c4bf82153072e1414ce65ce30b32cf4e7b0c98edbdb597338d15" ]
        print(login)
        print(push_id)
        Alamofire.request("http://89.40.60.206:8080/univercity-rs-server/service/push", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200..<600).responseJSON { (response) in
            if response.data != nil {
                print(response.description)
                print(response.data)
                switch response.result {
                case.failure(let err):
                    print(err)
                    print("error")
                case.success(let val):
                    print("success")
                    let json = JSON(val)
         
                    print(json)
                }
            }
        }
    }
}
