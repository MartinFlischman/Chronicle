//
//  JournalEntryRowView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/07.
//

import SwiftUI

// View for displaying a row of a journal entry
struct JournalEntryRowView: View {
    
    // Journal entry data to display
    let journalEntryRow: JournalEntry
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title of the journal entry
            Text(journalEntryRow.title)
                .font(.title2)
            
            // Date of the journal entry
            Text(journalEntryRow.date, format: .dateTime.day().month().year())
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    // Preview with a sample journal entry
    List {
        JournalEntryRowView(journalEntryRow: JournalEntry(title: "Sample Entry", date: Date(), rating: 2, text: "Sample text"))
    }
}
