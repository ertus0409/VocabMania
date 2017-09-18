//
//  WordExplanationVC.swift
//  VocabMania
//
//  Created by Guner Babursah on 18/09/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import UIKit

class WordExplanationVC: UIViewController {
    
    //IBOUTLETS:
    @IBOutlet weak var wordLbl: UILabel!
    @IBOutlet weak var definitionLbl: UILabel!
    @IBOutlet weak var exampleSentenceLbl: UILabel!
    
    //VARIABLES:
    var word: String?
    var definition: String?
    var exampleSentence: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    


}
