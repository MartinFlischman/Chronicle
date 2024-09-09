//
//  ContentView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/03.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query private var journalEntries: [JournalEntry]
    
    var entriesQty: Int {
        journalEntries.count
    }
    
    var body: some View {
        NavigationStack {
            List(journalEntries) { listedJournalEntry in
                NavigationLink(destination: JournalEntryDetailView(entry: listedJournalEntry)) {
                    JournalEntryRowView(journalEntryRow: listedJournalEntry)
                }
            }
            .navigationTitle("\(entriesQty) Journal Entries")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: JournalEntry.self, inMemory: true)
}
