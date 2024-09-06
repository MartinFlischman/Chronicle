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
                Text(entry.date, style: .date)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text("\(entry.text)")
                    .font(.body)
                    .padding(.bottom, 10)
                
                Text(String(repeating: "⭐️", count: entry.rating))
                
//                HStack {
//                    ForEach(1...3, id: \.self) { index in
//                        Image(systemName: index <= entry.rating ? "star.fill" : "star")
//                            .foregroundColor(index <= entry.rating ? .yellow : .gray)
//                    }
//                }
//                .font(.body)
//                .padding(.vertical, 5)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationTitle(entry.title)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    JournalEntryDetailView(entry: JournalEntry(date: Date(), title: "Sample Entry", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas laoreet ut justo et lacinia. Fusce eu interdum dui, ac vehicula magna.", rating: 2))
}
