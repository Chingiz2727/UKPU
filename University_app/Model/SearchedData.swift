//
//  SearchedData.swift
//  University_app
//
//  Created by Чингиз on 24.07.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
class SearchData {
    var img : String = ""
    var title  : String = ""
    var place  : String = ""
    var contacts  : String = ""
    var description : String = ""
    var image : String = ""
    init(img:String,title:String,place:String,contacts:String,description:String)
    {
        self.img = img
        self.title = title
        self.place = place
        self.contacts = contacts
        self.description = description
    }
    init(image:String)
    {
        self.image = image
    }
}
struct SearchedImage {
    static var img : String = ""
}
