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
@available(iOS 10.0, *)
class GetSemester
{
    class func get(semestr:String,completion:@escaping(_ semestr:[Subject])->Void){
        let url = MainParams().url
        UserApi.users { (user) in
            let passwd = APItoken.getPassword()!
            let login = APItoken.getapictoken()!
           
            let query = "select subject.name_ru, subject.id from subject inner join semester_subject on subject.id = semester_subject.subject_id inner join student_subject on student_subject.subject_id=semester_subject.id inner join semester_data on student_subject.semester_data_id = semester_data.id inner join student_education on student_subject.student_id = student_education.id where student_education.student_id = '\(user.id!)' and student_subject.semester_data_id ='\(semestr)'"
            let params  = [
                            "login":login ,
                           "query":query,
                           "passwd":passwd
                ] 
            print(query)
            print(params)
            Alamofire.request(url!, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
                if response.data != nil {
                    
                    switch response.result
                    {
                    case.failure(let error):
                        print(error)
                    case.success(let value):
                        var json = JSON(value)
                        guard let dataar = json["result"].arrayObject as? [String] else {return}
                        var sem = [Subject]()
                        print(json)
                        let maininf = dataar.chunked(by: 2)
                        for info in maininf {
                            if let information = info as? [String] {
                                let id : String = {
                                    if let id = information[1] as? String {
                                        return id
                                    }
                                    return "No"
                                }()
                                let name : String = {
                                    if let name = information[0] as? String {
                                        return name
                                    }
                                    return "No"
                                }()
                                sem.append(Subject(subj_id: id, subj_name: name))
                            }
                        }
                        completion(sem)
                    }
                }
            }
        }
        }
    
}
