//
//  FSStringExtensions.swift
//  Weigth
//
//  Created by Nathan Furman on 7/13/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import Foundation

public extension String {
    
    var localized: String {
        
        return NSLocalizedString(self, tableName: nil, bundle:  Bundle.main, value: "", comment: "")
    }
}

