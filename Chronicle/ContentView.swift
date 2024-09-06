//
//  ContentView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/03.
//

import SwiftUI

struct ContentView: View {
    
    var entriesQty: Int {
        journalEntries.count
    }
    
    var body: some View {
        NavigationStack {
            List(journalEntries) { listedJournalEntry in
                NavigationLink(destination: JournalEntryDetailView(entry: listedJournalEntry)) {
                    Text(listedJournalEntry.title)
                }
            }
            .navigationTitle("\(entriesQty) Journal Entries")
        }
    }
}

#Preview {
    ContentView()
}
