//
//  VocabCell.swift
//  VocabMania
//
//  Created by Guner Babursah on 18/09/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import UIKit

class VocabCell: UITableViewCell {

    @IBOutlet weak var cellLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    func updateUI(myWord: String){
        
        cellLbl.text = myWord
        
    }


}
