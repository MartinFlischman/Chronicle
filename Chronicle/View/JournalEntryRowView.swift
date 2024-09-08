//
//  JournalEntryRowView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/07.
//

import SwiftUI

struct JournalEntryRowView: View {
    
    let journalEntryRow: JournalEntry
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(journalEntryRow.title)
                .font(.title2)
            
            Text(journalEntryRow.date, format: .dateTime.day().month().year())
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    List {
        JournalEntryRowView(journalEntryRow: JournalEntry(date: Date(), title: "Sample Entry", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas laoreet ut justo et lacinia. Fusce eu interdum dui, ac vehicula magna.", rating: 2))
    }
}
