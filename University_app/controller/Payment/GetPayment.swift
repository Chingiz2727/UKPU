//
//  GetExams.swift
//  University_app
//
//  Created by Чингиз on 1/8/19.
//  Copyright © 2019 Чингиз. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GetPayment {
    class func get(completion:@escaping(_ exams:PaymentRange?)->()) {
        UserApi.users { (info) in
            
            let url = "http://89.40.60.206:8080/univercity-rs-server/service/billing"
            let id = info.id!
            let params = [
                "user_id":id
                ] as [String : Any]
            Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
                if response.data != nil {
                    switch response.result {
                    case.failure( let error):
                        print(error)
                    case.success(let val):
                        let json = JSON(val)
                        print(json)
                        guard let data = response.data else {return}
                        do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .useDefaultKeys
                            let root = try decoder.decode(PaymentRange.self, from: data)
                            completion(root)
                        }
                        catch {
                            print("Bigerrorbek")
                            print(error)
                        }
                        
                    }
                }
            }
        }
        
    }
}
