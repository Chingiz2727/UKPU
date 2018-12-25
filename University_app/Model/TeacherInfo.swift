//
//  TeacherInfo.swift
//  University_app
//
//  Created by Чингиз on 22.06.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit

class TeacherInfo {
    var name : String!
    var surname : String!
    var middlename: String!
    var login : String!
    var email : String!
    var array : [String!]
    var image : String!
    var phone : String!
    init(name:String,surname:String,login:String,email:String,phone:String,middle:String,array:[String])
    {
        self.name = name
        self.surname = surname
        self.login = login
        self.email = email
        self.array = array
        self.phone = phone
        self.middlename = middle
    }


    }

struct  AboutTeacher {
   static var name : String = ""
    static var surname : String = ""
   static var email : String = ""
   static var phone : String = ""
   static var login : String = ""
    static var image : String = ""
 }
