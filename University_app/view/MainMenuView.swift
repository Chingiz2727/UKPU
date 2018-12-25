//
//  MainMenuView.swift
//  University_app
//
//  Created by Чингиз on 19.07.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
import UIKit
class MainMenuView: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        anchors()
    }
    
    let cellView: UIView = {
        let view = UIView()
        return view
    }()
    let placeimg : UIImageView = {
        let placeimg = UIImageView()
        placeimg.image = UIImage(named: "placeholder")
        return placeimg
    }()

    let cabinet : UILabel = {
        let cabinet = UILabel()
        cabinet.numberOfLines = 0
        cabinet.textAlignment = .left
        cabinet.font = UIFont.systemFont(ofSize: 20)
        return cabinet
    }()
    
    func setup() {
        addSubview(cellView)
        cellView.addSubview(placeimg)
        cellView.addSubview(cabinet)
    }
    func anchors()
    {
        cellView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 1, paddingLeft: 1, paddingBottom: 1, paddingRight: 1)
        placeimg.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, paddingTop: 15, paddingLeft: 30, paddingBottom: 15, paddingRight: 0, width: 30, height: 30)
        cabinet.setAnchor(top: self.topAnchor, left: placeimg.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 10, paddingLeft: 30, paddingBottom: 10, paddingRight: 10)

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

