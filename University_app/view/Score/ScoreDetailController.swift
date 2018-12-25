//
//  ScoreDetailController.swift
//  University_app
//
//  Created by Чингиз on 02.08.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit

class ScoreDetailController: UIViewController {
    var url : String = ""
    let WebView = UIWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(WebView)
        WebView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        let myurl = URL(string: url)
        WebView.loadRequest(URLRequest(url: myurl!))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
