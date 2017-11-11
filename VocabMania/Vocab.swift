//
//  Vocab.swift
//  VocabMania
//
//  Created by Guner Babursah on 06/11/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import Foundation
import Firebase

class Vocab {
    
    private var _vocabKey: String!
    private var _vocabName: String!
    private var _vocabDefinition: String!
    private var _vocabExample: String!
    private var _wordRef: DatabaseReference!
    
    var vocabKey: String {
        return _vocabKey
    }
    
    var vocabName: String {
        return _vocabName
    }
    
    var vocabDefinition: String {
        return _vocabDefinition
    }
    
    var vocabExample: String {
        return _vocabExample
    }
    
    init(vocabName: String, vocabDefinition: String, vocabExample: String) {
        self._vocabName = vocabName
        self._vocabDefinition = vocabDefinition
        self._vocabExample = vocabExample
    }
    

    init(vocabKey: String, data: Dictionary<String, AnyObject>) {
        self._vocabKey = vocabKey
        
        if let vocabName = data["name"] as? String {
            self._vocabName = vocabName
        }
        
        if let vocabDefinition = data["definition"] as? String {
            self._vocabDefinition = vocabDefinition
        }
        
        if let vocabExample = data["example"] as? String {
            self._vocabExample = vocabExample
        }
        
        _wordRef = DataService.ds.REF_WORDS.child(_vocabKey)
    }

    
    
    
    
}
