//
//  TeacherViewController.swift
//  University_app
//
//  Created by Чингиз on 08.06.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

@available(iOS 10.0, *)
class TeacherViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    let bandCellId = "bandCellId"
    var MainView : UserSearchHeader!
    var url : String!
    var name = [String]()
    var detail = ["Аты: ","Тегі: ","E-mail: ","Номер: ","ID: "]

    override func viewDidLoad() {
        super.viewDidLoad()
        name.remove(at: 5)
        setupview()
        setupTableView()
    }
    
 
    var login : String = ""
    
    func setupview()
    {   let mainView = UserSearchHeader(frame: self.view.frame)
        self.MainView = mainView
        self.view.addSubview(MainView)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: bandCellId, for: indexPath) as! DetailView
        cell.cabinet.text = "\(detail[indexPath.row]) \(name[indexPath.row])"
        return cell
    }

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    let tableVIew: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
 
    func setupTableView()
    {
        tableVIew.delegate = self
        tableVIew.tableHeaderView = MainView.bannerImageView
        Alamofire.request(url).responseData { (response) in
            self.MainView.bannerImageView.image = UIImage(data: response.data!)        }
       
        tableVIew.dataSource = self
        tableVIew.contentInset = UIEdgeInsets.zero
        tableVIew.register(MainMenuView.self, forCellReuseIdentifier: bandCellId)
        view.addSubview(tableVIew)
        tableVIew.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    
}
