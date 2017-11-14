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
    @IBOutlet weak var warningLbl: UILabel!
    
    //VARIABLES
    //posts:
    var post: Vocab!
    var postOne: Vocab!
    var postTwo: Vocab!
    var postThree: Vocab!
    var answerNum: Int?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        word.text = post.vocabName
        configureTest()
    }
    
    func configureTest(){
        let randomNum: UInt32 = arc4random_uniform(UInt32(4))
        answerNum = Int(randomNum)
        if answerNum == 0 {
            optionA.text = post.vocabDefinition
            optionB.text = postOne.vocabDefinition
            optionC.text = postTwo.vocabDefinition
            optionD.text = postThree.vocabDefinition
        } else if answerNum == 1 {
            optionA.text = postOne.vocabDefinition
            optionB.text = post.vocabDefinition
            optionC.text = postTwo.vocabDefinition
            optionD.text = postThree.vocabDefinition
        } else if answerNum == 2 {
            optionA.text = postOne.vocabDefinition
            optionB.text = postTwo.vocabDefinition
            optionC.text = post.vocabDefinition
            optionD.text = postThree.vocabDefinition
        } else if answerNum == 3 {
            optionA.text = postOne.vocabDefinition
            optionB.text = postTwo.vocabDefinition
            optionC.text = postThree.vocabDefinition
            optionD.text = post.vocabDefinition
        }
    }
    
    
    
    //CONFIGURING OPTIONS:
    @IBAction func A(_ sender: Any) {
        if optionA.text == post.vocabDefinition {
            warningLbl.text = "CONGRAGULATIONS!"
            warningLbl.textColor = UIColor.green
            self.performSegue(withIdentifier: "Correct", sender: self)

        }else {
            warningLbl.text = "WRONNG ANSWER"
            warningLbl.textColor = UIColor.red
        }
    }
    
    @IBAction func B(_ sender: Any) {
        if optionB.text == post.vocabDefinition {
            warningLbl.text = "CONGRAGULATIONS!"
            warningLbl.textColor = UIColor.green
            self.performSegue(withIdentifier: "Correct", sender: self)
        }else {
            warningLbl.text = "WRONNG ANSWER"
            warningLbl.textColor = UIColor.red
        }
    }

    @IBAction func C(_ sender: Any) {
        if optionC.text == post.vocabDefinition {
            warningLbl.text = "CONGRAGULATIONS!"
            warningLbl.textColor = UIColor.green
            self.performSegue(withIdentifier: "Correct", sender: self)
        }else {
            warningLbl.text = "WRONNG ANSWER"
            warningLbl.textColor = UIColor.red
        }
    }
    
    @IBAction func D(_ sender: Any) {
        if optionD.text == post.vocabDefinition {
            warningLbl.text = "CONGRAGULATIONS!"
            warningLbl.textColor = UIColor.green
            self.performSegue(withIdentifier: "Correct", sender: self)
        }else {
            warningLbl.text = "WRONNG ANSWER"
            warningLbl.textColor = UIColor.red
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Correct" {
            let _ = segue.destination as? VocabListMainVC
        }
    }
    
    
    //CANCEL BUTTON:
    @IBAction func cancelBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
