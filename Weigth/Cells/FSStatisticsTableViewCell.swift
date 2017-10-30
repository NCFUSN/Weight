//
//  FSStatisticsTableViewCell.swift
//  Weigth
//
//  Created by Nathan Furman on 7/13/17.
//  Copyright © 2017 NCFUSN. All rights reserved.
//

import UIKit

class FSStatisticsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        self.contentView.backgroundColor = UIColor.darkText
    }
}
