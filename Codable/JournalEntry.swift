//
//  JournalEntry.swift
//  Codable
//
//  Created by Alex Gibson on 6/6/17.
//  Copyright © 2017 Apptillery. All rights reserved.
//

import Foundation

struct JournalEntry{
    var identifier: String
    var entryText : String
    var createdAt: Date
    
    //these are our methods that are mostly used
    init(identifier:String,entryText:String,createdAt:Date){
        self.identifier = identifier
        self.entryText = entryText
        self.createdAt = createdAt
    }
    
    init(entryText:String){
        self = JournalEntry(identifier:NSUUID().uuidString,entryText: entryText,createdAt:Date())
    }
    
}
