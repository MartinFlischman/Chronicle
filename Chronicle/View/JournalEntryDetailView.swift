//
//  JournalEntryDetailView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/06.
//

import SwiftUI

// View to display details of a journal entry
struct JournalEntryDetailView: View {
    let entry: JournalEntry
    @State private var isEditViewPresented = false  // Controls the presentation of the EditJournalEntryView
    @Environment(\.presentationMode) private var presentationMode  // To dismiss the view

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    // Display the date of the journal entry
                    Text(entry.date, style: .date)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text("-")
                        .foregroundStyle(.secondary)
                    // Display the rating as stars
                    Text(String(repeating: "⭐️", count: Int(entry.rating)))
                    Spacer()
                }
                .padding(.bottom, 8)
                
                // Display the text of the journal entry
                Text(entry.text)
                    .font(.body)
            }
        }
        .padding()
        .navigationTitle(entry.title)  // Set the navigation bar title
        .scrollIndicators(.hidden)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                // Button to present the EditJournalEntryView
                Button(action: {
                    isEditViewPresented = true
                }) {
                    Text("Edit")
                        .fontWeight(.bold)
                }
            }
        }
        .sheet(isPresented: $isEditViewPresented) {
            // Present EditJournalEntryView as a sheet
            EditJournalEntryView(editingJournalEntry: entry)
        }
    }
}
