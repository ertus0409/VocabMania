//
//  VocabListMainVC.swift
//  VocabMania
//
//  Created by Guner Babursah on 17/09/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import UIKit
import Foundation
import FirebaseDatabase

class VocabListMainVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //IBOUTLETS:
    @IBOutlet weak var wordList: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addVocabBtn: UIButton!
    
    
    
    //VARAIABLES:
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    var WORDS = [String]()
    var DEFINITIONS = [String]()
    var EXAMPLES = [String]()
    var example: String?
    var wordChosenTableView:Int?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        testFillWords()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        myDatabaseObserver()
        
        print(WORDS)
        
        
        
        
    }
    
    //TABLEVIEW FUNCTIONS:
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "VocabCell", for: indexPath) as? VocabCell {
            
            let wordy = WORDS[indexPath.row]
            
            cell.updateUI(myWord: wordy)
            
            return cell
            
        } else {
            return VocabCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WORDS.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        wordChosenTableView = indexPath.row
        
        performSegue(withIdentifier: "WordExplanation", sender: self)
    }
    
    
    
    @IBAction func addVocabBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "addVocab", sender: self)
    }
    
    
    
    
    //SEGUE:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addVocab" {
            let addVocabulary = segue.destination as? AddVocab
            addVocabulary?.indexNum = wordChosenTableView
        }
        
        if segue.identifier == "WordExplanation" {
            let wordPage = segue.destination as? WordExplanationVC
            
            wordPage?.word = WORDS[wordChosenTableView!]
            wordPage?.definition = DEFINITIONS[wordChosenTableView!]
            
            
        }
        
    }
    
    
    //DATABASE OBSERVER:
    func myDatabaseObserver() {
        
        ref = Database.database().reference()
        handle = ref.child("AllWords:").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.key as? String {
                self.WORDS.append(item)
                self.tableView.reloadData()
            }
        })
        
        handle = ref.child("AllWords:").observe(.childAdded, with: { (snapshot) in
            if let itemm = snapshot.value as? String {
                self.DEFINITIONS.append(itemm)
                self.tableView.reloadData()
            }
        })
        
        
        
        

    }
    
    
    
    
    
    

   

}

