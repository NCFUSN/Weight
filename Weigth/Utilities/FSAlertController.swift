//
//  FSAlertController.swift
//  Weigth
//
//  Created by Nathan Furman on 7/13/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import Foundation
import UIKit

public class FSAlertController: NSObject {
    
    class func showAlert(title: String, message: String, callBack:@escaping (_ buttonIndex:Int) -> Void,theClass:UIViewController) {
        
        let alert = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "dismiss".localized, style: .default) { (cancelAction) in
            if let alertIndex = alert.actions.index(of: cancelAction) {
                callBack(alertIndex)
            }
            alert.dismiss(animated: true, completion: nil);
        }
        alert.addAction(cancelAction)
        theClass.present(alert, animated: true, completion: nil)
    }
}
