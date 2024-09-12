//
//  JournalEntryDetailView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/06.
//

import SwiftUI

struct JournalEntryDetailView: View {
    let entry: JournalEntry
    @State private var isEditViewPresented = false  // State to control the presentation of the EditJournalEntryView
    
    @Environment(\.presentationMode) private var presentationMode  // To dismiss the view

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(entry.date, style: .date)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text("-")
                        .foregroundStyle(.secondary)
                    Text(String(repeating: "⭐️", count: Int(entry.rating)))
                    Spacer()
                }
                .padding(.bottom, 8)
                
                Text("\(entry.text)")
                    .font(.body)
            }
        }
        .padding()
        .navigationTitle(entry.title)
        .scrollIndicators(.hidden)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isEditViewPresented = true  // Present the EditJournalEntryView when tapped
                }) {
                    Text("Edit")
                        .fontWeight(.bold)  // Style for the Edit button
                }
            }
        }
        .sheet(isPresented: $isEditViewPresented) {
            EditJournalEntryView(editingJournalEntry: entry)  // Present EditJournalEntryView as a sheet
        }
    }
}
