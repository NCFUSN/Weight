//
//  FSUIImageExtension.swift
//  Weigth
//
//  Created by Nathan Furman on 7/13/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    convenience init(asset: FSImageAsset) {
        self.init(named: asset.rawValue)!
    }
}
