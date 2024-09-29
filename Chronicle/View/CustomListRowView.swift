//
//  CustomListRowView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/28.
//

import SwiftUI

// MARK: Custom list row view for displaying information
struct CustomListRowView: View {
    @State var rowLabel: String // Label for the row
    @State var rowContent: String? = nil // Optional content for the row
    @State var rowLinkLabel: String? = nil // Optional link label for a clickable link
    @State var rowLinkDestination: String? = nil // Optional URL destination for the link
    @State var rowIcon: String // Icon name for the row
    @State var rowTintColor: Color // Tint color for the icon and text
    
    var body: some View {
        HStack {
            // MARK: Display content based on available properties
            if let content = rowContent {
                // Display content if available
                Text(content)
                    .foregroundColor(.primary)
            } else if let linkLabel = rowLinkLabel, let linkDestination = rowLinkDestination, let url = URL(string: linkDestination) {
                // Display a clickable link if link properties are provided
                Link(linkLabel, destination: url)
                    .foregroundColor(rowTintColor) // Use rowTintColor for the link text
                    .fontWeight(.bold) // Optional: make the link text bold
            } else {
                // Default to displaying the row label if no other content is provided
                Text(rowLabel)
                    .foregroundColor(rowTintColor) // Use rowTintColor for the row label
            }
            
            Spacer() // Add space between content and icon
            
            // Display the icon with the specified tint color
            Image(systemName: rowIcon)
                .foregroundColor(rowTintColor) // Use rowTintColor for the icon
                .font(.system(size: 16, weight: .semibold))
        }
    }
}

#Preview {
    // Preview for the CustomListRowView in a List
    List {
        CustomListRowView(rowLabel: "Report a Problem", rowLinkLabel: "Report a Problem", rowLinkDestination: "mailto:martincodes@icloud.com?subject=Report%20a%20Problem%20-%20Chronicle", rowIcon: "exclamationmark.circle", rowTintColor: .indigo)
    }
}
