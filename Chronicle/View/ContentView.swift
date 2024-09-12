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
    
    @State private var showCreateView = false  // Controls the display of the CreateJournalEntryView
    @State private var showInfoView = false    // Controls the display of the InfoView
    
    var entriesQty: Int {
        journalEntries.count  // Returns the number of journal entries
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(journalEntries) { listedJournalEntry in
                    HStack {
                        // Navigation link to view journal entry
                        NavigationLink(destination: JournalEntryDetailView(entry: listedJournalEntry)) {
                            JournalEntryRowView(journalEntryRow: listedJournalEntry)
                        }
                    }
                    .swipeActions {
                        // Swipe action to delete journal entry
                        Button(role: .destructive) {
                            deleteJournalEntry(journalEntry: listedJournalEntry)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .navigationTitle("\(entriesQty) Journal Entries")
            .toolbar {
                // Info button for showing information view
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showInfoView = true  // Show InfoView when info button is tapped
                    }) {
                        Image(systemName: "info.circle")
                    }
                }
                
                // Add button for creating a new journal entry
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showCreateView = true
                    }) {
                        Label("Add item", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showCreateView) {
                CreateJournalEntryView()
            }
            .sheet(isPresented: $showInfoView) {
                InfoView(showInfoView: $showInfoView)  // Present InfoView as a sheet
            }
        }
    }
    
    // Function to delete a journal entry
    private func deleteJournalEntry(journalEntry: JournalEntry) {
        modelContext.delete(journalEntry)  // Delete the journal entry from the data model
    }
}

#Preview {
    ContentView()
        .modelContainer(for: JournalEntry.self, inMemory: true)
}
