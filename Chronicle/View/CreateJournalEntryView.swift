//
//  CreateJournalEntryView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/10.
//

import SwiftUI

struct CreateJournalEntryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var title: String = ""
    @State var date: Date = Date()
    @State var rating: Double = 3.0
    @State var text: String = "Today..."
    
    var body: some View {
        NavigationStack {
            Form {
                // Input field for the journal entry title
                TextField("Title", text: $title)
                
                // Date picker for selecting the journal entry date
                DatePicker("Date", selection: $date,
                           displayedComponents: [.date])
                
                // Display and adjust the rating with stars and a slider
                Text(String(repeating: "⭐️", count: Int(rating)))
                Slider(value: $rating, in: 1...3, step: 1)
                
                // Text editor for the main content of the journal entry
                TextEditor(text: $text)
            }
            .navigationTitle("New Journal Entry")
            .toolbar {
                // Cancel button to dismiss the view without saving
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                // Save button to create a new journal entry and dismiss the view
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let newJournalEntry = JournalEntry(title: title, date: date, rating: rating, text: text)
                        modelContext.insert(newJournalEntry)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    CreateJournalEntryView()
}
