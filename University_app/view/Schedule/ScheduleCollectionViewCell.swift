//
//  ScheduleCollectionViewCell.swift
//  University_app
//
//  Created by Чингиз on 25.07.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit


class ScheduleCollectionViewCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    let LessonName : UILabel = {
    let name = UILabel()
    name.numberOfLines = 2
    name.text = "История Казахстана"
        name.textColor = UIColor.white
    name.font = UIFont.systemFont(ofSize: 20)
    return name
    }()
    
    let StartTime : UILabel = {
        let start = UILabel()
        start.text = "12:00"
        start.textColor = UIColor.white
        start.font = UIFont.systemFont(ofSize: 20)
        return start
    }()
    
    let Endtime : UILabel = {
        let end = UILabel()
        end.text = "12:50"
        end.textColor = UIColor.white
        end.font = UIFont.systemFont(ofSize: 20)
        return end
    }()
    
    let TeacherName : UILabel = {
        let name = UILabel()
        name.text = "Jared"
        name.numberOfLines = 0
        name.textColor = UIColor.white
        name.font = UIFont.systemFont(ofSize: 20)
        return name
    }()
    
    let Cabinet : UILabel = {
        let cabinet = UILabel()
        cabinet.numberOfLines = 0
        cabinet.text = "204"
        cabinet.textColor = UIColor.white
        cabinet.font = UIFont.systemFont(ofSize: 20)
        return cabinet
    }()
     func setupView() {
        addSubview(LessonName)
        addSubview(StartTime)
        addSubview(Endtime)
        addSubview(TeacherName)
        addSubview(Cabinet)
        LessonName.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 2, paddingRight: 2)
        TeacherName.setAnchor(top: LessonName.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 2, paddingLeft: 20, paddingBottom: 2, paddingRight: 10)
        Cabinet.setAnchor(top: TeacherName.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 2, paddingLeft: 20, paddingBottom: 2, paddingRight: 0)
        StartTime.setAnchor(top: Cabinet.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 2, paddingLeft: 20, paddingBottom: 2, paddingRight: 0)
        Endtime.setAnchor(top: StartTime.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, paddingTop: 2, paddingLeft: 20, paddingBottom: 10, paddingRight: 0)
    }
    
}
