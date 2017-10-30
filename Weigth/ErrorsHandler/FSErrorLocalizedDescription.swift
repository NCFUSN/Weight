//
//  FSErrorLocalizedDescription.swift
//  Weigth
//
//  Created by Nathan Furman on 7/13/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import UIKit

class FSErrorLocalizedDescription: NSObject {
    
    // FailureReasonBody
    
    class func getLocalizedDescription(errorType: FSErrorType) -> String {
        
        switch(errorType) {
            
        case .missingParameters: return "missing_parameters".localized
        case .errorRetrivingData: return "error_retrieving_data".localized
            
        }
    }

}
