//
//  GetSemester.swift
//  University_app
//
//  Created by Чингиз on 25.07.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

@available(iOS 10.0, *)
class GetQuestionList
{
    class func get(completion:@escaping(_ semestr:[QuestionData])->Void){
        let url = MainParams().url
        
            let passwd = APItoken.getPassword()
            let login = APItoken.getapictoken()
            
            let query = "select description,answer from question where answered='true'"
            let params  = [
                "login":login ,
                "query":query,
                "passwd":passwd
                ] 
            
            Alamofire.request(url!, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
                if response.data != nil {
                    
                    switch response.result
                    {
                    case.failure(let error):
                        print(error)
                    case.success(let value):
                        var json = JSON(value)
                        print(json)
                        guard let dataar = json["result"].arrayObject as? [String] else {return}
                        var sem = [QuestionData]()
                        print(dataar)
                        let maininf = dataar.chunked(by: 2)
                        for info in maininf {
                            if let information = info as? [String] {
                                let question : String = {
                                    if let question = information[0] as? String {
                                        return question
                                    }
                                    return "No"
                                }()
                                let answer : String = {
                                    if let answer = information[1] as? String {
                                        return answer
                                    }
                                    return "No"
                                }()
                                sem.append(QuestionData(question: question, answer: answer))
                            }
                        }
                        completion(sem)
                    }
                }
            }
        
    }
    
}
