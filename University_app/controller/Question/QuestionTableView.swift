//
//  QuestionTableView.swift
//  University_app
//
//  Created by Чингиз on 07.06.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit
import Foundation

@available(iOS 10.0, *)
@available(iOS 10.0, *)
class QuestionTableView: UITableViewController {
    let cellid = "bandcellid"
    var tableviewdata = [QuestionData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupnavigation()
        navigationItem.title = "Вопросы и ответы"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
        getdata()

    }
    func setupnavigation() {
        let titleimage = UIBarButtonItem.init(image: #imageLiteral(resourceName: "News"), style: .done, target: self, action: #selector(create))
        titleimage.width = 10
        self.navigationItem.rightBarButtonItem = titleimage
        
    }
    @objc func create()
    {
        self.navigationController?.pushViewController(AskQuestion(), animated: true)
    }
    func getdata() {
        GetQuestionList.get { (tableviewdata:[QuestionData]?) in
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
        let indexPathOfCellYouWantToChange = IndexPath(row: 4, section: 0)
        
        if indexPath == indexPathOfCellYouWantToChange {
            return 50 // the height you want
        } else {
            return UITableViewAutomaticDimension
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ans = AnswersViewController()
        ans.answers = tableviewdata[indexPath.row].answer
        ans.question = tableviewdata[indexPath.row].question
        navigationController?.pushViewController(ans, animated: true)
        
    }
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! UITableViewCell
        cell.textLabel?.text = tableviewdata[indexPath.row].question
        return cell
    }
}
