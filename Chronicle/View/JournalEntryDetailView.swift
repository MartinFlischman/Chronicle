//
//  JournalEntryDetailView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/06.
//

import SwiftUI

// MARK: View to display details of a journal entry
struct JournalEntryDetailView: View {
    let entry: JournalEntry
    @State private var isEditViewPresented = false  // MARK: Controls the presentation of the EditJournalEntryView
    @Environment(\.presentationMode) private var presentationMode  // MARK: To dismiss the view

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    // MARK: Display the date of the journal entry
                    Text(entry.date, style: .date)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text("-")
                        .foregroundStyle(.secondary)
                    // MARK: Display the rating as stars
                    Text(String(repeating: "⭐️", count: Int(entry.rating)))
                    Spacer()
                }
                .padding(.bottom, 8)
                
                // MARK: Display the text of the journal entry
                Text(entry.text)
                    .font(.body)
            }
        }
        .padding()
        .navigationTitle(entry.title)  // MARK: Set the navigation bar title
        .scrollIndicators(.hidden)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                // MARK: Button to present the EditJournalEntryView
                Button(action: {
                    isEditViewPresented = true
                }) {
                    Text("Edit")
                        .fontWeight(.bold)
                }
            }
        }
        .sheet(isPresented: $isEditViewPresented) {
            // MARK: Present EditJournalEntryView as a sheet
            EditJournalEntryView(editingJournalEntry: entry)
        }
    }
}
