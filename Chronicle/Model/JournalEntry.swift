//
//  JournalEntry.swift
//  Chronicle
//
//  Created by Martin on 2024/09/05.
//

import Foundation
import SwiftData

// MARK: Journal Entry Model Class
// Define a model class for a journal entry
@Model
final class JournalEntry {
    // MARK: Properties
    // Properties of the journal entry
    var title: String = "" // Title of the journal entry
    var date: Date = Date() // Date of the journal entry
    var rating: Double = 3.0 // Rating for the journal entry
    var text: String = "" // Text content of the journal entry
    
    // MARK: Initializer
    // Initializer method to set up a new journal entry
    init(title: String, date: Date, rating: Double, text: String) {
        self.title = title
        self.date = date
        self.rating = rating
        self.text = text
    }
}
