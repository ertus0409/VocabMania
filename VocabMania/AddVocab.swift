//
//  AddVocab.swift
//  VocabMania
//
//  Created by Guner Babursah on 18/09/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddVocab: UIViewController, UITextFieldDelegate {
    
    
    //IBOUTLETS:
    @IBOutlet weak var wordField: UITextField!
    @IBOutlet weak var definitionField: UITextField!
    @IBOutlet weak var exampleSentenceField: UITextField!
    
    //VARIABLES:
    var ref: DatabaseReference!
    var indexNum: Int?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.wordField.delegate = self
        self.definitionField.delegate = self
        self.exampleSentenceField.delegate = self
        
        ref = Database.database().reference()

        
    }
    
    //TEXT FIELD HIDE
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.wordField.endEditing(true)
        self.definitionField.endEditing(true)
        self.exampleSentenceField.endEditing(true)
        return false
    }
    
    //ADD VOCAB TAPPED:
    @IBAction func AddVocabBtnTapped(_ sender: Any) {

        if wordField.text != "" || wordField.text != nil || definitionField.text != "" || definitionField.text != nil || exampleSentenceField.text != "" || exampleSentenceField.text != nil{
            ref.child("AllWords:").child(wordField.text!.capitalized).setValue(definitionField.text!)
            ref.child("WordExamples:").child(wordField.text!).setValue(exampleSentenceField.text?.capitalized)
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
