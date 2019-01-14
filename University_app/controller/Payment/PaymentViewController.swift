//
//  PaymentViewController.swift
//  University_app
//
//  Created by Чингиз on 1/8/19.
//  Copyright © 2019 Чингиз. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    let cellid = "cellid"
    var PayView : PaymentView!
    var range = [DatesAndPrice]()
    var paidcount : Int?
    var opls  : Int? {
        didSet {
            PayView.opl_text.text = "\(opls!)"
        }
    }
    var ostt : Int? {
        didSet {
            PayView.ost_text.text = "\(ostt!)"
        }
    }
    var obss : Int? {
        didSet {
            PayView.obs_text.text = "\(obss!)"
        }
    }
    var collectionview  : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        cv.layer.masksToBounds = false
        return cv
    }()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return range.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! PaymentCollectionViewCell
        let item = range[indexPath.row]
        cell.first_t.text = item.date!
        cell.money.text = "\(item.price!)"
        if indexPath.row <= paidcount! - 1 {
            cell.img.image = UIImage.init(named: "icon_done")
        }
            
        else {
            cell.img.image = UIImage.init(named: "icon_not_done")
        }
        return cell
    }
    func reloaddata() {
        GetPayment.get { (range) in
            self.range = (range?.datesAndPrices!)!
            self.collectionview.reloadData()
            self.obss = range?.totalPrice
            self.ostt = range?.remainedPrice
            self.opls = range?.paidPrice
            self.paidcount = (range?.paidPrice)!/((range?.totalPrice)!/((range?.datesAndPrices?.count)!))
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addview()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        reloaddata()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(4 - 1))
            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(4))
            return CGSize(width: size, height: 100)
    }
    func addview () {
        let payv = PaymentView(frame: CGRect(x: 0, y: 0, width: self.view.width, height: 170))
        self.PayView = payv
        self.view.addSubview(PayView)
        self.view.addSubview(collectionview)
        collectionview.setAnchor(top: PayView.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 5,width: 0,height: 200)
        
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(PaymentCollectionViewCell.self, forCellWithReuseIdentifier: cellid)
    }
    

   
}
