//
//  VocabListMainVC.swift
//  VocabMania
//
//  Created by Guner Babursah on 17/09/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import UIKit
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        testFillWords()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        myDatabaseObserver()
        
        
        
        
        
        
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
        
    }
    
    
    
    @IBAction func addVocabBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "addVocab", sender: self)
    }
    
    
    
    //SEGUE:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addVocab" {
            _ = segue.destination as? AddVocab
        }
        if segue.identifier == "WordExplanation" {
            var wordPage = segue.destination as? WordExplanationVC
//            wordPage?.word = 
        }
    }
    
    //DATABASE OBSERVER:
    func myDatabaseObserver() {
        
        ref = Database.database().reference()
        handle = ref.child("AllWords:").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? String {
                self.WORDS.append(item)
                self.tableView.reloadData()
            }
        })

    }
    
    
    
    

   

}

