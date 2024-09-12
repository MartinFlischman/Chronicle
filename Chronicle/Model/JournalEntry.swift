//
//  JournalEntry.swift
//  Chronicle
//
//  Created by Martin on 2024/09/05.
//

import Foundation
import SwiftData

// Define a model class for a journal entry
@Model
final class JournalEntry {
    // Properties of the journal entry
    var title: String = ""
    var date: Date = Date()
    var rating: Double = 3.0
    var text: String = ""
    
    // Initializer method to set up a new journal entry
    init(title: String, date: Date, rating: Double, text: String) {
        self.title = title
        self.date = date
        self.rating = rating
        self.text = text
    }
}
