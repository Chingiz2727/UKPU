//
//  ScoreCollectionViewCell.swift
//  University_app
//
//  Created by Чингиз on 25.07.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit


class ScoreCollectionViewCell:  UITableViewCell{
    let LessonName : UILabel = {
        let name = UILabel()
        name.text = "История Казахстана"
        name.font = UIFont.systemFont(ofSize: 20)
        return name
    }()
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
  
     func setupView() {
        addSubview(LessonName)
        LessonName.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 12, paddingLeft: 20, paddingBottom: 12, paddingRight: 20)
 
    }
    
}
