//
//  FSAddRecordViewController.swift
//  Weigth
//
//  Created by Nathan Furman on 7/9/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import UIKit


class FSAddRecordViewController: UIViewController, FSPersistentStoreDelegate {

    let persistentStore = FSPersistentStore.sharedInstance
    
    let tfWeight: UITextField = {
        
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.placeholder = "Pounds..."
        textField.becomeFirstResponder()
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    let btnSubmit: UIButton = {
        
        let btn = UIButton()
        btn.backgroundColor = UIColor.green
        btn.titleLabel!.text = "Save"
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action:#selector(btnSubmitFired), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        self.title = "New Weight"
        setupViews()
    }

    fileprivate func setupViews() {
        
        view.addSubview(tfWeight)
        view.addSubview(btnSubmit)
        view.addConstraints(format: "H:|-40-[v0]-40-|", views: tfWeight)
        view.addConstraints(format: "V:|-100-[v0(45)]", views: tfWeight)
        view.addConstraints(format: "H:|-100-[v0]-100-|", views: btnSubmit)
        view.addConstraints(format: "V:|-170-[v0(45)]", views: btnSubmit)
    }
    
    @objc fileprivate func btnSubmitFired() {
        
        
        guard let weightValue = NumberFormatter().number(from: tfWeight.text!) else {
        
        FSAlertController.showAlert(title: "error".localized, message: "Wrong value. Use floating point values like 1 or 123.12", callBack: { (btnIndex) in
            //
        }, theClass: self)
            
            return
        }
        persistentStore.delegate = self
        persistentStore.persist(record:(FSUtilities.poundsToOunces(pounds: Double(weightValue))))
    }
    
    //MARK: - FSPersistentStoreDelegate
    
    func persistentStoreDidFail(error: NSError) {
        
        FSAlertController.showAlert(title: "error".localized, message: error.localizedDescription, callBack: { (btnIndex) in
            //
        }, theClass: self)
    }
    
    func persistentStoreDidPersist() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func persistentStoreDidDelete() {
        //
    }
}
