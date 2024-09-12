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
    @State var editMode = true
    
    var body: some View {
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
                    Button("Delete") {
                        modelContext.delete(editingJournalEntry)
                        dismiss()
                    }
                    .foregroundStyle(.red)
                    Button("Done") {
                        editMode = false
                    }
                    .bold()
                }
        } else {
            JournalEntryDetailView(entry: editingJournalEntry)
                .toolbar {
                    Button("Edit") {
                        editMode = true
                    }
                }
        }
    }
}

#Preview {
    NavigationStack {
        EditJournalEntryView(editingJournalEntry:     JournalEntry(
            title: "Sunny Saturday", date: Date.now.addingTimeInterval(-2 * 24 * 60 * 60),
            rating: 3, text: "Suspendisse a ante feugiat, egestas quam dictum, blandit nisl. Quisque ultricies hendrerit quam, et congue felis scelerisque sed."))
    }
}
