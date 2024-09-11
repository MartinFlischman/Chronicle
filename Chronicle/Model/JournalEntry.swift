//
//  JournalEntry.swift
//  Chronicle
//
//  Created by Martin on 2024/09/05.
//

import Foundation
import SwiftData

@Model
final class JournalEntry {
    var title: String = ""
    var date: Date = Date()
    var rating: Double = 3.0
    var text: String = ""
    
    init(title: String, date: Date, rating: Double, text: String) {
        self.title = title
        self.date = date
        self.rating = rating
        self.text = text
    }
}

//let journalEntries: [JournalEntry] = [
//    JournalEntry(
//        date: Date.now.addingTimeInterval(-3 * 24 * 60 * 60),
//        title: "Windy Friday",
//        text: """
//        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis consectetur lacus nec sollicitudin. Donec sit amet mauris at metus cursus faucibus et commodo nisl. Donec suscipit eros tincidunt commodo cursus. Nulla laoreet vulputate sollicitudin. Morbi id hendrerit ante. Mauris laoreet urna mi, non luctus magna tincidunt nec. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis consectetur lacus nec sollicitudin. Donec sit amet mauris at metus cursus faucibus et commodo nisl.
//        
//        Donec suscipit eros tincidunt commodo cursus. Nulla laoreet vulputate sollicitudin. Morbi id hendrerit ante. Mauris laoreet urna mi, non luctus magna tincidunt nec. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis consectetur lacus nec sollicitudin. Donec sit amet mauris at metus cursus faucibus et commodo nisl. Donec suscipit eros tincidunt commodo cursus. Nulla laoreet vulputate sollicitudin. Morbi id hendrerit ante. Mauris laoreet urna mi, non luctus magna tincidunt nec. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis consectetur lacus nec sollicitudin. Donec sit amet mauris at metus cursus faucibus et commodo nisl.
//              
//        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis consectetur lacus nec sollicitudin. Donec sit amet mauris at metus cursus faucibus et commodo nisl. Donec suscipit eros tincidunt commodo cursus. Nulla laoreet vulputate sollicitudin. Morbi id hendrerit ante. Mauris laoreet urna mi, non luctus magna tincidunt nec. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis consectetur lacus nec sollicitudin. Donec sit amet mauris at metus cursus faucibus et commodo nisl. Donec suscipit eros tincidunt commodo cursus. Nulla laoreet vulputate sollicitudin. Morbi id hendrerit ante. Mauris laoreet urna mi, non luctus magna tincidunt nec. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis consectetur lacus nec sollicitudin. Donec sit amet mauris at metus cursus faucibus et commodo nisl. Donec suscipit eros tincidunt commodo cursus. Nulla laoreet vulputate sollicitudin.
//        
//        Morbi id hendrerit ante. Mauris laoreet urna mi, non luctus magna tincidunt nec. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis consectetur lacus nec sollicitudin. Donec sit amet mauris at metus cursus faucibus et commodo nisl. Donec suscipit eros tincidunt commodo cursus. Nulla laoreet vulputate sollicitudin. Morbi id hendrerit ante. Mauris laoreet urna mi, non luctus magna tincidunt nec.
//        """,
//        rating: 2),
//    
//    JournalEntry(
//        date: Date.now.addingTimeInterval(-2 * 24 * 60 * 60),
//        title: "Sunny Saturday",
//        text: "Suspendisse a ante feugiat, egestas quam dictum, blandit nisl. Quisque ultricies hendrerit quam, et congue felis scelerisque sed. Suspendisse in odio ante. Nulla tempus mi erat, quis consequat nisi condimentum eu. In nec elit tempor, semper turpis dignissim, sodales justo. Donec eget sem rhoncus, hendrerit felis vitae, aliquam eros. Suspendisse potenti. Duis ultrices erat at neque euismod, feugiat hendrerit nunc laoreet. Morbi viverra metus et erat tempus bibendum.",
//        rating: 3),
//]
