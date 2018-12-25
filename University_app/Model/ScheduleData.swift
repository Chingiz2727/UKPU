//
//  ScheduleData.swift
//  University_app
//
//  Created by Чингиз on 26.07.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
class ScheduleData {
    var name : String!
    var room : String!
    var Teacher : String!
    var Start : String!
    var End : String!
    
    init(name:String,room:String,Teacher:String,Start:String,End:String) {
        self.name = name
        self.room = room
        self.Teacher = Teacher
        self.Start = Start
        self.End = End
    }
}


