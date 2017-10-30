//
//  FSDevice.swift
//  Weigth
//
//  Created by Nathan Furman on 7/13/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import Foundation
import UIKit

public struct FSDevice {
    
    static func isPad() -> Bool {
        let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
        if deviceIdiom == .pad {
            return true
        }
        return false
    }
    
    static func isPhone() -> Bool {
        let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
        if deviceIdiom == .phone {
            return true
        }
        return false
    }
    
    static func rotation() -> UIInterfaceOrientationMask {
        
        let orientation = UIApplication.shared.statusBarOrientation
        switch orientation {
            
        case .landscapeLeft:
            
            return UIInterfaceOrientationMask.landscapeLeft
            
        case .landscapeRight:
            
            return UIInterfaceOrientationMask.landscapeRight
            
        case .portrait:
            
            return UIInterfaceOrientationMask.portrait
            
        case .portraitUpsideDown:
            
            return UIInterfaceOrientationMask.portraitUpsideDown
            
        default:
            
            return UIInterfaceOrientationMask.landscape
        }
    }
}
