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
    var vocabs = [Vocab]()
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    
    
    var EXAMPLES = [String]()
    var example: String?
    var wordChosenTableView:Int?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myDatabaseObserver()
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    
    
    //TABLEVIEW FUNCTIONS:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "VocabCell", for: indexPath) as? VocabCell {
            
            let vocab = vocabs[indexPath.row]
            
            cell.updateUI(vocab: vocab)
            
            return cell
            
        } else {
            return VocabCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocabs.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        wordChosenTableView = indexPath.row
        
        performSegue(withIdentifier: "WordExplanation", sender: self)
    }
    
    
    
    @IBAction func addVocabBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "addVocab", sender: self)
    }
    
    
    //DATABASE OBSERVER:
    func myDatabaseObserver() {
        
        DataService.ds.REF_WORDS.observe(.value, with: { (snapshot) in
            print("check")
            self.vocabs = []
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                print("check")
                for snap in snapshot {
                    print("check")
                    print("SNAP: \(snap)")
                    if let vocabDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let vocab = Vocab(vocabKey: key, data: vocabDict)
                        self.vocabs.append(vocab)
                    }
                }
            }
            self.tableView.reloadData()
        })
        
        
    }
    
    
    //STARTQUIZ:
     var someInt: Int?
    @IBAction func startQuizTapped(_ sender: Any) {
        
        let randomNum:UInt32 = arc4random_uniform(UInt32(WORDS.count))
        someInt = Int(randomNum)
        print("ARTH: \(someInt)")
        
        
        performSegue(withIdentifier: "StartQuiz", sender: self)
        
        
        
    }
    
    
    //SEGUE:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addVocab" {
            let addVocabulary = segue.destination as? AddVocab
            addVocabulary?.indexNum = wordChosenTableView
        }
        
        if segue.identifier == "WordExplanation" {
            let wordPage = segue.destination as? WordExplanationVC
            wordPage?.theVocab = vocabs[wordChosenTableView!]
            
//            wordPage?.word = WORDS[wordChosenTableView!]
//            wordPage?.definition = DEFINITIONS[wordChosenTableView!]
            
            
        }
        
        if segue.identifier == "StartQuiz" {
            let quizPage = segue.destination as? QuizVC
            quizPage?.myInt = self.someInt
        }
        
    }
    
   
    
    
    
    

   

}

