//
//  CreateJournalEntryView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/10.
//

import SwiftUI

// MARK: View for creating a new journal entry
struct CreateJournalEntryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    // MARK: State variables for journal entry properties
    @State var title: String = ""
    @State var date: Date = Date()
    @State var rating: Double = 3.0
    @State var text: String = "Today..."
    
    var body: some View {
        NavigationStack {
            Form {
                // MARK: Input field for title
                TextField("Title", text: $title)
                
                // MARK: Date picker for entry date
                DatePicker("Date", selection: $date, displayedComponents: [.date])
                
                HStack {
                    // MARK: Display stars based on the rating
                    ForEach(1...3, id: \.self) { index in
                        Image(systemName: index <= Int(rating) ? "star.fill" : "star")
                            .foregroundColor(index <= Int(rating) ? .yellow : .gray)
                            .font(.system(size: 20))
                            .frame(width: 20, height: 20)
                    }
                }
                
                // MARK: Slider for adjusting rating
                Slider(value: $rating, in: 1...3, step: 1)
                
                // MARK: Text editor for journal entry content
                TextEditor(text: $text)
            }
            .navigationTitle("New Journal Entry") // MARK: Title for the navigation
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    // MARK: Button to dismiss the view
                    Button("Cancel") {
                        dismiss() // Dismiss the view when cancel is pressed
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    // MARK: Button to save the journal entry
                    Button("Save") {
                        let newJournalEntry = JournalEntry(title: title, date: date, rating: rating, text: text)
                        modelContext.insert(newJournalEntry) // Insert new journal entry into the model context
                        dismiss() // Dismiss the view after saving
                    }
                }
            }
        }
    }
}

#Preview {
    CreateJournalEntryView()
}
