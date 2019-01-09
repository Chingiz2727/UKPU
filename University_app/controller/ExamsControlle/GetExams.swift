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

class GetExams {
    class func get(completion:@escaping(_ exams:Exams?)->()) {
        UserApi.users { (info) in
           
            let url = "https://ukpu-systems.kz/terminal/schedule.php"
            let id = info.id!
            let params = [
                "user_id":id
                ] as [String : Any]
            Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
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
                            let root = try decoder.decode(Exams.self, from: data)
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
