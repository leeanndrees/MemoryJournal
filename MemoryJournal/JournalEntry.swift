//
//  JournalEntry.swift
//  MemoryJournal
//
//  Created by DetroitLabs on 9/10/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import Foundation

class JournalEntry: NSObject {
    var entryTitle: String
    var entryContent: String
    var entryDate: String
    
    init(entryTitle: String, entryContent: String, entryDate: String) {
        self.entryTitle = entryTitle
        self.entryContent = entryContent
        self.entryDate = entryDate
    }
}
