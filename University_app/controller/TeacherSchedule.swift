import UIKit
import DropDown

@available(iOS 10.0, *)
@available(iOS 10.0, *)
class TeacherSchedule: UITableViewController{
    var schedule = [ScheduleData]()
    let dropdown = DropDown()
    let titles = ["Понедельник","Вторник","Среда","Четверг","Пятница","Суббота","Воскресенье"]
    let days = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    override func viewDidLoad() {
        super.viewDidLoad()
        day()
        navigationItem.title = "Расписание"
        navigationController?.navigationBar.isTranslucent = false
        view.addSubview(send)
        send.setAnchor(top: tableView.layoutMarginsGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 45)
        dropdown.anchorView = send
        dropdown.dataSource = titles
        dropdown.selectRow(1)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        DropDown.startListeningToKeyboard()
        indexes()
    }
    func addview() {
        let bgImage = UIImageView();
        bgImage.image = UIImage(named: "noless");
        bgImage.contentMode = .scaleToFill
        self.tableView?.backgroundView = bgImage
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView?.backgroundColor = UIColor.init(r: 248, g: 248, b: 248)
        tableView.register(ScheduleCollectionViewCell.self, forCellReuseIdentifier: "cellid")
        tableView?.contentInset = UIEdgeInsets(top: 45, left: 0, bottom: 0, right: 0)
        
    }
    func day() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        var currentDateString: String = dateFormatter.string(from: date)
        print("Current date is \(currentDateString)")
        
        if days.contains(currentDateString) {
            self.send.setTitle(titles[days.index(of: currentDateString)!], for: .normal)
        }
        apishka()
    }
    func indexes() {
        dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.send.setTitle(self.titles[index], for: .normal)
            if item == nil {
                self.day()
                
            } else {
                self.apishka()
                
            }
        }
    }
    func background() {
        
    }
    func apishka() {
        GetTeacherLesson.Lesson(day: (self.send.titleLabel?.text!)!, completion: { (schedules:[ScheduleData]!) in
            if let schedule = schedules {
                self.schedule = schedule
                self.tableView?.reloadData()
            }
        })
    }
    let send : UIButton = {
        let send = UIButton()
        send.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        send.titleLabel?.textAlignment = .center
        send.setTitleColor(.white, for: .normal)
        send.addTarget(self, action: #selector(sender), for: .touchUpInside)
        send.backgroundColor = UIColor(red: 69/255.0, green: 92/255.0, blue: 128/255.0, alpha: 1.0)
        return send
    }()
    @objc func sender() {
        dropdown.show()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if schedule.count == 0 {
            let bgImage = UIImageView();
            
            bgImage.image = UIImage(named: "noless");
            bgImage.contentMode = .scaleAspectFill
            self.tableView?.backgroundView = bgImage
        }
        else {
            self.tableView?.backgroundView = nil
        }
        return schedule.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! ScheduleCollectionViewCell
        let array = schedule[indexPath.row]
        cell.LessonName.text = "Урок: \(array.name!)"
        cell.TeacherName.text = "Группа: \(array.Teacher!)"
        cell.Cabinet.text = "Кабинет: \(array.room!)"
        cell.StartTime.text = "Начало: \(array.Start!)"
        cell.Endtime.text = "Конец: \(array.End!)"
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(red: 69/255.0, green: 92/255.0, blue: 128/255.0, alpha: 1.0)
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
