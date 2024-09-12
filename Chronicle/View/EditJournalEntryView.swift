//
//  EditJournalEntryView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/12.
//

import SwiftUI

struct EditJournalEntryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var editingJournalEntry: JournalEntry
    @State private var editMode = true
    
    var body: some View {
        NavigationStack {
            if editMode {
                Form {
                    // Input field for editing the journal entry title
                    TextField("Title", text: $editingJournalEntry.title)
                    
                    // Date picker for editing the journal entry date
                    DatePicker("Date", selection: $editingJournalEntry.date,
                               displayedComponents: [.date])
                    
                    // Display and adjust the rating with stars and a slider
                    Text(String(repeating: "⭐️", count: Int(editingJournalEntry.rating)))
                    Slider(value: $editingJournalEntry.rating, in: 1...3, step: 1)
                    
                    // Text editor for editing the main content of the journal entry
                    TextEditor(text: $editingJournalEntry.text)
                }
                .navigationTitle("Edit journal entry")
                .toolbar {
                    // Done button to save changes and exit edit mode
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
                            saveChanges()
                        }
                        .bold()
                    }
                }
            } else {
                // Display the journal entry details when not in edit mode
                JournalEntryDetailView(entry: editingJournalEntry)
                    .toolbar {
                        // Edit button to switch to edit mode
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Edit") {
                                editMode = true
                            }
                        }
                    }
            }
        }
    }
    
    private func saveChanges() {
        // Save changes to the model context
        do {
            try modelContext.save()
            dismiss()  // Dismiss the view after saving changes
        } catch {
            // Print an error message if saving fails
            print("Failed to save changes: \(error.localizedDescription)")
        }
    }
}
