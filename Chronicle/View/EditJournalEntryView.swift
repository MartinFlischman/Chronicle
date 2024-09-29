//
//  EditJournalEntryView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/12.
//

import SwiftUI

// MARK: View for editing an existing journal entry
struct EditJournalEntryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    // State variable for the journal entry being edited
    @State var editingJournalEntry: JournalEntry
    @State private var editMode = true  // Controls whether the view is in edit mode
    
    var body: some View {
        NavigationStack {
            if editMode {
                Form {
                    // MARK: Input field for editing the journal entry title
                    TextField("Title", text: $editingJournalEntry.title)
                    
                    // MARK: Date picker for editing the journal entry date
                    DatePicker("Date", selection: $editingJournalEntry.date,
                               displayedComponents: [.date])
                    
                    // MARK: Display and adjust the rating with stars and a slider
                    Text(String(repeating: "⭐️", count: Int(editingJournalEntry.rating)))
                    Slider(value: $editingJournalEntry.rating, in: 1...3, step: 1)
                    
                    // MARK: Text editor for editing the main content of the journal entry
                    TextEditor(text: $editingJournalEntry.text)
                }
                .navigationTitle("Edit Entry")  // Title for edit mode
                .toolbar {
                    // MARK: Done button to save changes and exit edit mode
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
                            saveChanges()  // Save changes when done is pressed
                        }
                        .bold()  // Make the Done button text bold
                    }
                }
            } else {
                // MARK: Display the journal entry details when not in edit mode
                JournalEntryDetailView(entry: editingJournalEntry)
                    .toolbar {
                        // MARK: Edit button to switch to edit mode
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Edit") {
                                editMode = true  // Switch back to edit mode
                            }
                        }
                    }
            }
        }
    }
    
    // MARK: Function to save changes and dismiss the view
    private func saveChanges() {
        do {
            try modelContext.save()  // Attempt to save the changes
            dismiss()  // Dismiss the view after saving
        } catch {
            // Print an error message if saving fails
            print("Failed to save changes: \(error.localizedDescription)")
        }
    }
}
