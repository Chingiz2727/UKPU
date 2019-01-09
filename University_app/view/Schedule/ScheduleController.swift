import UIKit
import DropDown

@available(iOS 10.0, *)
@available(iOS 10.0, *)
class ScheduleController: UITableViewController{
    var schedule = [ScheduleData]()
    let dropdown = DropDown()
    var segment = UISegmentedControl()
    var Exams = [Result]()

    let items = ["Расписание","Экзамены"]
    let titles = ["Понедельник","Вторник","Среда","Четверг","Пятница","Суббота","Воскресенье"]
    let days = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
      override func viewDidLoad() {
        super.viewDidLoad()
        day()
        segment = UISegmentedControl(items: items)
        
        navigationItem.titleView = segment
        navigationController?.navigationBar.isTranslucent = false
        
        dropdown.anchorView = send
        dropdown.dataSource = titles
        dropdown.selectRow(1)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        DropDown.startListeningToKeyboard()
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(changed(segment:)), for: .valueChanged)
        indexes()
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch segment.selectedSegmentIndex {
        case 0:
            view.addSubview(send)
        return send
        case 1:
            return UIView()
        default:
            break
        }
        return UIView()
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    @objc func changed(segment:UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            apishka()
        default:
            getSession()
            
        }
    }
    func getSession() {
        GetExams.get { (exams) in
            if let exams = exams {
                self.Exams = exams.result!
                self.dropdown.isHidden = true
                self.tableView.reloadData()

                self.dropdown.isUserInteractionEnabled = false
            }

        }
        self.tableView.reloadData()

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

    func apishka() {
        GetLessons.Lesson(day: (self.send.titleLabel?.text!)!, completion: { (schedules:[ScheduleData]!) in
            if let schedule = schedules {
                self.dropdown.isUserInteractionEnabled = true
                self.dropdown.isHidden = false

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
        switch segment.selectedSegmentIndex {
        case 0:
            return schedule.count
        default:
            return Exams.count
        }
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! ScheduleCollectionViewCell
        switch segment.selectedSegmentIndex {
        case 0:
            let array = schedule[indexPath.row]
            cell.LessonName.text = "Урок: \(array.name!)"
            cell.TeacherName.text = "Преподователь: \(array.Teacher!)"
            cell.Cabinet.text = "Кабинет: \(array.room!)"
            cell.StartTime.text = "Начало: \(array.Start!)"
            cell.Endtime.text = "Конец: \(array.End!)"
        default:
            let item = Exams[indexPath.row]
            cell.LessonName.text = item.nameRu!
            cell.Cabinet.text = item.room!
            cell.StartTime.text = item.startTime!
            cell.Endtime.text = item.endTime!
            cell.TeacherName.text = "\(item.firstName!) \(item.lastName!)"
        }

        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(red: 69/255.0, green: 92/255.0, blue: 128/255.0, alpha: 1.0)
        return cell
    }
  
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
  
  
}
