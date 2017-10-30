//
//  FSRecordsTableViewController.swift
//  Weigth
//
//  Created by Nathan Furman on 6/27/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import UIKit

class FSRecordsTableViewController: UITableViewController, FSPersistentStoreDelegate {

    var records = [FSCDRecord]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Records"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        tableViewRegisterCells()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        reloadData()
    }
    
    fileprivate func reloadData() {
        
        records = FSPersistentStore.sharedInstance.getRecords()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
        }
        return records.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let _: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className)!
        
        if indexPath.section == 0 {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: FSStatisticsTableViewCell.className) as? FSStatisticsTableViewCell
        
            return cell!
            
        } else {
            
            
        let cell = tableView.dequeueReusableCell(withIdentifier: FSRecordTableViewCell.className) as? FSRecordTableViewCell
        
            
            let record = records[indexPath.row]
            
            if !record.updown {
                
                let color = UIColor(red: 0.067, green: 0.424, blue: 0.200, alpha: 1.00)
                cell?.lblProgress.backgroundColor = color
                cell?.lblRightSide.backgroundColor = color
                
            } else {
                
                cell?.lblProgress.backgroundColor = UIColor.red
                cell?.lblRightSide.backgroundColor = UIColor.red
            }
            
            print(record.progress.description)
            
            cell?.lblValue.attributedText = FSUtilities.ouncesToString(ounces: Int(record.record), format: .short)
            cell?.lblProgress.attributedText = FSUtilities.ouncesToString(ounces: Int(record.progress), format: .full)
            
            return cell!
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            return 200
        }
        return 70
    }
    
    func tableViewRegisterCells() {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.className)
        tableView.register(FSStatisticsTableViewCell.self, forCellReuseIdentifier: FSStatisticsTableViewCell.className)
        tableView.register(FSRecordTableViewCell.self, forCellReuseIdentifier: FSRecordTableViewCell.className)
        tableView.backgroundColor = UIColor.white
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.showsVerticalScrollIndicator = false
    }

    
    
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        
//        let whitespace = FSUtilities.whitespaceString(width: 80)
//        let deleteAction = UITableViewRowAction(style: .default, title: whitespace) { (action, indexPath) in
//            
//            let record = self.records[indexPath.row]
//            FSPersistentStore.sharedInstance.delete(record: record)
//        }
//        
//        let image = FSUtilities.editingViewPatternImage(cellHeigth: 100, image: FSImageAsset.trashbin.image, imageWidth: 20, imageHeigth: 28, controlWidth: 80)
//        
//        deleteAction.backgroundColor = UIColor(patternImage: image)
//        
//        return [deleteAction]
//    }

    
    func add() {
        
        let newRecord = FSAddRecordViewController()
        self.navigationController?.pushViewController(newRecord, animated: true)
    }
    
    //MARK: - FSPersistentStoreDelegate
    
    func persistentStoreDidPersist() {
        
        //
    }
    func persistentStoreDidFail(error: NSError) {
        //
    }
    
    func persistentStoreDidDelete() {
        
        
    }
}
