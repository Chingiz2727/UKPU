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
    var collectionview  : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        cv.layer.masksToBounds = false
        return cv
    }()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! PaymentCollectionViewCell
        cell.first_t.text = "ukulele"
        cell.money.text = "100 000"
        cell.img.image = UIImage.init(named: "News")
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addview()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        
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
