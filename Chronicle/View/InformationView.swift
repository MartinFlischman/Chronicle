//
//  InformationView.swift
//  Chronicle
//
//  Created by Martin on 2024/09/12.
//

import SwiftUI

// MARK: View for displaying app information
struct InformationView: View {
    @Binding var showInformationView: Bool // Binding to control visibility of the information view
    
    var body: some View {
        List {
            // MARK: App Header Section
            Section {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Spacer()
                        
                        // App icon image
                        Image("AppIconImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .cornerRadius(8)
                        
                        // App title
                        Text("Chronicle")
                            .font(.system(size: 48))
                            .fontWeight(.black)
                            .foregroundColor(.indigo)
                        
                        Spacer()
                    }
                    .padding(.top, 16)
                    
                    // MARK: App Description Section
                    VStack(alignment: .center, spacing: 8) {
                        Text("Record daily experiences and track your mood")
                        Text("Create, view, and manage entries effortlessly")
                        Text("Rate each day with our star system")
                        Text("Search your past entries to relive memories")
                        
                        // Descriptive text about the app's purpose
                        Text("Chronicle helps you capture life's moments, big and small!")
                            .foregroundColor(.indigo)
                            .font(.title3)
                            .fontWeight(.heavy)
                            .italic()
                            .multilineTextAlignment(.center)
                            .padding(.top, 16)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 16)
                    .frame(maxWidth: .infinity)
                }
            }
            
            // MARK: Star Ratings Section
            Section(header: Text("Star Ratings")) {
                // Description for 1 star
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .frame(width: 20, height: 20)
                    Text("1 Star")
                        .foregroundColor(.yellow)
                    Spacer()
                    Text("Bad day")
                }
                
                // Description for 2 stars
                HStack {
                    ForEach(0..<2) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .frame(width: 20, height: 20)
                    }
                    Text("2 Stars")
                        .foregroundColor(.yellow)
                    Spacer()
                    Text("Average day")
                }
                
                // Description for 3 stars
                HStack {
                    ForEach(0..<3) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .frame(width: 20, height: 20)
                    }
                    Text("3 Stars")
                        .foregroundColor(.yellow)
                    Spacer()
                    Text("Great day")
                }
            }
            .listRowSeparator(.hidden) // Hide row separators
            
            // MARK: Deleting an Entry Section
            Section(header: Text("Deleting an Entry")) {
                VStack(alignment: .leading) {
                    // Instructions for deletion
                    Text("Swipe left on an entry to delete it.")
                        .padding(.bottom, 4)
                    
                    // Warning about deletion
                    Text("*This action is permanent and can't be undone.")
                        .font(.footnote)
                        .bold()
                        .foregroundColor(.red)
                }
            }
            .listRowSeparator(.hidden) // Hide row separators
            
            // MARK: Additional Information Section
            Section(header: Text("App Information"), footer: Text("Copyright © 2024 MartinCodes. All rights reserved.")
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.top, 16)) {
                
                // Various informational rows using CustomListRowView
                CustomListRowView(rowLabel: "App Version", rowContent: "Version: 1.0", rowIcon: "iphone", rowTintColor: .primary)
                
                CustomListRowView(rowLabel: "Age Rating", rowContent: "Age Rating: 12+", rowIcon: "figure", rowTintColor: .primary)
                
                CustomListRowView(rowLabel: "Developer", rowContent: "Developer: MartinCodes", rowIcon: "swift", rowTintColor: .primary)
                
                // Developer website link
                CustomListRowView(rowLabel: "Developer Website", rowLinkLabel: "Developer Website", rowLinkDestination: "https://github.com/MartinFlischman/Chronicle", rowIcon: "globe", rowTintColor: .indigo)
                
                // Report a problem link
                CustomListRowView(rowLabel: "Report a Problem", rowLinkLabel: "Report a Problem", rowLinkDestination: "mailto:martincodes@icloud.com?subject=Report%20a%20Problem%20-%20Chronicle", rowIcon: "exclamationmark.circle", rowTintColor: .indigo)
            }

        }
    }
}

#Preview {
    InformationView(showInformationView: .constant(true))
}
