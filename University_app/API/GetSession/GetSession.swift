
//
//  GetSession.swift
//  University_app
//
//  Created by Чингиз on 1/3/19.
//  Copyright © 2019 Чингиз. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GetSession {
    class func get() {
        UserApi.users { (info) in
            let url = MainParams().url!
let query = "SELECT DATE (task.start_time) as day,task.start_time,task.end_time,subject.name_ru,gr.group_name,gr.student_count,ets.room,em.last_name,em.first_name FROM edu_tasks task INNER JOIN v_group gr ON task.group_id = gr.id INNER JOIN subject ON subject.id = task.subject_id INNER JOIN v_employee em ON em.id = task.teacher_id INNER JOIN edu_tasks_shedule ets ON ets.edu_tasks_id = task.id inner join student_education stu_edu on stu_edu.groups_id = gr.id and stu_edu.child_id is null inner join semester_data sem_data on sem_data.id = task.semester_id WHERE task.final_exam = 1 AND task.deleted = 0 AND ets.accepted = 1 and CURRENT_DATE BETWEEN sem_data.begin_date AND sem_data.end_date and em.employee_type_id = 2 and stu_edu.student_id = \(info.id!)"
            let params = ["login":APItoken.getapictoken()!,"passwd":APItoken.getPassword()!,"query":query]
            print(params)
            Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { (response) in
                if response.data != nil {
                    switch response.result {
                    case.failure(let error):
                        print(error)
                    case.success(let val):
                        let json = JSON(val)
                        print(json)
                    }
                }
            })
        }
    }

}
