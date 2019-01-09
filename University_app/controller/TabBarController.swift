//
//  TabBarViewController.swift
//  TabbarController
//
//  Created by Hoàng Khánh on 4/11/18.
//  Copyright © 2018 Hoàng Khánh. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class TabBarController: UITabBarController {
    
   
    let scroller : UIScrollView = UIScrollView()
    var segment = UISegmentedControl()
    let items = ["Расписание","Экзамены"]
    override func viewDidLoad() {
        super.viewDidLoad()
        scroller.contentSize = CGSize(width: 499, height: 2300)
        scroller.isScrollEnabled = true
        let mainpage = UINavigationController.init(rootViewController: MainPageController())
        mainpage.title = "Главная"
        let layout = UICollectionViewFlowLayout()
        let Schedule = UINavigationController.init(rootViewController: ScheduleController())
        Schedule.title = "Расписание"
        
        let score = UINavigationController.init(rootViewController: ScoreController())
        let news = UINavigationController.init(rootViewController: NewsController())
      
        mainpage.tabBarItem = UITabBarItem(title: "Главная", image: #imageLiteral(resourceName: "home"), tag: 0)
        Schedule.tabBarItem = UITabBarItem(title: "Расписание", image: #imageLiteral(resourceName: "Schedule"), tag: 1)
        score.tabBarItem = UITabBarItem(title: "Оценки", image: #imageLiteral(resourceName: "Score"), tag: 2)
        news.tabBarItem = UITabBarItem(title: "Новости", image: #imageLiteral(resourceName: "News"), tag: 3)
        viewControllers = [mainpage,Schedule,score,news]
        self.selectedIndex = 0
        
        navigationItem.title = "Главная"
        self.selectedViewController = mainpage
        self.tabBar.tintColor = .black
        tabBar.isTranslucent = false
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            navigationItem.title = "Главная"
            tabBar.tintColor = .black
            tabBar.backgroundColor = UIColor.black
            break
        case 1:
            
            tabBar.tintColor = .black
            break
        case 2:
            tabBar.tintColor = .black
            navigationItem.title = "Оценки"
            break
        case 3:
            tabBar.tintColor = .black
            navigationItem.title = "Новости"
        case 4:
            tabBar.tintColor = .black
            
            navigationItem.title = "Сообщения"
        default:
            break
        }
    }
    
}
