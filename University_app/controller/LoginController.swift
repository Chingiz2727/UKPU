//
//  LoginViewController.swift
//  news
//
//  Created by Чингиз on 05.05.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//
import UIKit
import CoreGraphics
import Alamofire
import SwiftyJSON

@available(iOS 10.0, *)
class LoginController: UIViewController,UITextFieldDelegate {
    var loginView : LoginView!
    var window: UIWindow?

    let defaults = UserDefaults.standard
        override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardTappedAround()
        setupView()
       setscrtoll()
            loginView.passTextfield.delegate  = self
            loginView.userTextfield.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    lazy var scrollView : UIScrollView = {
        let  view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize.height = view.height
        view.contentSize.width = view.width
        return view
    }()
    func setscrtoll() {
    scrollView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    func setupView()
    {
        let mainView=LoginView(frame: self.view.frame)
        self.loginView = mainView
        view.addSubview(scrollView)
        scrollView.addSubview(loginView)
        self.loginView.loginAction=login
        self.view.addSubview(loginView)
        view.contentMode = .scaleAspectFit

    }
    func login()
    {
        guard let Userlogin = loginView.userTextfield.text else {return}
        guard let password = loginView.passTextfield.text else {return}
        let userdefault = UserDefaults.standard
        userdefault.synchronize()
        API.login(email: Userlogin, password: password.sha256()) { (error:Bool, success:Bool) in
            if success {
                print("Welcome")
                userdefault.set(Userlogin, forKey: "user-tken")
                userdefault.set(password.sha256(), forKey: "passwrd")
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.makeKeyAndVisible()
                self.window?.rootViewController = APItoken()
            }
            if error
            {
                print("Not today")
            }
        }
  }
}
extension UIViewController {
    func hideKeyboardTappedAround() {
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismisskeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismisskeyboard() {
        view.endEditing(true)
    }
}








