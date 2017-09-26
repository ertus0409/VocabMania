//
//  WordExplanationVC.swift
//  VocabMania
//
//  Created by Guner Babursah on 18/09/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import UIKit
import FirebaseDatabase

class WordExplanationVC: UIViewController {
    
    //IBOUTLETS:
    @IBOutlet weak var wordLbl: UILabel!
    @IBOutlet weak var definitionLbl: UILabel!
    @IBOutlet weak var exampleSentenceLbl: UILabel!
    
    //VARIABLES:
    var word: String?
    var definition: String?
    var exampleSentence: String?
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        wordLbl.text = word
        definitionLbl.text = definition?.capitalized
        ref?.child("AllWords:").child(word!).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let item = snapshot.value as? String{
                self.exampleSentenceLbl.text = item.capitalized
                print(item)
            }
        })
        
        
        

        
    }
    
    
    @IBAction func DeleteBtnTapped(_ sender: Any) {
        
        ref.child("AllWords:").child(wordLbl.text!).removeValue()
        ref.child("WordExamples:").child(wordLbl.text!).removeValue()
        performSegue(withIdentifier: "Deleted", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Deleted" {
            _ = segue.destination as! VocabListMainVC
//
        }
    }
    
    


}
