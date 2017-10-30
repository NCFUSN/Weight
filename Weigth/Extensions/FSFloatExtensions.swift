//
//  FSFloatExtension.swift
//  Weigth
//
//  Created by Nathan Furman on 7/16/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import Foundation

extension Float {

    var remainderFree: String{
        
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
