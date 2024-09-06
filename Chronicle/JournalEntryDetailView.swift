//
//  JournalEntryDetailView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/06.
//

import SwiftUI

struct JournalEntryDetailView: View {
    let entry: JournalEntry
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(entry.date, style: .date)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text("-")
                        .foregroundStyle(.secondary)
                    Text(String(repeating: "⭐️", count: entry.rating))
                }
                .padding(.bottom, 8)
                
                Text("\(entry.text)")
                    .font(.body)
            }
        }
        .padding()
        .navigationTitle(entry.title)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    JournalEntryDetailView(entry: JournalEntry(date: Date(), title: "Sample Entry", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas laoreet ut justo et lacinia. Fusce eu interdum dui, ac vehicula magna.", rating: 2))
}
