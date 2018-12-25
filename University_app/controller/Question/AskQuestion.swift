

import UIKit

@available(iOS 10.0, *)
class AskQuestion: UIViewController {
    
    var View : QustionVIew!
    
        override func viewDidLoad() {
       
        super.viewDidLoad()
            AddView()
self.View.signupAction = send    }

    func AddView() {
        let mainView = QustionVIew(frame: self.view.frame)
        self.View = mainView
        self.view.addSubview(View)
    }
    func send() {
        Question.askquestion(name: View.NameTexfField.text!, description: View.QuesField.text!)
    }

}
