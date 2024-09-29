//
//  ContentView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/03.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // MARK: Environment Variables
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \JournalEntry.date, order: .reverse) private var journalEntries: [JournalEntry]
    
    // MARK: State Variables
    @State private var showCreateView = false  // Controls the display of the CreateJournalEntryView
    @State private var showInformationView = false    // Controls the display of the InformationView
    @State private var searchText = "" // Holds the search text entered by the user
    
    // MARK: Computed Properties
    var entriesQty: Int {
        journalEntries.count  // Returns the number of journal entries
    }
    
    var body: some View {
        NavigationStack {
            // MARK: Main List
            List {
                ForEach(searchResults) { listedJournalEntry in
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
                // MARK: Toolbar Items
                // Info button for showing information view
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showInformationView = true  // Show InformationView when info button is tapped
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
            .sheet(isPresented: $showInformationView) {
                InformationView(showInformationView: $showInformationView)  // Present InformationView as a sheet
                    .presentationDragIndicator(.visible)
            }
        }
        .searchable(text: $searchText, prompt: "Search for a journal entry") // Adds search functionality with a prompt
    }
    
    // MARK: Search Results
    var searchResults: [JournalEntry] {
        // Return all journal entries if search text is empty, otherwise filter entries by title or text
        if searchText.isEmpty {
            return journalEntries
        } else {
            return journalEntries.filter { $0.title.lowercased().contains(searchText.lowercased()) || $0.text.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    // MARK: Delete Function
    // Function to delete a journal entry
    private func deleteJournalEntry(journalEntry: JournalEntry) {
        modelContext.delete(journalEntry)  // Delete the journal entry from the data model
    }
}

#Preview {
    ContentView()
        .modelContainer(for: JournalEntry.self, inMemory: true)
}
