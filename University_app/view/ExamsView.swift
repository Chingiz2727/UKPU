//
//  ExamsView.swift
//  University_app
//
//  Created by Чингиз on 07.06.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit

class ExamsView: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        anchors()
            }
    
    let cellView: UIView = {
        let view = UIView()
        return view
    }()
    let time : UILabel = {
       let time = UILabel()
        time.font = UIFont.systemFont(ofSize: 16)
        time.textAlignment = .center
        time.backgroundColor = UIColor.cyan
        return time
    }()
    let date : UILabel = {
        let date = UILabel()
        date.font = UIFont.systemFont(ofSize: 16)
        date.textAlignment = .center
        date.backgroundColor = UIColor.red
        return date
    }()
    let typeimg : UIImageView = {
        let type = UIImageView()
        type.image = UIImage(named: "News")
        return type
    }()
    let science : UILabel = {
        let science = UILabel()
        return science
    }()
    let placeimg : UIImageView = {
        let placeimg = UIImageView()
        placeimg.image = UIImage(named: "placeholder")
        return placeimg
    }()
    
    let type : UILabel = {
        let type = UILabel()
        return type
    }()
    let cabinet : UILabel = {
        let cabinet = UILabel()
        
        return cabinet
    }()
    
    func setup() {
        addSubview(cellView)
        cellView.addSubview(date)
        cellView.addSubview(typeimg)
        cellView.addSubview(science)
        cellView.addSubview(placeimg)
        cellView.addSubview(time)
        cellView.addSubview(type)
        cellView.addSubview(cabinet)
    }
    func anchors()
    {
        cellView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 1, paddingLeft: 1, paddingBottom: 1, paddingRight: 1)
        
        date.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 0 , width: 120 , height: 70)
        time.setAnchor(top: date.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 120,height: 30)
        science.setAnchor(top: self.topAnchor, left: date.rightAnchor, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 80, paddingBottom: 0, paddingRight: 0)
        typeimg.setAnchor(top: science.bottomAnchor, left: date.rightAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 80, paddingBottom: 0, paddingRight: 0, width: 20, height: 20)
        placeimg.setAnchor(top: typeimg.bottomAnchor, left: date.rightAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 80, paddingBottom: 0, paddingRight: 0, width: 20, height: 20)
        type.setAnchor(top: science.bottomAnchor, left: typeimg.rightAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 0)
        cabinet.setAnchor(top: typeimg.bottomAnchor, left: typeimg.rightAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 0)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
