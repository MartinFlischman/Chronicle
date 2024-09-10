//
//  ContentView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/03.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
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
            .toolbar {
                    Button(action: {
                        let newJournalEntry = JournalEntry(date: Date(), title: "Hello", text: "No news", rating: 2)
                        modelContext.insert(newJournalEntry)
                    }) {
                        Label("Add item", systemImage: "plus")
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: JournalEntry.self, inMemory: true)
}
