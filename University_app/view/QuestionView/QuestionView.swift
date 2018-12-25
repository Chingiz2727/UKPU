//
//  QuestionView.swift
//  University_app
//
//  Created by Чингиз on 06.06.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
import UIKit
class QustionVIew : UIView {
    var signupAction: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        view()
        anchors()

    }
 
    
    let NameTexfField : UITextField = {
        let namefield = UITextField()
        namefield.widthAnchor.constraint(equalToConstant: 3).isActive=true
        namefield.heightAnchor.constraint(equalToConstant: 45).isActive=true
        namefield.translatesAutoresizingMaskIntoConstraints=false
        //design
        namefield.placeholder = "Имя"
        namefield.layer.borderWidth = 1.0
        let mycol = UIColor.black
        namefield.layer.borderColor = mycol.cgColor
        namefield.backgroundColor = UIColor.clear
        namefield.isSecureTextEntry=false;
        namefield.textColor=UIColor.black
        namefield.textAlignment = .center
        return namefield
    }()
    

    

    
    let Ques : UILabel = {
        let label = UILabel()
        label.text = "Вопрос"
        return label
    }()
    
    let QuesField : UITextView = {
        let ques = UITextView()
        ques.widthAnchor.constraint(equalToConstant: 380).isActive=true
        ques.heightAnchor.constraint(equalToConstant: 150).isActive=true
        ques.translatesAutoresizingMaskIntoConstraints=false
        //design
        ques.layer.borderWidth = 1.0
        let mycol = UIColor.black
        ques.textAlignment = .left
        ques.layer.borderColor = mycol.cgColor
        ques.backgroundColor = UIColor.clear
        ques.isSecureTextEntry=false;
        ques.textColor=UIColor.black
        return ques
    }()
    let send : UIButton = {
        let send = UIButton()
        send.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        send.titleLabel?.textAlignment = .center
        send.setTitleColor(.white, for: .normal)
        send.setTitle("Задать Вопрос", for: .normal)
        send.backgroundColor = UIColor(red: 0/255.0, green: 26/255.0, blue: 57/255.0, alpha: 1.0)
        send.addTarget(self, action: #selector(sender), for: .touchUpInside)
        return send
    }()
    @objc func sender () {
        signupAction?()
    }
    
    func view()
    {
        addSubview(NameTexfField)
        addSubview(Ques)
        addSubview(QuesField)
        addSubview(send)
    }
    
    func anchors() {
        NameTexfField.setAnchor(top:topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 100, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        Ques.setAnchor(top: NameTexfField.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 0)
        QuesField.setAnchor(top: Ques.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        send.setAnchor(top: QuesField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 150, height: 45)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
