//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
var baseurl = "http://78.40.108.39/profile/account/"

@available(iOS 10.0, *)
class MainPageController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    var menul = [MenuList(title: "Наш Университет", image: "bank"),
                 MenuList(title: "Поиск Друзей", image: "users-1"),
                 MenuList(title: "Бюро Находок", image: "find"),
                 MenuList(title: "Часто задаваемы вопросы", image: "info"),
                 MenuList(title: "Выйти", image: "logout")]
    let bandCellId = "bandCellId"
    let bandsArray = [(image: "userprofile", title: "nl")]
    var button: UIButton = UIButton()
    var MainView : MainPage!
    var tabBar : TabBarController!
    var login : LoginView!
    var uss = UserInfo()
    //select first_name,last_name,email from users where login='180190'
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.tableFooterView = UIView()
        data2()
        setupview()
        tableVIew.isScrollEnabled = false
        setupTableView()
        view.addSubview(button)
       
        button.setAnchor(top: nil, left: nil, bottom: MainView.bannerImageView.bottomAnchor, right: MainView.bannerImageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: 10,width: 30,height: 30)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(sec), for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(UIImage(named: "photo"), for: .normal)
    }
   @objc func sec() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.delegate = self
        self.present(picker,animated: true,completion:nil)
    }
    func setupview()
    {   let mainView = MainPage(frame: self.view.frame)
        self.MainView = mainView
        self.view.addSubview(MainView)
    }
    
        func data2()
        {
            UserApi.users()
                { (userinfo) in
        self.MainView.nameLabel.text = userinfo.name
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menul.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: bandCellId, for: indexPath) as! MainMenuView
        cell.cabinet.text = menul[indexPath.row].title
        cell.placeimg.image = UIImage(named: menul[indexPath.row].image!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(AboutUniversityViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(SearchPeopleTableViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(SearchFindTableViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(QuestionTableView(), animated: true)
        case 4:
            let stand  = UserDefaults.standard
            stand.removeObject(forKey: "passwrd")
            stand.removeObject(forKey: "user-tken")
            UIApplication.shared.keyWindow?.rootViewController = LoginController()
        default:
            break
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    let tableVIew: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    var picker_image : UIImage? {
        didSet {
            MainView.avatarImageView.image = picker_image
            MainView.bannerImageView.image = picker_image
            self.tableVIew.reloadData()
            API.createPhoto(photo: picker_image!) { (error:Error?, success:Bool) in
                if success {
                    
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return MainView.bannerImageView.height
    }
  
    
    func setupTableView()
    {
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.register(MainMenuView.self, forCellReuseIdentifier: bandCellId)
        view.addSubview(tableVIew)
        tableVIew.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        tableVIew.tableHeaderView = MainView.bannerImageView

    }


}
@available(iOS 10.0, *)
extension MainPageController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editedimage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.picker_image = editedimage
        } else if let originalImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.picker_image = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
