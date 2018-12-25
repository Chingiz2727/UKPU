//
//  CellView.swift
//  University_app
//
//  Created by Чингиз on 31.05.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
import UIKit

class BandCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    var pictureImageView: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    var locationImage: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.darkGray
        return label
    }()
    let timelabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        return label
    }()

    let titleLabel1: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        return label
    }()
    let teacherLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        return label
    }()
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor(r: 245, g: 245, b: 245)
        addSubview(cellView)
        cellView.addSubview(pictureImageView)
        cellView.addSubview(titleLabel)
        cellView.addSubview(titleLabel1)
        cellView.addSubview(teacherLabel)
        cellView.addSubview(locationLabel)
        cellView.addSubview(timelabel)
        cellView.addSubview(locationImage)
        cellView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 1, paddingLeft: 1, paddingBottom: 1, paddingRight: 1)
        
        pictureImageView.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 170, paddingBottom: 0, paddingRight: 0, width: 20, height: 20)
        locationImage.setAnchor(top: pictureImageView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 170, paddingBottom: 0, paddingRight: 0 , width: 20 , height: 20)
        timelabel.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 0)
        titleLabel.setAnchor(top: nil, left: self.leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 40)
        titleLabel1.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 30, paddingLeft: 200, paddingBottom: 0, paddingRight: 0, height: 20)
        teacherLabel.setAnchor(top: titleLabel1.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 200, paddingBottom: 0, paddingRight: 0)
        locationLabel.setAnchor(top: teacherLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 200, paddingBottom: 0, paddingRight: 0)
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
