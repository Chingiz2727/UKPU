//
//  NewsController.swift
//  University_app
//
//  Created by Чингиз on 10.05.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class NewsController: UIViewController,UITableViewDelegate,UITableViewDataSource {
var Header: ScheduleHeader!
 override func viewDidLoad() {
    
    super.viewDidLoad()
    setupview()
    tableVIew.tableFooterView = UIView()
    setupTableView()
    getnews()
    tableVIew.rowHeight = UITableViewAutomaticDimension
    tableVIew.estimatedRowHeight = 100
    // Do any additional setup after loading the view.
    }
    
    var newsl = [NewsList]()
    let bandCellId = "bandCellId"
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return newsl.count
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: bandCellId, for: indexPath) as! NewsView
        cell.type.text = newsl[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var news = NewsDetailViewController()
        news.content = newsl[indexPath.row].body
        news.theme = newsl[indexPath.row].title
        navigationController?.pushViewController(news, animated: true)

    }
    func getnews() {
        GetNewsList.getNews { (newsl:[NewsList]?) in
            if let newsl = newsl {
                self.newsl = newsl
                self.tableVIew.reloadData()
            }
        }
    }
        let tableVIew: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    func setupview()
    {   let mainView = ScheduleHeader(frame: self.view.frame)
        self.Header = mainView
        self.view.addSubview(Header)
    }
        func setupTableView()
    {
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.tableHeaderView = Header.bannerImageView
        tableVIew.register(NewsView.self, forCellReuseIdentifier: bandCellId)
        view.addSubview(tableVIew)
        tableVIew.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}



