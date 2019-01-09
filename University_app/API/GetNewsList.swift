//
//  GetNewsList.swift
//  University_app
//
//  Created by Чингиз on 06.08.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
@available(iOS 10.0, *)
class GetNewsList {
    class func getNews (completion:@escaping([NewsList])->Void) {
        let name = APItoken.getapictoken()
        let password = APItoken.getPassword()
        let query = "select topic, news_body, created from news_semester"
        let params = [
            "login" : name,
            "query" : query ,
            "passwd" : password
        ]
        Alamofire.request(MainParams().url!, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.data != nil {
                switch response.result
                {
                case.failure(let err):
                    print(err)
                case.success(let val):
                    let json = JSON(val)
                    guard let dataarr = json["result"].arrayObject as? [String] else {return}
                    var news = [NewsList]()
                    let data = dataarr.chunked(by: 3)
                    print(json)
                    for item in data {
                        if let information = item as? [String] {
                            let topic : String = {
                               if let topic = information[0] as? String
                                {
                                    return topic
                                    
                                }
                               return "no"
                            }()
                            let body : String = {
                                if let topic = information[1] as? String
                                {
                                    return topic
                                    
                                }
                                return "no"
                            }()
                            let time : String = {
                                if let topic = information[2] as? String
                                {
                                    return topic
                                    
                                }
                                return "no"
                            }()
                            news.append(NewsList(title: topic, theme: body, time: time))
                        }
                    }
                    completion(news)
                    
                }
            }
        }
        
    }
}
