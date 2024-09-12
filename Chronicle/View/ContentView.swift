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
    @Query(sort: \JournalEntry.date, order: .reverse) private var journalEntries: [JournalEntry]
    
    @State var showCreateView = false
    
    var entriesQty: Int {
        journalEntries.count
    }
    
    var body: some View {
        NavigationStack {
            List(journalEntries) { listedJournalEntry in
                NavigationLink(destination: EditJournalEntryView(editingJournalEntry: listedJournalEntry)) {
                    JournalEntryRowView(journalEntryRow: listedJournalEntry)
                }
            }
            .navigationTitle("\(entriesQty) Journal Entries")
            .toolbar {
                    Button(action: {
                        showCreateView = true
                    }) {
                        Label("Add item", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showCreateView) {
                CreateJournalEntryView()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: JournalEntry.self, inMemory: true)
}
