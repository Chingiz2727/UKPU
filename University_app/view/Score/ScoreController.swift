//
//  ScoreController.swift
//  University_app
//
//  Created by Чингиз on 10.05.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit
import Alamofire
import DropDown
@available(iOS 10.0, *)
class ScoreController: UITableViewController {
    var cellid = "cellid"
    let dropdown = DropDown()
    let titles = ["2","3","","","4","5","6","8"]
    let semester = ["1 курс 1 семестр","1 курс 2 семестр","2 курс 1 семестр","2 курс 2 семестр","3 курс 1 семестр","3 курс 2 семестр","4 курс 1 семестр","4 курс 2 семестр"]
    var item : Int!
    var semecter : String?
    var subject = [Subject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ScoreCollectionViewCell.self, forCellReuseIdentifier: cellid)

        navigationItem.title = "Оценки"
        navigationController?.navigationBar.isTranslucent = false
        tableView?.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView?.backgroundColor = UIColor.init(r: 248, g: 248, b: 248)
        get()
        view.addSubview(send)
    send.setAnchor(top: tableView.layoutMarginsGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 45)
        dropdown.anchorView = send
        dropdown.dataSource = semester
        DropDown.startListeningToKeyboard()
            tableView?.contentInset = UIEdgeInsets(top: 45, left: 0, bottom: 0, right: 0)

    }
    override func viewWillAppear(_ animated: Bool) {

        indexes()
    }
    func get(){
        GetSemester.get(semestr: "1", completion: { (subject:[Subject]!) in
            if let subject = subject {
                self.subject = subject
                self.tableView?.reloadData()
            }
        })
    }
    func indexes() {
        dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            let c = index
            print(self.titles[c])
            var s = self.titles[c]
            self.semecter = self.titles[c]
            GetSemester.get(semestr: s, completion: { (subject:[Subject]!) in
                if let subject = subject {
                    self.subject = subject
                    self.tableView?.reloadData()
                }
            })
            self.send.setTitle(self.semester[index], for: .normal)

        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if subject.count == 0 {
            let bgImage = UIImageView();
            bgImage.image = UIImage(named: "no course");
            bgImage.contentMode = .scaleAspectFill
            self.tableView?.backgroundView = bgImage
        }
        else {
            self.tableView?.backgroundView = nil
        }
        return subject.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celll = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! ScoreCollectionViewCell
        celll.LessonName.text = subject[indexPath.row].subj_name
        return celll
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let sc = ScoreDetailController()
        sc.url = "https://www.ukpu-systems.kz/pages/login/students/grade_mob.php/?course_id=\(subject[indexPath.row].subj_id!)&sem_id=\(semecter!)&student_id=\(APItoken.getapictoken()!)"
        print(sc.url)
        self.navigationController?.pushViewController(sc, animated: true)
    }
 
  
    
        let send : UIButton = {
        let send = UIButton()
        send.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        send.titleLabel?.textAlignment = .center
        send.setTitleColor(.white, for: .normal)
        send.addTarget(self, action: #selector(sender), for: .touchUpInside)
        send.setTitle("Выбрать семестр", for: .normal)
            send.backgroundColor = UIColor(red: 69/255.0, green: 92/255.0, blue: 128/255.0, alpha: 1.0)
        return send
    }()
    
    @objc func sender() {
        dropdown.show()
    }

}


