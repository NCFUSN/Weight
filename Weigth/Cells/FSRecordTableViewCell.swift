//
//  FSRecordTableViewCell.swift
//  Weigth
//
//  Created by Nathan Furman on 7/9/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import UIKit

class FSRecordTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    let lblValue: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: UIFontWeightLight)
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblProgress: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(red: 0.067, green: 0.424, blue: 0.200, alpha: 1.00)
        label.textColor = UIColor.white
        return label
    }()
    
    let lblRightSide: UILabel = {
        
        let label = UILabel()
        label.backgroundColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(lblValue)
        addSubview(lblProgress)
        addSubview(lblRightSide)
        addConstraints(format: "V:|-0-[v0]-0-|", views: lblRightSide)
        addConstraints(format: "H:|-0-[v0(8)]", views: lblRightSide)
        addConstraints(format: "V:|-3-[v0(20)]-3-|", views: lblProgress)
        addConstraints(format: "H:[v0(80)]-3-|", views: lblProgress)
        addConstraints(format: "V:|-0-[v0]-0-|", views: lblValue)
        addConstraints(format: "H:|-20-[v0(300)]", views: lblValue)
    }
}
