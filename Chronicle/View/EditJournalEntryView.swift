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
                    TextField("Title", text: $editingJournalEntry.title)
                    
                    DatePicker("Date", selection: $editingJournalEntry.date,
                               displayedComponents: [.date])
                    
                    Text(String(repeating: "⭐️", count: Int(editingJournalEntry.rating)))
                    Slider(value: $editingJournalEntry.rating, in: 1...3, step: 1)
                    
                    TextEditor(text: $editingJournalEntry.text)
                }
                .navigationTitle("Edit journal entry")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
                            saveChanges()
                        }
                        .bold()
                    }
                }
            } else {
                JournalEntryDetailView(entry: editingJournalEntry)
                    .toolbar {
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
            // Handle the error if saving fails
            print("Failed to save changes: \(error.localizedDescription)")
        }
    }
}

