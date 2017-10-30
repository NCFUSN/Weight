//
//  FSPersistentStore.swift
//  Weigth
//
//  Created by Nathan Furman on 6/27/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import UIKit
import CoreData


class FSPersistentStore: FSPersistentStoreEngine {
    
    static let sharedInstance = FSPersistentStore()
    
    override init() {
        super.init()
    }
    
    func persist(record: Int) {
        
        if record < 1 {
            
            delegate?.persistentStoreDidFail(error: FSErrorHandler().getError(errorType: .missingParameters))
            return
        }
        
        let object = FSCDRecord(context: persistentContainer.viewContext)
        let lastRecord = getLastRecord()
        if lastRecord != nil {
            
            // got fat
            if Int16(record) > Int16(lastRecord!.record) {
                
                object.updown = true
                
            } else {
                
                object.updown = false
            }
            
            object.progress = (Int16(record) - Int16(lastRecord!.record))
        }
        object.record = Int16(record)
        object.date = Date() as NSDate
        saveAction(nil)
    }
    
    func delete(record: FSCDRecord) {
        
        let request = NSFetchRequest<FSCDRecord>(entityName: "FSCDRecord")
        do {
            
            let searchResult = try persistentContainer.viewContext.fetch(request)
            for rec in searchResult {
                
                if rec == record {
                    
                    persistentContainer.viewContext.delete(rec)
                }
                delegate?.persistentStoreDidDelete()
            }
            } catch {
                
                print("Error with request: \(error)")
            }
        
        saveAction(nil)
    }

    
    func getRecords() -> [FSCDRecord] {
        
        let editors = [FSCDRecord]()
        do {
            let fetchRequest: NSFetchRequest<FSCDRecord> = FSCDRecord.fetchRequest()
            let sort = NSSortDescriptor(key: #keyPath(FSCDRecord.date), ascending: false)
            fetchRequest.sortDescriptors = [sort]
            let cdrecords:[FSCDRecord] = try persistentContainer.viewContext.fetch(fetchRequest)
            return cdrecords
            
        } catch {
            
            let error = FSErrorHandler().getError(errorType: .errorRetrivingData)
            delegate?.persistentStoreDidFail(error: error)
        }
        
        return editors
    }
    
    func getLastRecord() -> FSCDRecord? {
        
        do {
            let fetchRequest: NSFetchRequest<FSCDRecord> = FSCDRecord.fetchRequest()
            let sort = NSSortDescriptor(key: #keyPath(FSCDRecord.date), ascending: false)
            fetchRequest.sortDescriptors = [sort]
            let cdrecords:[FSCDRecord] = try persistentContainer.viewContext.fetch(fetchRequest)
            return cdrecords.first
            
        } catch {
            
            let error = FSErrorHandler().getError(errorType: .errorRetrivingData)
            delegate?.persistentStoreDidFail(error: error)
        }
        
        return nil
    }
}
