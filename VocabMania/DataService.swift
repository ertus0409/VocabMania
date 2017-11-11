//
//  DataService.swift
//  VocabMania
//
//  Created by Guner Babursah on 07/10/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    
    static let ds = DataService()
    
    
    private var _REF_BASE = DB_BASE
    private var _REF_WORDS = DB_BASE.child("Words")
    private var _REF_EXAMPLES = DB_BASE.child("WordExamples")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_WORDS: DatabaseReference {
        return _REF_WORDS
    }
    
    var REF_EXAMPLES: DatabaseReference {
        return _REF_EXAMPLES
    }
    
    func createFirebaseDBUser(word: String, definition: String) {
        REF_WORDS.child(word).child(definition)
    }
    
    
    
    
    
    
    
    
}

