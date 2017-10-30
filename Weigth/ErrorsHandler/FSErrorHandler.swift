//
//  FSErrorHandler.swift
//  Weigth
//
//  Created by Nathan Furman on 7/13/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import UIKit


class FSErrorHandler: NSObject {
    
    public func getError(errorType: FSErrorType) -> NSError {
        
        let localizedDescription = FSErrorLocalizedDescription.getLocalizedDescription(errorType: errorType)
        let userInfo = NSDictionary(object: localizedDescription, forKey: NSLocalizedDescriptionKey as NSCopying)
        
        let error = NSError(domain: FSErrorDomain.app.rawValue, code: errorType.rawValue, userInfo: userInfo as? [AnyHashable : Any])
        
        return error
    }
    
}
