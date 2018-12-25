//
//  GetLessons.swift
//  University_app
//
//  Created by Чингиз on 26.07.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit
import Alamofire
import  SwiftyJSON
class GetLessons: NSObject {
    @available(iOS 10.0, *)
    @available(iOS 10.0, *)
    class func Lesson(day:String , completion:@escaping(_ lesson:[ScheduleData])->Void) {
        let url = MainParams().url!
        var lessonnes = [ScheduleData]()
            let query = "SELECT subj.name_ru, room.room_no,teacher.FIO,times.begin_time,times.end_time FROM schedule_detail schedule INNER JOIN subject subj ON schedule.subject_id = subj.id INNER JOIN room ON room.id = schedule.room_id INNER JOIN (SELECT teach.id, trim(teach.LAST_NAME || ' ' || teach.FIRST_NAME || ' ' || coalesce(teach.MIDDLE_NAME, '')) FIO FROM users teach INNER JOIN employee empl ON empl.id = teach.id ) teacher ON teacher.id = schedule.teacher_id INNER JOIN (SELECT lesson_time.id,begin.time_name begin_time,end_time.time_name end_time FROM lesson_time INNER JOIN time begin ON begin.id = lesson_time.begin_time_id INNER JOIN time end_time ON end_time.id = lesson_time.end_time_id) times ON times.id = schedule.lesson_time_id INNER JOIN week_day day ON schedule.week_day_id = day.id INNER JOIN student_education st_edu ON st_edu.groups_id = schedule.group_id INNER JOIN student stu ON st_edu.student_id = stu.id AND st_edu.child_id IS NULL INNER JOIN users usr ON usr.id = stu.id INNER JOIN semester_data sem_data ON sem_data.id = schedule.semester_data_id WHERE CURRENT_DATE BETWEEN sem_data.begin_date AND sem_data.end_date AND usr.login='\(APItoken.getapictoken()!)' and lower(day.day_name_ru)='\(day)' ORDER BY times.begin_time".lowercased()
        let passwd = APItoken.getPassword()
        let params = [
            "login" : APItoken.getapictoken(),
            "query" : query,
            "passwd" : passwd
            ] 
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.data != nil {
                switch response.result {
                case.failure(let error):
                    print(error)
                case.success(let value):
                    let json = JSON(value)
                    print(json)
                    guard let dataarr = json["result"].arrayObject as? [String] else {return}
                    print(dataarr)
                    var maininfo = dataarr.chunked(by: 5)
                    for info in maininfo {
                        if let information = info as? [String]
                        {
                            let Name : String = {
                                if let nameStr = information[0] as? String {
                                    return nameStr as! String
                                }
                                return "No"
                            }()
                            let SurName : String = {
                                if let nameStr = information[1] as? String {
                                    return nameStr as! String
                                }
                                return "No"
                            }()
                            let Email : String = {
                                if let nameStr = information[2] as? String {
                                    return nameStr as! String
                                }
                                return "No"
                            }()
                            let Phone : String = {
                                if let nameStr = information[3] as? String {
                                    return nameStr as! String
                                }
                                return "No"
                            }()
                            let Login : String = {
                                if let nameStr = information[4] as? String {
                                    return nameStr as! String
                                }
                                return "No"
                            }()
                            lessonnes.append(ScheduleData(name: Name, room: SurName, Teacher: Email, Start: Phone, End: Login))
                        }
                    }
                    completion(lessonnes)
                }
            }
        }
    }
}
class GetTeacherLesson: NSObject {
    @available(iOS 10.0, *)
    @available(iOS 10.0, *)
    class func Lesson(day:String , completion:@escaping(_ lesson:[ScheduleData])->Void) {
        let url = MainParams().url!
        var lessonnes = [ScheduleData]()
        let query = "SELECT subj.name_ru, room.room_no, gr.name group_name, times.begin_time, times.end_time FROM schedule_detail schedule_det INNER JOIN subject subj ON schedule_det.subject_id = subj.id INNER JOIN room ON room.id = schedule_det.room_id INNER JOIN groups gr ON gr.id = schedule_det.group_id INNER JOIN week_day day ON schedule_det.week_day_id = day.id INNER JOIN semester_data sem_data ON sem_data.id = schedule_det.semester_data_id INNER JOIN users usr ON usr.id = schedule_det.teacher_id INNER JOIN (SELECT lesson_time.id,begin.time_name begin_time,end_time.time_name end_time FROM lesson_time INNER JOIN time begin ON begin.id = lesson_time.begin_time_id INNER JOIN time end_time ON end_time.id = lesson_time.end_time_id) times ON times.id = schedule_det.lesson_time_id WHERE CURRENT_DATE BETWEEN sem_data.begin_date AND sem_data.end_date AND lower(day.day_name_ru) = '\(day)' AND usr.login = '\(APItoken.getapictoken()!)' ORDER BY times.begin_time".lowercased()
        let passwd = APItoken.getPassword()
        let params = [
            "login" : APItoken.getapictoken(),
            "query" : query,
            "passwd" : passwd
        ]
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.data != nil {
                switch response.result {
                case.failure(let error):
                    print(error)
                case.success(let value):
                    let json = JSON(value)
                    print(json)
                    guard let dataarr = json["result"].arrayObject as? [String] else {return}
                    print(dataarr)
                    var maininfo = dataarr.chunked(by: 5)
                    for info in maininfo {
                        if let information = info as? [String]
                        {
                            let Name : String = {
                                if let nameStr = information[0] as? String {
                                    return nameStr as! String
                                }
                                return "No"
                            }()
                            let SurName : String = {
                                if let nameStr = information[1] as? String {
                                    return nameStr as! String
                                }
                                return "No"
                            }()
                            let Email : String = {
                                if let nameStr = information[2] as? String {
                                    return nameStr as! String
                                }
                                return "No"
                            }()
                            let Phone : String = {
                                if let nameStr = information[3] as? String {
                                    return nameStr as! String
                                }
                                return "No"
                            }()
                            let Login : String = {
                                if let nameStr = information[4] as? String {
                                    return nameStr as! String
                                }
                                return "No"
                            }()
                            lessonnes.append(ScheduleData(name: Name, room: SurName, Teacher: Email, Start: Phone, End: Login))
                        }
                    }
                    completion(lessonnes)
                }
            }
        }
    }
}
