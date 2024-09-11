//
//  CreateJournalEntryView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/10.
//

import SwiftUI

struct CreateJournalEntryView: View {
    
    @State var title: String = ""
    @State var date: Date = Date()
    @State var rating: Double = 3.0
    @State var text: String = "Today..."
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            
            DatePicker("Date", selection: $date,
                       displayedComponents: [.date])
            
            Text(String(repeating: "⭐️", count: Int(rating)))
            Slider(value: $rating, in: 1...3, step: 1)
            
            TextEditor(text: $text)
        }
    }
}

#Preview {
    CreateJournalEntryView()
}
