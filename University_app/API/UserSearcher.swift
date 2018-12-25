//
//  TeacherSearcher.swift
//  University_app
//
//  Created by Чингиз on 22.06.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
import SwiftyJSON

@available(iOS 10.0, *)
class TeacherSearcher {

    class func SearchTeachers(name:String,completion:@escaping(_ users:[TeacherInfo]?)->Void)
    {
        var array = [TeacherInfo]()
        let url = MainParams().url
        UserApi.users { (userinfo) in
            let query = "select usr.first_name, usr.last_name, usr.email, usr.phone_mobile, usr.login, case when ph.file_name is null then '/files/photos/avatar.jpg' else ph.file_name end file_name from v_student usr left join user_photo ph on ph.user_id = usr.id where (usr.first_name like '%\(name)%' or usr.last_name like '%\(name)%')"
            let params = [ "login" : APItoken.getapictoken()!,
                        "query" : query ,
                        "passwd" : APItoken.getPassword()! ] as [String : Any]
           
            Alamofire.request(url!, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { response in
                if response.data != nil {
                    switch response.result
                    {
                    case .failure(let error):
                        print(error)
                    case .success(let value):
                        let json = JSON(value)

                        guard let dataarr =  json["result"].arrayObject as? [Any] else {return}
                       
                        let info = dataarr
                        let maininfo = info.chunked(by: 6)
                        for info in maininfo {
                           if let information = info as? [String]
                           {
                            let Name : String = {
                                var nameStr: String = (information[0] as? String)!
                                return nameStr
                                if nameStr.isEmpty{
                                    return ""
                                }
                            }()
                            let SurName : String = {
                                let nameStr:String = (information[1] as? String)!
                                return nameStr
                                if nameStr.isEmpty {
                                    return ""
                                }
                            }()
                            let Email : String = {
                                var nameStr:String = (information[2] as? String)!
                                return nameStr
                                if nameStr.isEmpty {
                                    return ""
                                }
                            }()
                            let Phone : String = {
                                var nameStr:String = (information[3] as? String)!
                                return nameStr
                                if nameStr.isEmpty {
                                    return ""
                                }
                            }()
                            let Login : String = {
                                var nameStr:String = (information[4] as? String)!
                                return nameStr
                                if nameStr.isEmpty {
                                    return ""
                                }
                            }()
//                            if let x = information[5] as? String{
//                                print(x)
//                            }else{
//                                print("null")
//                            }
                            var middle : Any = {
                                let image = information[5] as? Any
                                if image is NSNull {
                                    return "/files/photos/avatar.jpg"
                                }
                                if (image != nil) {
                                    return image!
                                }
                                return ""
                            }()
                            
                            if middle is NSNull {
                                middle = "/files/photos/avatar.jpg"
                            }
                           
                            array.append(TeacherInfo(name: Name, surname: SurName, login: Login, email: Email, phone: Phone, middle: middle as! String,array:info as! [String]))
                            }
                          
                            }
                        completion(array)
                    }
                }
            }
            )
            }
    }

}
