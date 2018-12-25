//
//  NewsDetailViewController.swift
//  University_app
//
//  Created by Чингиз on 06.08.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    var content:String!
    var theme:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(text)

        navigationItem.title = theme
        view.backgroundColor = UIColor.white
        text.text = content
        text.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 40, paddingRight: 20)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var text : UITextView = {
        let text = UITextView()
        text.font?.withSize(20)
        text.isEditable = false
        text.textAlignment = .left
        return text
    }()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
