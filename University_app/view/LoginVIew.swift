//
//  LoginVIew.swift
//  University_app
//
//  Created by Чингиз on 05.05.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//
import UIKit
import Foundation

class LoginView: UIView
{
    var loginAction: (() -> Void)?
    var signupAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetUpLayout()
        
}
        required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func SetUpLayout()
    {
        let backgroundimage = UIImageView(frame: UIScreen.main.bounds)
        backgroundimage.image=UIImage(named:"background")
        self.insertSubview(backgroundimage, at: 0)
        addSubview(userTextfield)
        addSubview(passTextfield)
        addSubview(JoinLabel)
        addSubview(RecoverButton)
        JoinLabel.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 150, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 200, height: 20)
        RecoverButton.setAnchor(top: passTextfield.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 50, paddingBottom: 0, paddingRight: 50)
        userTextfield.setAnchor(top: JoinLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 30, paddingLeft: 30, paddingBottom: 0, paddingRight: 30)
        passTextfield.setAnchor(top: userTextfield.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 30, paddingLeft: 30, paddingBottom: 0, paddingRight: 30)
    }
    
    
    let userTextfield  : UITextField = {
        let userText=UITextField()
        //size
        userText.translatesAutoresizingMaskIntoConstraints=false
        userText.widthAnchor.constraint(equalToConstant: 288).isActive=true
        userText.heightAnchor.constraint(equalToConstant: 45).isActive=true
        //design
        
        userText.textColor=UIColor.white
        userText.textAlignment = .center
        userText.backgroundColor = UIColor(red: 0/255.0, green: 26/255.0, blue: 57/255.0, alpha: 1.0)
        userText.attributedPlaceholder = NSAttributedString(string: "Введите логин", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        return userText
    }()
    
    //Password TextField
    let passTextfield : UITextField = {
        let passTextfield=UITextField()
    //size
        passTextfield.widthAnchor.constraint(equalToConstant: 288).isActive=true
        passTextfield.heightAnchor.constraint(equalToConstant: 45).isActive=true
        passTextfield.translatesAutoresizingMaskIntoConstraints=false
        //design
        passTextfield.backgroundColor = UIColor(red: 0/255.0, green: 26/255.0, blue: 57/255.0, alpha: 1.0)
        
        passTextfield.isSecureTextEntry=true;
        passTextfield.textColor=UIColor.white
        passTextfield.textAlignment = .center
        passTextfield.attributedPlaceholder = NSAttributedString(string: "Введите пароль", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        return passTextfield
    }()
    
    
    
    // Join System Label
    let JoinLabel:UILabel = {
        let joinlabel=UILabel()
        joinlabel.lineBreakMode = .byWordWrapping
        joinlabel.text = "Войти в систему"
        joinlabel.textAlignment = .center
        joinlabel.font=UIFont(name: "Times New Roman", size: 22)
        joinlabel.textColor=UIColor.white
        
        return joinlabel
    }()
    //Forget Password Label

    
    let RecoverButton: UIButton = {
        let recover = UIButton(type: .system)
        recover.setTitleColor(.white, for: .normal)
        recover.setTitle("Войти", for: .normal)
        recover.addTarget(self, action: #selector(handlelogin), for: .touchUpInside)
        return recover
    }()
    @objc func handlelogin()
    {
        
        loginAction?()
    }
    
}
