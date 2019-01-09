//
//  PaymentView.swift
//  University_app
//
//  Created by Чингиз on 1/8/19.
//  Copyright © 2019 Чингиз. All rights reserved.
//

import UIKit

class PaymentView: UIView {
    var fl = UIView()
    var sl = UIView()
    var tl = UIView()
    var opl_sum=UILabel()
    var ost_sum=UILabel()
    var obs_sum=UILabel()
    var infl = UILabel()
    
    func addview() {
        self.addSubview(opl_sum)
        self.addSubview(fl)
        self.addSubview(ost_sum)
        self.addSubview(sl)
        self.addSubview(obs_sum)
        self.addSubview(tl)
        self.addSubview(infl)
        
        opl_sum.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0)
        fl.setAnchor(top: opl_sum.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,width: 1,height: 1)
        ost_sum.setAnchor(top: fl.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0)
        sl.setAnchor(top: ost_sum.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        obs_sum.setAnchor(top: sl.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0)
        tl.setAnchor(top: obs_sum.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        infl.setAnchor(top: tl.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 5)
        infl.textAlignment = .center
    }
    
    
    func detailing() {
        opl_sum.text = "Оплаченная сумма:"
        ost_sum.text = "Оставшиеся сумма:"
        obs_sum.text = "Общая сумма:"
        fl.backgroundColor = UIColor.black
        sl.backgroundColor = UIColor.black
        tl.backgroundColor = UIColor.black
        infl.text = "Информация о платежах"
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
       addview()
        detailing()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
