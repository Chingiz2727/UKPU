//
//  NewsView.swift
//  University_app
//
//  Created by Чингиз on 11.06.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit

class NewsView: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        anchors()
    }
    
    let time : UILabel = {
        let time = UILabel()
        time.font = UIFont.systemFont(ofSize: 20)
        time.textAlignment = .center
        time.textColor = UIColor.white
        return time
    }()
    let date : UILabel = {
        let date = UILabel()
        date.font = UIFont.systemFont(ofSize: 20)
        date.textColor = UIColor(r: 29, g: 41, b: 61)
        date.textAlignment = .center
        return date
    }()

    let type : UILabel = {
        let type = UILabel()
        type.font = UIFont.systemFont(ofSize: 20)
        type.numberOfLines = 0
        return type
    }()
    
    func setup() {
        self.addSubview(date)
         self.addSubview(time)
        self.addSubview(type)
        
    }
    func anchors()
    {
        date.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 0 )
        time.setAnchor(top: date.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 0)
        type.setAnchor(top:self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 10)

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



