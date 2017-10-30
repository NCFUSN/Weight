//
//  FSConstants.swift
//  Weigth
//
//  Created by Nathan Furman on 7/13/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import Foundation
import UIKit

enum FSImageAsset: String {
    
    case trashbin = "trashbin"
}

extension FSImageAsset {
    var image : UIImage {
        return UIImage(named: self.rawValue)!
    }
}

class FSConstants: NSObject {
    
    static let goal = 176.0
}
