//
//  AddVocab.swift
//  VocabMania
//
//  Created by Guner Babursah on 18/09/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddVocab: UIViewController {
    
    
    //IBOUTLETS:
    @IBOutlet weak var wordField: UITextField!
    @IBOutlet weak var definitionField: UITextField!
    @IBOutlet weak var exampleSentenceField: UITextField!
    
    //VARIABLES:
    var ref: DatabaseReference!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        
    }
    
    
    //ADD VOCAB TAPPED:
    @IBAction func AddVocabBtnTapped(_ sender: Any) {

        if wordField.text != "" || wordField.text != nil || definitionField.text != "" || definitionField.text != nil || exampleSentenceField.text != "" || exampleSentenceField.text != nil{
            ref.child("AllWords:").childByAutoId().setValue(wordField.text)
            ref.child("WordDefinitons:").child(wordField.text!).setValue(definitionField.text)
            ref.child("WordExamples:").child(wordField.text!).setValue(exampleSentenceField.text)
        }
        
        performSegue(withIdentifier: "BackToMain", sender: self)
        
    }
    
    
    //SEGUE:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BackToMain" {
            _ = segue.destination as? VocabListMainVC
        }
    }
    


}
