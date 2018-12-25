//
//  ScheduleView.swift
//  University_app
//
//  Created by Чингиз on 10.05.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
import UIKit

class ScheduleView: UIView,UITableViewDelegate,UITableViewDataSource {
   
    let bandCellId = "bandCellId"

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: bandCellId, for: indexPath)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    class BandCell: UITableViewCell
    {
        let cellView : UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.white
            return view
        }()
        override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setup()
        }
        func setup()
        {
            addSubview(cellView)
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
  
    let TableVIew : UITableView = {
    let tv = UITableView()
        tv.separatorStyle = .none
        tv.allowsSelection = false
        return tv
    
    }()
    
    func setupTableView(){
        
        TableVIew.delegate = self
        TableVIew.dataSource = self
        TableVIew.register(BandCell.self, forCellReuseIdentifier: bandCellId)
        addSubview(TableVIew)
        TableVIew.topAnchor.anchorWithOffset(to: topAnchor)
        TableVIew.leftAnchor.anchorWithOffset(to: leftAnchor)
        TableVIew.bottomAnchor.anchorWithOffset(to: bottomAnchor)
        TableVIew.rightAnchor.anchorWithOffset(to: rightAnchor)
            
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
