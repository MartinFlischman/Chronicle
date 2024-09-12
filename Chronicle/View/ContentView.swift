//
//  ContentView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/03.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext  // Provides access to the data model context
    @Query(sort: \JournalEntry.date, order: .reverse) private var journalEntries: [JournalEntry]  // Query to fetch journal entries, sorted by date in reverse order
    
    @State var showCreateView = false  // State to control the display of the CreateJournalEntryView

    var entriesQty: Int {
        journalEntries.count  // Returns the number of journal entries
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(journalEntries) { listedJournalEntry in
                    HStack {
                        // Navigation link to edit journal entry
                        NavigationLink(destination: EditJournalEntryView(editingJournalEntry: listedJournalEntry)) {
                            JournalEntryRowView(journalEntryRow: listedJournalEntry)  // View to display journal entry details
                        }
                    }
                    .swipeActions {
                        // Swipe action to delete journal entry
                        Button(role: .destructive) {
                            deleteJournalEntry(journalEntry: listedJournalEntry)  // Action to delete the journal entry
                        } label: {
                            Label("Delete", systemImage: "trash")  // Trash icon and label for delete action
                        }
                    }
                }
            }
            .navigationTitle("\(entriesQty) Journal Entries")  // Navigation bar title showing the count of journal entries
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showCreateView = true  // Show CreateJournalEntryView when button is tapped
                    }) {
                        Label("Add item", systemImage: "plus")  // Plus icon and label for adding a new journal entry
                    }
                }
            }
            .sheet(isPresented: $showCreateView) {
                CreateJournalEntryView()  // Present CreateJournalEntryView as a sheet
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
        .modelContainer(for: JournalEntry.self, inMemory: true)  // Preview with in-memory data model
}
