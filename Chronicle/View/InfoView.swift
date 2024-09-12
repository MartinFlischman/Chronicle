//
//  InfoView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/12.
//

import SwiftUI

struct InfoView: View {
    @Binding var showInfoView: Bool  // Binding to control dismissing the view
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 5) {
                // Numbered item with instructions
                Text("1. Swipe left on any journal entry to delete it.")
                    .font(.body)
                
                // Additional information with red text
                Text("(This action is permanent and cannot be undone.)")
                    .font(.callout)
                    .foregroundStyle(.red)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Information")  // Set the title of the view
            .navigationBarTitleDisplayMode(.inline)  // Title aligns with content
            .toolbar {
                // Button to dismiss the InfoView
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showInfoView = false
                    }) {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

#Preview {
    InfoView(showInfoView: .constant(true))
}
