//
//   Configure the view for the selected state     }  } ChemistryDetailTableViewCell.swift
//  chem1
//
//  Created by heroshi on 2017/5/14.
//  Copyright © 2017年 heroshi. All rights reserved.
//

import UIKit

class ChemistryDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var notetextfield: UITextField!
    
    @IBOutlet weak var groupQueslabel: UILabel!
    @IBOutlet weak var groupQuesPic: UIImageView!
    @IBOutlet weak var groupQuesPic2: UIImageView!
    
    @IBOutlet weak var figImage: UIImageView!
    @IBOutlet weak var quesOrFigDetail: UILabel!
    @IBOutlet weak var equImage: UIImageView!
    @IBOutlet weak var equImage2: UIImageView!
    @IBOutlet var fieldLabel:UILabel!
    @IBOutlet var ansLabel:UILabel!
    
    @IBOutlet weak var grade: UILabel!

    @IBOutlet weak var yourAnsLabel: UILabel!
    @IBOutlet var valueLabel:UILabel!
    // @IBAction func answerBtn(_ sender: Any) { print(fieldLabel.text) }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
