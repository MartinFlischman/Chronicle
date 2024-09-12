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
                TextField("Title", text: $title)
                
                DatePicker("Date", selection: $date,
                           displayedComponents: [.date])
                
                Text(String(repeating: "⭐️", count: Int(rating)))
                Slider(value: $rating, in: 1...3, step: 1)
                
                TextEditor(text: $text)
            }
            .navigationTitle("New Journal Entry")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
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
