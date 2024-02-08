//
//  PageControl.swift
//  Landmarks-marcocrasi
//
//  Created by Marcos Uriel Martinez Ortiz on 16/12/23.
//

import SwiftUI
import UIKit

// UIViewRepresentable structure representing a page control for SwiftUI
struct PageControl: UIViewRepresentable {
    // Total number of pages in the page control
    var numberOfPages: Int
    
    // Binding to track the current page index
    @Binding var currentPage: Int
    
    // Function to create a coordinator for the PageControl
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    // Implementation of the UIViewRepresentable protocol's makeUIView method
    func makeUIView(context: Context) -> UIPageControl {
        // Create a UIPageControl
        let control = UIPageControl()
        
        // Set the total number of pages for the control
        control.numberOfPages = numberOfPages
        
        // Add a target to the control, linking it to the Coordinator's updateCurrentPage method
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged
        )
        
        // Return the configured UIPageControl
        return control
    }

    // Implementation of the UIViewRepresentable protocol's updateUIView method
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        // Update the current page displayed on the UIPageControl
        uiView.currentPage = currentPage
    }

    
    // Coordinator class to handle events from the UIPageControl
    class Coordinator: NSObject {
        // Reference to the PageControl being coordinated
        var control: PageControl
        
        // Initializer that sets the PageControl reference
        init(_ control: PageControl) {
            self.control = control
        }
        
        // Selector function to update the current page index when the UIPageControl value changes
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
