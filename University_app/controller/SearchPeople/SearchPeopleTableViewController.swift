//
//  SearchPeopleTableViewController.swift
//  University_app
//
//  Created by Чингиз on 05.07.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON
@available(iOS 10.0, *)
class SearchPeopleTableViewController: UITableViewController,UISearchBarDelegate {
    let searchBar = UISearchBar()
    var finded=String()
    var array = [TeacherInfo]()
    

    let cellid = "cellid"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.register(SearchPeopleCell.self, forCellReuseIdentifier: cellid)
        view.addSubview(searchBar)
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.titleView = searchBar
        self.navigationItem.titleView = searchBar
    }
    func searcher() {
        TeacherSearcher.SearchTeachers(name: searchBar.text!) { (array:[TeacherInfo]?) in
            if let array = array {
                self.array = array
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
            }
        }
    }
  
     func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searcher()
        }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
            }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! SearchPeopleCell
        let seacrhed = array[indexPath.row]
        cell.name.text = seacrhed.name
        cell.surname.text = seacrhed.surname
        let url = "http://89.40.60.206\(seacrhed.middlename!)"
        let mainurl = String(url)
        Alamofire.request(mainurl).responseData { (response) in
            cell.img.image = UIImage(data: response.data!)
            print(cell.img)
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let controller = TeacherViewController()
    controller.login = array[indexPath.row].login
    var arr = array[indexPath.row].array
    let seacrhed = array[indexPath.row]
    let url = "http://89.40.60.206\(seacrhed.middlename!)"
    print(url)
    var mainurl = String(url)
    controller.url = mainurl
    controller.name = arr as! [String]
    self.navigationController?.pushViewController(controller, animated: true)
    }
}
