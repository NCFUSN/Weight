//
//  FSUtilities.swift
//  Weigth
//
//  Created by Nathan Furman on 7/13/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import UIKit

enum FSFormat {
    
    case short
    case full
}

class FSUtilities: NSObject {

    static func createBlurView(view: UIView, alpha: CGFloat) {
        
        let blurView = UIView(frame: view.bounds)
        blurView.backgroundColor = UIColor.black.withAlphaComponent(alpha)
        view.addSubview(blurView)
    }
    
    static func whitespaceString(font: UIFont = UIFont.systemFont(ofSize: 15), width: CGFloat) -> String {
        let kPadding: CGFloat = 20
        let mutable = NSMutableString(string: "")
        let attribute = [NSFontAttributeName: font]
        while mutable.size(attributes: attribute).width < width - (2 * kPadding) {
            mutable.append(" ")
        }
        return mutable as String
    }
    
    static func editingViewPatternImage( cellHeigth: CGFloat, image: UIImage, imageWidth:CGFloat, imageHeigth: CGFloat, controlWidth: CGFloat) -> UIImage {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: controlWidth, height: cellHeigth))
        view.backgroundColor = UIColor.red
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageWidth, height: imageHeigth))
        imageView.center = view.center
        imageView.image = image
        view.addSubview(imageView)
        let image = view.theImage()
        return image
    }
    
    
    static func poundsToOunces(pounds: Double) -> Int {
        
        var quant = 0
        let numberAsString = String(pounds)
        var numbers = numberAsString.components(separatedBy: ["."])
        let sepPounds = Int(numbers[0])!
        let sepOunces = Int(numbers[1])!
        if sepPounds > 0 {
            
            quant += sepPounds * 16
        }
        if sepOunces > 0 {
            
            quant += sepOunces
        }
        return quant
    }

    static func ouncesToString(ounces: Int, format: FSFormat) -> NSMutableAttributedString {
        
        let pounds = ounces / 16
        let onc = ounces % 16
        
        let str = NSMutableAttributedString()
        
        if format == .short {
            
            if pounds > 0 {
                
                str.append(NSAttributedString(string: "\(pounds)"))
            }
            if onc > 0 {
                
                str.append(NSAttributedString(string: ".\(onc)"))
            }
            
            return str
        }
        // full format example. 330lb. 8oz.
        
        if pounds > 0 || pounds < 0 {
            
            str.append(NSAttributedString(string: " \(String(describing: pounds))lbs."))
        }
        
        if onc == 0 {
            
            return str
        }
        
        if onc > 0 || onc < 0 {
            
            str.append(NSAttributedString(string: " \(String(describing: abs(onc)))oz."))
        }
        
        return str
    }
}
