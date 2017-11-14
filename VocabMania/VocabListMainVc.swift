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
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    //VARAIABLES:
    var vocabs = [Vocab]()
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    
    
    var wordChosenTableView:Int?
    var isSearching = false
    var filteredData = [Vocab!]()
    

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
            self.vocabs = []
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
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
    @IBAction func startQuizTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "StartQuiz", sender: self)
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
        }
        
        if segue.identifier == "StartQuiz" {
            let quizPage = segue.destination as? QuizVC
            
            let randomNum: UInt32 = arc4random_uniform(UInt32(vocabs.count))
            let someInt = Int(randomNum)
            quizPage?.post = vocabs[someInt]
            
            let randomNumOne:UInt32 = arc4random_uniform(UInt32(vocabs.count))
            let someIntOne = Int(randomNumOne)
            quizPage?.postOne = vocabs[numberCheck(num1: someIntOne, num2: someInt)]
            
            let randomNumTwo:UInt32 = arc4random_uniform(UInt32(vocabs.count))
            let someIntTwo = Int(randomNumTwo)
            quizPage?.postTwo = vocabs[numberCheck(num1: someIntTwo, num2: someIntOne)]

            let randomNumThree:UInt32 = arc4random_uniform(UInt32(vocabs.count))
            let someIntThree = Int(randomNumThree)
            quizPage?.postThree = vocabs[numberCheck(num1: someIntThree, num2: someIntTwo)]
            
        }
        
    }
    
    //Checks wether the random generator created same number twice.
    func numberCheck(num1: Int, num2: Int) -> Int {
        if num1 == num2 {
            var random: UInt32 = arc4random_uniform(UInt32(vocabs.count))
            var num = Int(random)
            numberCheck(num1: num, num2: num2)
            return num
        } else {
            return num1
        }
        
    }
   
    
    
    
    

   

}

