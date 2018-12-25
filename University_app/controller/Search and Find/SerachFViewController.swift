//
//  SerachFViewController.swift
//  University_app
//
//  Created by Чингиз on 13.06.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class SerachFViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var SearchF : SearchAndFiend!
    var Image : String!
    var insertSearch = InsertSearch()
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        let mainView = SearchAndFiend(frame: self.view.frame)
        self.SearchF = mainView
        SearchF.contact.keyboardType = UIKeyboardType.numberPad
        self.SearchF.senderaction = send
        self.SearchF.imagepicking = sec
        self.view.addSubview(scrollView)
        scrollView.addSubview(mainView)
        setscroll()
        super.viewDidLoad()
    }
    lazy var scrollView : UIScrollView = {
        let  view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize.height = 740
        return view
    }()
    func send(){
        API.UploadSearchPhoto(photo: picker_image, phone: SearchF.contact.text!, lost_thing_name: SearchF.title.text!, description: SearchF.text.text!, place: SearchF.from.text!) { (error:Bool,success:Bool) in
            if success {
                self.navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
                print("cool")
            }
            if error {
                print("error")
            }
            
            }
        
        
    }
    func setscroll() {
        scrollView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    func sec() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.delegate = self
        self.present(picker,animated: true,completion:nil)
        
    }
    var picker_image : UIImage? {
        didSet {
            SearchF.loadedImage.image = picker_image
           
            }
        }
    }
   

@available(iOS 10.0, *)
extension SerachFViewController {
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
