//
//  FSNSObjectExtension.swift
//  Weigth
//
//  Created by Nathan Furman on 7/13/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
