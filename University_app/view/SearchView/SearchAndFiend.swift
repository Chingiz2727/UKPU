//
//  SearchAndFind.swift
//  University_app
//
//  Created by Чингиз on 28.05.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
import UIKit

class SearchAndFiend : UIView
{
    var senderaction: (() -> Void)?
    var imagepicking: (() -> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        anchors()
    }
    let username : UITextField = {
        let title = UITextField()
        title.widthAnchor.constraint(equalToConstant: 3).isActive=true
        title.heightAnchor.constraint(equalToConstant: 45).isActive=true
        title.layer.borderWidth = 1.0
        let mycol = UIColor.black
        title.placeholder = "Имя"
        title.layer.borderColor = mycol.cgColor
        title.backgroundColor = UIColor.clear
        title.textColor=UIColor.black
        title.textAlignment = .center
        return title
    }()
    let title : UITextField = {
        let title = UITextField()
        title.widthAnchor.constraint(equalToConstant: 3).isActive=true
        title.heightAnchor.constraint(equalToConstant: 45).isActive=true
        title.layer.borderWidth = 1.0
        let mycol = UIColor.black
        title.placeholder = "Название предмета"
        title.layer.borderColor = mycol.cgColor
        title.backgroundColor = UIColor.clear
        title.textColor=UIColor.black
        title.textAlignment = .center
        return title
    }()
 

    let Descript:UILabel = {
        let joinlabel=UILabel()
        joinlabel.frame = CGRect(x:0, y: 0, width: 200, height: 20)
        joinlabel.lineBreakMode = .byWordWrapping
        
        joinlabel.text = "Дополнительные описания:"
        joinlabel.textAlignment = .center
        joinlabel.font=UIFont(name: "Times New Roman", size: 22)
        joinlabel.textColor=UIColor.black
        
        return joinlabel
    }()
    
    let from : UITextField = {
        let from = UITextField()
        from.widthAnchor.constraint(equalToConstant: 3).isActive=true
        from.heightAnchor.constraint(equalToConstant: 45).isActive=true
        from.translatesAutoresizingMaskIntoConstraints=false
        //design
        from.placeholder = "Место пропажи/находки"
        from.layer.borderWidth = 1.0
        let mycol = UIColor.black
        from.layer.borderColor = mycol.cgColor
        from.backgroundColor = UIColor.clear
        from.isSecureTextEntry=false;
        from.textColor=UIColor.black
        from.textAlignment = .center
        return from
    }()
    
    let contact: UITextField = {
        let contact = UITextField()
        contact.widthAnchor.constraint(equalToConstant: 3).isActive=true
        contact.heightAnchor.constraint(equalToConstant: 45).isActive=true
        contact.translatesAutoresizingMaskIntoConstraints=false
        //design
        contact.placeholder = "Номер телефона"
        contact.textInputMode
        contact.layer.borderWidth = 1.0
        let mycol = UIColor.black
        contact.layer.borderColor = mycol.cgColor
        contact.backgroundColor = UIColor.clear
        contact.isSecureTextEntry=false;
        contact.textColor=UIColor.black
        contact.textAlignment = .center
        return contact
    }()
    
    let text : UITextView = {
        let description = UITextView()
        description.widthAnchor.constraint(equalToConstant: 3).isActive=true
        description.heightAnchor.constraint(equalToConstant: 150).isActive=true
        description.translatesAutoresizingMaskIntoConstraints=false
        //design
        
        description.textAlignment = .left
        description.layer.borderWidth = 1.0
        let mycol = UIColor.black
        description.sizeToFit()
        description.layer.borderColor = mycol.cgColor
        description.backgroundColor = UIColor.clear
        description.isSecureTextEntry=false;
        description.textColor=UIColor.black
        return description
    }()
    let preview : UIButton = {
        let preview = UIButton()
        preview.setTitleColor(.white, for: .normal)
        preview.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        preview.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        preview.titleLabel?.textAlignment = .center
        preview.setTitle("Выбрать \nфото", for: .normal)
        preview.addTarget(self, action: #selector(imagepick), for: .touchUpInside)

        preview.backgroundColor = UIColor(red: 0/255.0, green: 26/255.0, blue: 57/255.0, alpha: 1.0)
        return preview
    }()
    let send : UIButton = {
        let send = UIButton()
        send.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        send.titleLabel?.textAlignment = .center
        send.setTitleColor(.white, for: .normal)
        send.setTitle("Отправить", for: .normal)
        send.addTarget(self, action: #selector(sender), for: .touchUpInside)

        send.backgroundColor = UIColor(red: 0/255.0, green: 26/255.0, blue: 57/255.0, alpha: 1.0)
        return send
    }()
    let loadedImage : UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    @objc func sender() {
        senderaction?()

    }

    @objc func imagepick() {
        imagepicking?()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func anchors()
    {
        
        username.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        title.setAnchor(top: username.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        from.setAnchor(top: title.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        contact.setAnchor(top: from.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        Descript.setAnchor(top: contact.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 0)
        text.setAnchor(top: Descript.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        send.setAnchor(top: text.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 125, height: 45)
        preview.setAnchor(top: text.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 125, height: 45)
        loadedImage.setAnchor(top: preview.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 10, paddingRight: 20,width: 200,height: 200)
    }
    func setupView()  {
        self.addSubview(username)
        self.addSubview(from)
        self.addSubview(title)
        self.addSubview(contact)
        self.addSubview(Descript)
        self.addSubview(text)
        self.addSubview(preview)
        self.addSubview(send)
        self.addSubview(loadedImage)
        
    }
}
