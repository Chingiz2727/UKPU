//
//  SearchFindTableViewController.swift
//  University_app
//
//  Created by Чингиз on 01.06.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
@available(iOS 10.0, *)
class SearchFindTableViewController:UITableViewController {
    let cellid = "bandcellid"
    
    var tableviewdata = [SearchData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupnavigation()
        navigationItem.title = "Бюро находок"
        tableView.register(SearchView.self, forCellReuseIdentifier: cellid)
        getdata()
        
    }
    func setupnavigation() {
        let titleimage = UIBarButtonItem.init(image: #imageLiteral(resourceName: "News"), style: .done, target: self, action: #selector(create))
        titleimage.width = 10
        
        self.navigationItem.rightBarButtonItem = titleimage
        
    }
    @objc func create()
    {
        self.navigationController?.pushViewController(SerachFViewController(), animated: true)
    }
    func getdata() {
        GetLost.Get(name: "") { (tableviewdata:[SearchData]?) in
            if let tableviewdata = tableviewdata {
                self.tableviewdata = tableviewdata
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableviewdata.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    

        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! SearchView
        cell.contacts.text = "Телефон:\(tableviewdata[indexPath.row].contacts)"
        cell.Title.text = "Название: \(tableviewdata[indexPath.row].title)"
        cell.place.text  = "Место: \(tableviewdata[indexPath.row].place)"
        print(tableviewdata[indexPath.row].img)
        if tableviewdata[indexPath.row].img != nil{
            Alamofire.request("http://89.40.60.206\(tableviewdata[indexPath.row].img)").responseData { (response) in
                cell.thingimage.image = UIImage(data: response.data!)
            }
        }
        else
        {
            cell.thingimage.image = nil
        }
        
        cell.selectionStyle = .none
        cell.descript.text = tableviewdata[indexPath.row].description
        return cell
    }
}

