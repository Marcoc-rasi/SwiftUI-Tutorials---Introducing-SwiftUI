//
//  PageView.swift
//  Landmarks-marcocrasi
//
//  Created by Marcos Uriel Martinez Ortiz on 15/12/23.
//

import SwiftUI

// SwiftUI View representing a container for a set of pages with a PageViewController and PageControl
struct PageView<Page: View>: View {
    // Array holding the views to be displayed as pages
    var pages: [Page]
    
    // State variable to track the current page index
    @State private var currentPage = 0
    
    // Body of the view that defines its appearance and behavior
    var body: some View {
        // ZStack to layer views, with alignment set to bottomTrailing
        ZStack(alignment: .bottomTrailing) {
            // Commented out Button for potential interactivity, which increments the currentPage
            /*
            Button("Hello") {
                currentPage += 1
            }
            */
            
            // PageViewController to manage the pages
            PageViewController(pages: pages, currentPage: $currentPage)
            
            // PageControl to display page indicators
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 20)) // Set the frame width based on the number of pages
                .padding(.trailing) // Add trailing padding
                .navigationTitle("Switch View")
        }
        // Set the aspect ratio and content mode for the entire PageView
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}


#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}
