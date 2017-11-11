//
//  QuizVC.swift
//  VocabMania
//
//  Created by Guner Babursah on 26/09/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import UIKit

class QuizVC: UIViewController {
    
    
    //@IBOUTLETS
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var optionA: UILabel!
    @IBOutlet weak var optionB: UILabel!
    @IBOutlet weak var optionC: UILabel!
    @IBOutlet weak var optionD: UILabel!
    @IBOutlet weak var answerA: FancyButton!
    @IBOutlet weak var answerB: FancyButton!
    @IBOutlet weak var answerC: FancyButton!
    @IBOutlet weak var answerD: FancyButton!
    
    //VARIABLES
    var myInt: Int?
    var keyWord: String?
    var keyDefinition: String?
    var randDefinition2: String?
    var randDefinition3: String?
    var randDefinition4: String?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(myInt)")
        

        
    }

    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
