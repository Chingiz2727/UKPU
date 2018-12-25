//
//  SearchTableView.swift
//  University_app
//
//  Created by Чингиз on 04.06.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
import UIKit
class SearchView : UITableViewCell {
    
    let thingimage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    let Title : UILabel = {
        let text = UILabel()
        text.text = "ss"
        text.numberOfLines = 2
        text.font = UIFont.systemFont(ofSize: 16)
        text.textColor = UIColor.black
        return text
    }()
    let place : UILabel = {
        let text = UILabel()
        text.text = "ss"
        text.numberOfLines = 2

        text.font = UIFont.systemFont(ofSize: 16)
        text.textColor  = UIColor.black
        return text
    }()
    
    let contacts : UILabel = {
        let text = UILabel()
        text.text = "ss"
        
       text.font = UIFont.systemFont(ofSize: 16)
        text.textColor = UIColor.black
        return text
    }()
    let descript : UILabel = {
        let text = UILabel()
        text.font = UIFont.italicSystemFont(ofSize: 15)
        text.textColor = UIColor.black
        text.numberOfLines = 3
        return text
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        anchors()
    }
    
    func setup(){
        self.addSubview(thingimage)
        self.addSubview(Title)
        self.addSubview(place)
        self.addSubview(contacts)
        self.addSubview(descript)
        
    }
    func anchors() {
    thingimage.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
    Title.setAnchor(top: self.topAnchor, left:thingimage.rightAnchor, bottom: place.topAnchor, right: self.rightAnchor, paddingTop:15, paddingLeft: 15, paddingBottom: 0, paddingRight: 10)
    place.setAnchor(top: Title.bottomAnchor, left: thingimage.rightAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 5, paddingLeft: 15, paddingBottom: 0, paddingRight: 10)
    contacts.setAnchor(top: place.bottomAnchor, left: thingimage.rightAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 5, paddingLeft: 15, paddingBottom: 0, paddingRight: 10)
    descript.setAnchor(top: contacts.bottomAnchor, left: thingimage.rightAnchor, bottom:self.bottomAnchor, right: self.rightAnchor, paddingTop: 5, paddingLeft: 15, paddingBottom: 20, paddingRight: 10)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
