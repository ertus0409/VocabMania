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
    var indexNum: Int?
    var updateVocab: Vocab?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.wordField.delegate = self
        self.definitionField.delegate = self
        self.exampleSentenceField.delegate = self
        
        if updateVocab != nil {
            wordField.text = updateVocab?.vocabName
            definitionField.text = updateVocab?.vocabDefinition
            exampleSentenceField.text = updateVocab?.vocabExample
        }
        
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
        
        let vocab: Dictionary<String, AnyObject> = [
            "name": wordField.text as AnyObject,
            "definition": definitionField.text as AnyObject,
            "example": exampleSentenceField.text as AnyObject
        ]
        
        if updateVocab != nil {
            let _ = DataService.ds.REF_WORDS.child((updateVocab?.vocabKey)!).setValue(vocab)
        } else {
            let _ = DataService.ds.REF_WORDS.childByAutoId().setValue(vocab)
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
