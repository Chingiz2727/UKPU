//
//  SendQuestion.swift
//  University_app
//
//  Created by Чингиз on 03.08.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


@available(iOS 10.0, *)
class Question : NSObject {
    
    class func askquestion (name:String,description:String) {
        let url = MainParams().url 
        let login = APItoken.getapictoken()
        let passwd = APItoken.getPassword()
        UserApi.users { (userinfo) in

            let query = "insert into question(id,created_by,description,created_time,creater_id,answered) values (nextval('s_question'),'\(name)','\(description)',now(),'\(userinfo.id!.dropFirst(1))','false')"
       let params = [
        "login" : login,
        "query" : query,
        "passwd" : passwd
        ] 
        print(query)
        Alamofire.request(url!, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
           if let data = response.data {
            switch response.result {
            case.success(let val):
                print(val)
            case .failure(let error):
                print(error)
            }  }
            
            }
        }
    }
}
