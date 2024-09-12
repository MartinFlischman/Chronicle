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
    @State private var isEditing = false

    var entriesQty: Int {
        journalEntries.count
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(journalEntries) { listedJournalEntry in
                    HStack {
                        if isEditing {
                            Button(action: {
                                deleteJournalEntry(journalEntry: listedJournalEntry)
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                        
                        NavigationLink(destination: EditJournalEntryView(editingJournalEntry: listedJournalEntry)) {
                            JournalEntryRowView(journalEntryRow: listedJournalEntry)
                        }
                    }
                    .swipeActions {
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
                ToolbarItem(placement: .navigationBarLeading) {
                    if entriesQty > 0 {
                        Button(action: {
                            isEditing.toggle()
                        }) {
                            Text(isEditing ? "Done" : "Edit")
                        }
                    }
                }
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
        }
    }
    
    private func deleteJournalEntry(journalEntry: JournalEntry) {
        modelContext.delete(journalEntry)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: JournalEntry.self, inMemory: true)
}
