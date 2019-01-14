//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
var baseurl = "http://78.40.108.39/profile/account/"

@available(iOS 10.0, *)
class MainPageController: UITableViewController {
    var menul = [MenuList(title: "Наш Университет", image: "bank"),
                 MenuList(title: "Поиск Друзей", image: "users-1"),
                 MenuList(title: "Бюро Находок", image: "find"),
                 MenuList(title: "Информация о платежах", image: "icon_coins"),
                 MenuList(title: "Часто задаваемы вопросы", image: "info"),
                 MenuList(title: "Выйти", image: "logout")]
    let bandCellId = "bandCellId"
    let headercell = "header"
    let bandsArray = [(image: "userprofile", title: "nl")]
    var button: UIButton = UIButton()
    var MainView : MainPage!
    var tabBar : TabBarController!
    var login : LoginView!
    var uss = UserInfo()
    //select first_name,last_name,email from users where login='180190'
    override func viewDidLoad() {
        super.viewDidLoad()
        data2()
        GetSession.get()
        tableView.bounces = false
        tableView.register(MainMenuView.self, forCellReuseIdentifier: bandCellId)
        tableView.register(MainPage.self, forCellReuseIdentifier: headercell)
        
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
//        self.MainView.nameLabel.text = userinfo.name
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menul.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: bandCellId, for: indexPath) as! MainMenuView
        cell.cabinet.text = menul[indexPath.row].title
        cell.placeimg.image = UIImage(named: menul[indexPath.row].image!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(AboutUniversityViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(SearchPeopleTableViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(SearchFindTableViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(PaymentViewController(), animated: true)
        case 4:
            navigationController?.pushViewController(QuestionTableView(), animated: true)
        case 5:
            let stand  = UserDefaults.standard
            stand.removeObject(forKey: "passwrd")
            stand.removeObject(forKey: "user-tken")
            UIApplication.shared.keyWindow?.rootViewController = LoginController()
        default:
            break
        }
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }

    var picker_image : UIImage? {
        didSet {
//            MainView.avatarImageView.image = picker_image
//            MainView.bannerImageView.image = picker_image
            self.tableView.reloadData()
            API.createPhoto(photo: picker_image!) { (error:Error?, success:Bool) in
                if success {
                    
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let head = tableView.dequeueReusableCell(withIdentifier: headercell) as! MainPage
        head.photobutton.addTarget(self, action: #selector(sec), for: .touchUpInside)
        return head
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
