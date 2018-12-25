//
//  TeacherSearcherView.swift
//  University_app
//
//  Created by Чингиз on 08.06.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit

class TeacherSearcherView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setupview()
    }
    var SelectTeachers: (() -> Void)?

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let nametextfield : UITextField = {
        let userText = UITextField()

        userText.translatesAutoresizingMaskIntoConstraints=false
        userText.heightAnchor.constraint(equalToConstant: 45).isActive=true
        //design
        
        userText.textColor=UIColor.white
        userText.textAlignment = .center
        userText.backgroundColor = UIColor(red: 0/255.0, green: 26/255.0, blue: 57/255.0, alpha: 1.0)
        userText.attributedPlaceholder = NSAttributedString(string: "Введите Имя", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        return userText
    }()
    
    
    let surnametextfiel : UITextField = {
        let userText = UITextField()
        userText.translatesAutoresizingMaskIntoConstraints=false
        userText.heightAnchor.constraint(equalToConstant: 45).isActive=true
        //design
        
        userText.textColor=UIColor.white
        userText.textAlignment = .center
        userText.backgroundColor = UIColor(red: 0/255.0, green: 26/255.0, blue: 57/255.0, alpha: 1.0)
        userText.attributedPlaceholder = NSAttributedString(string: "Введите Фамилию", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        return userText
    }()
    
    let searchbutton : UIButton = {
        let send = UIButton()
        send.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        send.titleLabel?.textAlignment = .center
        send.setTitleColor(.white, for: .normal)
        send.setTitle("Найти", for: .normal)
        send.backgroundColor = UIColor(red: 0/255.0, green: 26/255.0, blue: 57/255.0, alpha: 1.0)
        send.addTarget(self, action: #selector(search), for: .touchUpInside)
        return send
    }()
   @objc func search() {
    SelectTeachers?()

    }
    
    func setupview()
    {
        addSubview(nametextfield)
        addSubview(surnametextfiel)
        addSubview(searchbutton)
        anchors()
    }
    
    func anchors() {
        nametextfield.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 200, paddingLeft: 30, paddingBottom: 0, paddingRight: 30)
        surnametextfiel.setAnchor(top: nametextfield.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 30, paddingLeft: 30, paddingBottom: 0, paddingRight: 30)
        searchbutton.setAnchor(top: surnametextfiel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 30, paddingLeft: 90, paddingBottom: 0, paddingRight: 90, width: 0, height: 50)
    }
    
    
}
