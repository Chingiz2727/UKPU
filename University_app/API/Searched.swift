
import UIKit
import Alamofire
import Foundation
import SwiftyJSON

@available(iOS 10.0, *)
class Searched {
        class func SearchTeachers(name:String,completion:@escaping(_ users:FindedUserInfo)->())
    {
        
        let url = MainParams().url
        UserApi.users { (userinfo) in
            let query = "select first_name,last_name,email,phone_mobile,login,middle_name from users where login='\(name)'"
            let params = [ "login" : userinfo.login!.dropLast(1),
                           "query" : query ,
                           "passwd" : userinfo.password ] as [String : Any]
            
            Alamofire.request(url!, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { response in
                if response.data != nil {
                    switch response.result
                    {
                    case .failure(let error):
                        print(error)
                    case .success(let value):
                        let json = JSON(value)
                        guard let dataarr = json["result"].arrayObject as? [String] else {
                            return
                        }
                        let us1 = FindedUserInfo()
                        us1.name = dataarr[0]
                        us1.surname = dataarr[1]
                        us1.email = dataarr[2]
                        us1.phone = dataarr[3]
                        us1.full = dataarr
                        completion(us1)
                    }
                }
            }
            )
        }
    }
    
}
