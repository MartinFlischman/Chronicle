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
            VStack(alignment: .leading, spacing: 20) {
                // Information about star ratings
                Text("1. Here’s what each star rating means for your journal entries:")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                Text("⭐ **1 Star**: Indicates a bad day. Use this rating to mark days that didn’t go well.")
                    .font(.body)
                
                Text("⭐⭐ **2 Stars**: Represents an average day. This rating is for days that were neither particularly good nor bad.")
                    .font(.body)
                
                Text("⭐⭐⭐ **3 Stars**: Signifies a great day. Choose this rating for days that were outstanding and positive.")
                    .font(.body)
                
                // Numbered item with instructions
                Text("2. Swipe left on any journal entry to delete it.")
                    .font(.headline)
                    .padding(.top, 20)
                
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

