//
//  SearchPeopleCell.swift
//  University_app
//
//  Created by Чингиз on 05.09.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit

class SearchPeopleCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        update()
        anchors()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var name:UILabel = UILabel()
    var surname:UILabel = UILabel()
    var img:UIImageView = UIImageView(frame: CGRect(x: 50, y: 100, width: 70, height: 70))
    var detailedview : UIView = UIView()
    func update() {
        self.addSubview(detailedview)

        detailedview.addSubview(name)
        detailedview.addSubview(surname)
        self.addSubview(img)
    }
    func anchors() {
        img.layer.borderWidth = 1.0
        img.layer.cornerRadius = img.frame.size.width/2
        img.layer.borderColor = UIColor.white.cgColor
        img.layer.masksToBounds = false
        img.clipsToBounds = true
        detailedview.setAnchor(top: name.topAnchor, left: img.rightAnchor, bottom: name.bottomAnchor, right: surname.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0)
        img.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 70, height: 70)
        name.setAnchor(top: detailedview.topAnchor, left: detailedview.leftAnchor, bottom: detailedview.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        surname.setAnchor(top: detailedview.topAnchor, left: name.rightAnchor, bottom: detailedview.bottomAnchor, right: detailedview.rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 0)
        img.contentMode = .scaleAspectFill
        surname.font = UIFont.systemFont(ofSize: 20)
        name.font = UIFont.systemFont(ofSize: 20)
        let centerXLabel = detailedview.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        NSLayoutConstraint.activate([centerXLabel])
       
    }

}
