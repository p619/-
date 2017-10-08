//
//  ChemistryTableViewCell.swift
//  chem1
//
//  Created by heroshi on 2017/5/14.
//  Copyright © 2017年 heroshi. All rights reserved.
//

import UIKit

class ChemistryTableViewCell: UITableViewCell {
    
        @IBOutlet var questionLabel: UILabel!
        @IBOutlet var typeLabel: UILabel!
        //@IBOutlet var thumbnailImageView: UIImageView!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            // Configure the view for the selected state
        }
        
}
