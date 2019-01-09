//
//  Exams.swift
//  University_app
//
//  Created by Чингиз on 1/8/19.
//  Copyright © 2019 Чингиз. All rights reserved.
//

import Foundation

struct Exams: Codable {
    let result: [Result]?
}

struct Result: Codable {
    let day, startTime, endTime, nameRu: String?
    let groupName, studentCount, room, lastName: String?
    let firstName: String?
    
    enum CodingKeys: String, CodingKey {
        case day
        case startTime = "start_time"
        case endTime = "end_time"
        case nameRu = "name_ru"
        case groupName = "group_name"
        case studentCount = "student_count"
        case room
        case lastName = "last_name"
        case firstName = "first_name"
    }
}
